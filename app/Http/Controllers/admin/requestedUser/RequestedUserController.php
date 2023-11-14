<?php

namespace App\Http\Controllers\admin\requestedUser;

use App\Http\Controllers\Controller;
use App\Models\TempUser;
use App\Repositories\SaveRepository;
use App\Repositories\ValidationRepository;
use Brian2694\Toastr\Facades\Toastr;
use Exception;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use yajra\Datatables\DataTables;

class RequestedUserController extends Controller
{
    private $vr;
    private $save;

    public function __construct(ValidationRepository $validationRepository, SaveRepository $saveRepository)
    {
        $this->vr = $validationRepository;
        $this->save = $saveRepository;
    }

    public function index()
    {
        return view('admin.requestUser.index');
    }

    public function datatable()
    {
        $info = TempUser::with('createdby', 'updatedby', 'deletedby')->orderby('id', 'DESC');

        return DataTables::class::of($info)
            ->editColumn('name', function ($data) {
                return ConvertToLang($data);
            })
            ->editColumn('phone', function ($data) {
                return $data->phone;
            })
            
            ->filterColumn('name', function ($query, $keyword) {
                $query->where('name', 'like', '%' . $keyword . '%')
                    ->orWhere('phone', 'like', '%' . $keyword . '%')
                    ->orWhere('email', 'like', '%' . $keyword . '%');
            })
            ->editColumn('information', function ($data) {
                $html = '';
                if (!empty($data->email)) {
                    $html .=  __('msg.email') . ' : ' . $data->email;
                }
                return $html;
            })
            ->editColumn('deleted_at', function ($data) {
                if ($data->is_rejected == false) {
                    return '<span class="badge bg-warning">' . __('msg.pending') . '</span>';
                } else {
                    $html= '<p class="text-center"><span class="badge bg-danger">'.__('msg.rejected').'</span>';
                    if ($data->deletedby) {
                        $html.= '<br><span class="badge bg-danger mt-1">'.$data->deletedby->name.'</span></p>';
                    }
                    return $html;                }
            })
            ->editColumn('created_at', function ($data) {
                $html = '<span class="badge bg-pill bg-success">' . $data->created_at . '</span>';
                if (!empty($data->createdby)) {
                    $html .= '<br><span class="badge bg-success">' . $data->createdby->name . '</span>';
                }
                if ($data->created_at != $data->updated_at) {
                    $html .= '<br><span class="badge bg-pill bg-warning mt-1" style="margin-top: 5px">' . $data->updated_at . '</span>';
                    if (!empty($data->updatedby)) {
                        $html .= '<br><span class="badge bg-warning">' . $data->updatedby->name . '</span>';
                    }
                }
                return $html;
            })
            ->addColumn('action', function ($data) {
                $accept = route('requested.user.accept', $data->id);
                $reject = route('requested.user.reject', $data->id);

                $html = '<div class="text-center">';
                           
                    if (!$data->is_rejected) {
                        $html .= '<a  href="' . $accept . '">' . '<i class="fas fa-check"></i>' . '</a>';
                 
                        $html .= '<a onclick="return confirm(\'' . __('msg.block_this_user?') . ' \')" href="' . $reject . '">' .'<span style="margin-left:10px;"><i class="fas fa-lock  text-danger"></i></span>' . '</a>'  ;
                    } else {
                        $html .= '<a  href="' . $accept . '">' . '<i class="fas fa-check"></i>' . '</a>';
                    }
              
                $html .= '</div></div>';
                return $html;
            })
            ->rawColumns(['name','phone' ,'deleted_at', 'created_at', 'information', 'action'])
            ->make(true);
    }

    public function accept(Request $request, $id)
    {
        $status = $this->save->AddUser($request, $id);

        if ($status == 'success') {

            return redirect()->back()->with(['success' => ('New User Successfully Added')]);
        } else {
            return back()->with(['errors_' => $status]);
        }
    }

    public function reject($id)
    {
        $user_id    = Auth::user()->id;
        $temp_employee = TempUser::findOrFail($id);

        $temp_employee['is_rejected'] = true;
        $temp_employee['deleted_by']  = $user_id;
        try {
            $temp_employee->save();
            return redirect(route('requested.user'))->with(['success' => 'Successfully saved']);
        } catch (Exception $e) {
            return back()->with(['errors_' => $e]);
        }
    }
}
