<?php

namespace App\Http\Controllers\admin\book;

use App\Http\Controllers\Controller;
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
        $info = BorrowBook::withTrashed()->with('createdby', 'updatedby', 'deletedby','user','book')->orderby('id', 'DESC');

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
                if (empty($data->deleted_at)) {
                    return '<span class="badge bg-success">' . __('msg.running') . '</span>';
                } else {
                    $html= '<p class="text-center"><span class="badge bg-danger">'.__('msg.closed').'</span>';
                    if ($data->deletedby) {
                        $html.= '<br><span class="badge bg-danger mt-1">'.$data->deletedby->name.'</span></p>';
                    }
                    return $html;
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

                    if (empty($data->deleted_at)) {
                        $html .= '<a onclick="return confirm(\'' . __('msg.accept_this_request?') . ' \')" href="' . $accept . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;
                    } else {
                        $html .= '<a onclick="return confirm(\'' . __('msg.reject_this_request?') . ' \')" href="' . $reject . '">' . '<i class="fas fa-unlock text-success"></i>' . '</a>';
                    }
               
                $html .= '</ul></div>';
                return $html; 
            })
            ->rawColumns(['book_id','user_id', 'deleted_at', 'created_at', 'information', 'action'])
            ->make(true);
    }
}
