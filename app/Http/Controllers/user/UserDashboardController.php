<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\BorrowBook;
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
}
