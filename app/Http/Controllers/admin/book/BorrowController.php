<?php

namespace App\Http\Controllers\admin\book;

use App\Events\BorrowRequestStatusChanged;
use App\Http\Controllers\Controller;
use App\Models\Book;
use App\Models\BorrowBook;
use App\Repositories\SaveRepository;
use App\Repositories\ValidationRepository;
use Illuminate\Http\Request;
use Yajra\DataTables\Facades\DataTables;

class BorrowController extends Controller
{
    private $vr;
    private $save;
    public function __construct(ValidationRepository $validationRepository, SaveRepository $saveRepository)
    {
        $this->vr   = $validationRepository;
        $this->save = $saveRepository;
    }

    public function index()
    {
        return view('admin.book.borrow');
    }

    public function datatable()
    {
        $info = BorrowBook::with('createdby', 'updatedby', 'deletedby','user','book')->orderby('id', 'DESC');

        return DataTables::of($info)
            ->editColumn('book_id', function ($data) {
                return $data->book->name;
            })
            ->editColumn('user_id', function ($data) {
                return $data->user->name;
            })

          ->filterColumn('book_id', function ($query, $keyword) {
                $query->where(function ($subQuery) use ($keyword) {
                    $subQuery->whereHas('book', function ($subSubQuery) use ($keyword) {
                        $subSubQuery->where('name', 'like', '%' . $keyword . '%')
                            ->orWhere('book_code', 'like', '%' . $keyword . '%')
                            ->orWhere('sku', 'like', '%' . $keyword . '%');
                    });
                });
            })
            ->filterColumn('user_id', function ($query, $keyword) {
                $query->where(function ($subQuery) use ($keyword) {
                    $subQuery->whereHas('user', function ($subSubQuery) use ($keyword) {
                        $subSubQuery->where('name', 'like', '%' . $keyword . '%')
                            ->orWhere('email', 'like', '%' . $keyword . '%');
                    });
                });
            })

            ->editColumn('information', function ($data) {
                $html = '';
                if (!empty($data->borrow_date)) {
                    $html .= '<span > <strong>'. __('msg.borrow_date'). ' :  </strong>' . ($data->borrow_date) . '</span>';
                }
                if (!empty($data->quantity)) {
                    $html .= '<br> <strong>' . __('msg.quantity') . ' : </strong>' . $data->quantity;
                }
                return $html;
            })
            ->editColumn('deleted_at', function ($data) {
                if (empty($data->status == 1)) {
                    return '<span class="badge bg-success">' . __('msg.pending') . '</span>';
                } else if( empty($data->status == 0)) {
                    return '<span class="badge bg-success">' . __('msg.approved') . '</span>'; 
                }
            })
            ->editColumn('created_at', function ($data) {
                 $html = '<span class="badge badge-pill bg-success">' . $data->created_at . '</span>';
                if (!empty($data->createdby)) {
                    $html .= '<br><span class="badge bg-success">' . $data->createdby->name . '</span>';
                }
                if ($data->created_at != $data->updated_at) {
                    $html .= '<br><span class="badge badge-pill bg-warning mt-1" style="margin-top: 5px">' . $data->updated_at . '</span>';
                    if (!empty($data->updatedby)) {
                        $html .= '<br><span class="badge bg-warning">' . $data->updatedby->name . '</span>';
                    }
                }
                return $html;
            })


            ->addColumn('action', function ($data) {
                $accept = route('borrow.accept', $data->id);
                $reject = route('borrow.reject', $data->id);

                $html = '<div class="text-center">';
                    if( $data->status == 0) {
                        $html .= '<a  href="' . $accept . '">' . '<i class="fas fa-check"></i>' . '</a>';
                        $html .= '<a onclick="return confirm(\'' . __('msg.reject_this_request?') . ' \')" href="' . $reject . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;

                    } else {
                        
                        $html .= '<a onclick="return confirm(\'' . __('msg.reject_this_request?') . ' \')" href="' . $reject . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;
                    }
                 
                $html .= '</div></div>';
                return $html;
            })
            ->rawColumns(['book_id','user_id', 'deleted_at', 'created_at', 'information', 'action'])
            ->make(true);
    }

    public function accept($id)
    {
        $info = BorrowBook::find($id);
        event(new BorrowRequestStatusChanged($info));
        $info->status = 1;
        $info->save();

        $book_id = $info->book_id;
        $book = Book::find($book_id);
        $book->quantity = $book->quantity - $info->quantity;
        $book->save();



        return redirect()->back()->with('success', __('msg.request_accepted'));
    }

    public function reject($id)
    {
        $info = BorrowBook::find($id);

        event(new BorrowRequestStatusChanged($info));

        $info->status = 2; #rejected
        $info->save();
        $info->delete();


        return redirect()->back()->with('success', __('msg.request_rejected'));
    }
}
