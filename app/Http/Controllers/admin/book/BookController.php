<?php

namespace App\Http\Controllers\admin\book;

use App\Http\Controllers\Controller;
use App\Models\Author;
use App\Models\Book;
use App\Repositories\SaveRepository;
use App\Repositories\ValidationRepository;
use Illuminate\Http\Request;
use yajra\Datatables\DataTables;


class BookController extends Controller
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
        $authors = Author::withTrashed()->get();
        return view('admin.book.index',compact('authors'));
    }

    public function save(Request $request, $id = null)
    {
        $this->vr->isValidBook($request,$id);
        if ($request->hasFile('image')) {
            $this->vr->isValidfile($request);
        }

        $status = $this->save->Book($request,$id);
        if ($status == 'success') {
            if (!empty($id)) {
                return redirect(route('books'))->with(['success' => 'successfully saved']);
            }
            return back()->with(['success' => 'successfully saved']);
        } else {
            return back()->with(['errors_' => $status]);
        }
    }

    public function datatable()
    {
        $info = Book::withTrashed()->with('media','createdby', 'updatedby', 'deletedby','authors')->orderby('id', 'DESC');

        return DataTables::of($info)
            ->editColumn('image',function ($data){
                if(!empty($data->media)){
                    return '<img src="data:'.$data->media->attachment.'" class="img-thumbnail">';
                }
                return '<img src="'.asset('images/dafault.jpg').'" class="img-thumbnail">';
            })
            ->editColumn('name', function ($data) {
                return ConvertToLang($data);
            })
            ->filterColumn('name', function ($query, $keyword) {
                $query->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('book_code', 'like', '%' . $keyword . '%')
                    ->orWhere('phone', 'like', '%' . $keyword . '%')
                    ->orWhere('sku', 'like', '%' . $keyword . '%');
            })
            ->editColumn('information', function ($data) {
                $html = '';
                if (!empty($data->book_code)) {
                    $html .= '<span > <strong>'. __('msg.book_code'). ' :  </strong>' . ($data->book_code) . '</span>';
                }
                if (!empty($data->publish_year)) {
                    $html .= '<br> <strong>' . __('msg.publish_year') . ' : </strong>' . $data->publish_year;
                }
                if (!empty($data->isbn)) {
                    $html .= '<br><strong>' . __('msg.isbn') . ' : </strong>' . $data->isbn;
                }
                if (!empty($data->regular_price)) {
                    $html .= '<br><strong>' . __('msg.regular_price') . ' : </strong>' . $data->regular_price;
                }
                if (!empty($data->offer_price)) {
                    $html .= '<br><strong>' . __('msg.offer_price') . ' :</strong>' . $data->offer_price;
                }
                if (!empty($data->quantity)) {
                    $html .= '<br><strong>' . __('msg.quantity') . ' :</strong>' . $data->quantity;
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
                $edit_url = route('books.edit', $data->id);
                $block = route('books.block', $data->id);
                $unblock = route('books.unblock', $data->id);

                $html = '<div class="text-center">';

                    if (empty($data->deleted_at)) {
                        $html .= '<a  href="' . $edit_url . '">' . '<i class="fas fa-edit"></i>' . '</a>';
                 
                            $html .= '<a onclick="return confirm(\'' . __('msg.block_this_book?') . ' \')" href="' . $block . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;
                       
                    } else {
                        $html .= '<a onclick="return confirm(\'' . __('msg.unblock_this_book?') . ' \')" href="' . $unblock . '">' . '<i class="fas fa-unlock text-success"></i>' . '</a>';
                    }
               
                $html .= '</ul></div>';
                return $html; 
            })
            ->rawColumns(['image','name', 'deleted_at', 'created_at', 'information', 'action'])
            ->make(true);
    }

    public function edit($id)
    {
        $record = Book::where('id', $id)->firstOrFail();
        $authors = Author::withTrashed()->get();
        return view('admin.book.index',compact('record','authors'));
    }

    public function block($id)
    {
        $status = $this->save->BlockBook($id);
        if ($status == 'success') {
            return redirect(route('books'))->with(['success' => 'successfully saved']);
        } else {
            return back()->with(['errors_' => $status]);
        }
    }

    public function unblock($id)
    {
        $status = $this->save->UnblockBook($id);
        if ($status == 'success') {
            return redirect(route('books'))->with(['success' => 'successfully saved']);
        } else {
            return back()->with(['errors_' => $status]);
        }
    }
}
