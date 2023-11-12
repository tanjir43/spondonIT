<?php

namespace App\Http\Controllers\admin\author;

use App\Http\Controllers\Controller;
use App\Models\Author;
use App\Models\User;
use App\Repositories\SaveRepository;
use App\Repositories\ValidationRepository;
use Illuminate\Http\Request;
use yajra\Datatables\DataTables;

class AuthorController extends Controller
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
        return view('admin.author.index');
    }

    public function save(Request $request, $id = null)
    {
        $this->vr->isValidAuthor($request,$id);
        
        $status = $this->save->Author($request,$id);
        if ($status == 'success') {
            if (!empty($id)) {
                return redirect(route('author-list'))->with(['success' => 'successfully saved']);
            }
            return back()->with(['success' => 'successfully saved']);
        } else {
            return back()->with(['errors_' => $status]);
        }
    } 
    
    public function datatable()
    {
        $info = Author::withTrashed()->orderby('id', 'DESC');
        return DataTables::of($info)
            ->editColumn('name', function ($data) {
                return ConvertToLang($data);
            })
            ->filterColumn('name', function ($query, $keyword) {
                $query->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('email', 'like', '%' . $keyword . '%')
                    ->orWhere('address', 'like', '%' . $keyword . '%')
                    ->orWhere('date_of_birth', 'like', '%' . $keyword . '%');
            })
            ->editColumn('information', function ($data) {
                $html = '';
                if (!empty($data->date_of_birth)) {
                    $html .= '<span > <strong>'. __('msg.dob'). ' :  </strong>' . ($data->date_of_birth) . '</span>';
                }
                if (!empty($data->email)) {
                    $html .= '<span > <strong>'. __('msg.email'). ' :  </strong>' . ($data->email) . '</span>';
                }
                if (!empty($data->phone)) {
                    $html .= '<br> <strong>' . __('msg.phone') . ' : </strong>' . $data->phone;
                }
                if (!empty($data->address)) {
                    $html .= '<br><strong>' . __('msg.address') . ' :</strong>' . $data->address;
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
                $edit_url = route('author.edit', $data->id);
                $block = route('author.block', $data->id);
                $unblock = route('author.unblock', $data->id);

                $html = '<div class="text-center">';
                if (empty($data->deleted_at)) {
                    $html .= '<a  href="' . $edit_url . '">' . '<i class="fas fa-edit"></i>' . '</a>';
                }
                if (empty($data->deleted_at)) {
                            $html .= '<a onclick="return confirm(\'' . __('msg.block_this_author?') . ' \')" href="' . $block . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;   
                } else {
                    $html .= '<a onclick="return confirm(\'' . __('msg.unblock_this_author?') . ' \')" href="' . $unblock . '">' . '<i class="fas fa-unlock text-success"></i>' . '</a>';
                }
            
                $html .= '</ul></div>';
                return $html; 
            })
            ->rawColumns(['name', 'deleted_at', 'created_at', 'information', 'action'])
            ->make(true);
    } 

    public function edit($id)
    {
        #dd($id);
        $record = Author::findOrFail($id);  
        return view('admin.author.index',compact(['record']));
    }

    public function block($id)
    {
        $record = Author::findOrFail($id);
        $record->delete();
        return back()->with(['success' => ('Successfully Blocked')]);
    }

    public function unblock($id)
    {
        $record = Author::withTrashed()->findOrFail($id);
        $record->restore();
        return back()->with(['success' => ('Successfully Unblocked')]);
    }
}
