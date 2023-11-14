<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\BorrowBook;
use App\Models\BorrowBookHistory;
use App\Models\Log;
use App\Models\User;
use App\Notifications\BorrowRequestNotification;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\DB;

class UserDashboardController extends Controller
{
    public function index()
    {
        $user = Auth::user()->id;
        $current_user = User::find($user);
        $datas = Book::with('media','authors')->withTrashed()->get();
        return view('user.dashboard',compact('current_user','datas'));
    }

    public function bookSearch (Request $request)
    {
        $user = Auth::user()->id;
        $current_user = User::find($user);
        $datas = Book::with('media', 'authors')
            ->withTrashed()
            ->where(function ($query) use ($request) {
                $keyword = $request->search;
        
                $query->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('book_code', 'like', '%' . $keyword . '%')
                    ->orWhere('sku', 'like', '%' . $keyword . '%')
                    ->orWhereHas('authors', function ($subQuery) use ($keyword) {
                        $subQuery->where('name', 'like', '%' . $keyword . '%');
                    });
                })->get();
            return view('user.dashboard',compact('current_user','datas'));
    }

    public function borrowRequest(Request $request) {
        $book = Book::find($request->book_id);
        $user = Auth::user()->id;
       
        if($book->quantity < $request->quantity) {
            return response()->json([
              'error'   =>  'Quantity is not enough'
            ]);
        } else {
            $data = [
                'book_id'       => $request->book_id,
                'user_id'       => $user,
                'borrow_date'   => $request->borrow_date,
                'quantity'      => $request->quantity,
                'borrow_date'   => date('Y-m-d'),
                'status'        => 0, #pending
                'created_by'    => $user,
            ];
        }
        DB::beginTransaction();
        try {
            BorrowBook::create($data);

            Log::create([
                'user_id'       => $user,
                'role_id'       => 3, #user
                'msg'           => 'New Borrow Request',
                'created_by'    => $user,
            ]);
            DB::commit();
            
            
            return response()->json([
                'success' => 'Borrow request has been sent'
            ]);

        } catch (Exception $e) {
            DB::rollBack();
            return response()->json([
                'error' => $e->getMessage()
            ]);
        }
    }

    public function borrowHistory() {
        $user = Auth::user()->id;
        $current_user = User::find($user);
        $datas = BorrowBook::with('book')->where('user_id',$user)->orderBy('borrow_date','asc')->get();
        return view('user.borrow-history',compact('current_user','datas'));
    }

    public function returnBook ($id) {
        $user = Auth::user()->id;
        $borrow_book = BorrowBook::find($id);

        $book = Book::find($borrow_book->book_id);


        DB::beginTransaction();
        try {
            $borrow_book->update([
                'is_returned'   => 1,
                'return_date'   => date('Y-m-d'),
            ]);

            $book->update([
                'quantity'  => $book->quantity + $borrow_book->quantity,
            ]);
            DB::commit();

            return redirect()->back()->with(['success' => 'Data  Update Successfully']);
        
        } catch (Exception $e) {
            DB::rollBack();
            return redirect()->back()->with(['error' => $e->getMessage()]);
        }
    }
    public function editBorrowRequest (Request $request) {
        $user = Auth::user()->id;
        $book = Book::find($request->book_id);
        $quantity = $request->quantity;
        $borrow_book = BorrowBook::find($request->borrow_book_id);

        if($book->quantity < $quantity) {
            return response()->json([
              'error'   =>  'Your quantity is  higher than available stock!'
            ]);
        } else {
            $data = [
                'borrow_book_id'    => $request->borrow_book_id,
                'user_id'           => $borrow_book->user_id,
                'borrow_date'       => date('Y-m-d'),
                'prev_quantity'     => $borrow_book->quantity,
                'new_quantity'      => $quantity,
                'created_by'        => $user,
            ];

            DB::beginTransaction();
            try {
                $borrow_book->update([
                    'quantity'  => $quantity,
                ]);
                BorrowBookHistory::create($data);
                DB::commit();
    
                return response()->json([
                    'success' => 'Borrow request has been updated'
                ]);
            } catch (Exception $e) {
                DB::rollBack();
                return response()->json([
                    'error' => $e->getMessage()
                ]);
            }

        }
    }

    public function fetchBorrowHistory(Request $request)
    {
        $borrowBookId = $request->input('borrow_book_id');
    
        $historyData = BorrowBookHistory::where('borrow_book_id', $borrowBookId)->get();
    
        return view('user.render._borrow_book_history', ['historyData' => $historyData]);
    }


}
