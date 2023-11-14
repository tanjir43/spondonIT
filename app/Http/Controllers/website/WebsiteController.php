<?php

namespace App\Http\Controllers\website;

use App\Http\Controllers\Controller;
use App\Models\Book;
use Illuminate\Http\Request;

class WebsiteController extends Controller
{
    public function index()
    {
        $datas = Book::with('media','authors')->get();
        return view('home.index',compact('datas'));
    }
}
