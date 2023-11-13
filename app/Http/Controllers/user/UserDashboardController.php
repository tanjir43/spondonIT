<?php

namespace App\Http\Controllers\user;

use App\Http\Controllers\Controller;
use App\Models\AttendanceSheet;
use App\Models\AttendanceSheetDetail;
use App\Models\Book;
use App\Models\Employee;
use App\Models\User;
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
}
