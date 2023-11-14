<?php

use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

use App\Http\Controllers\LoginWithGoogleController;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

Route::get('/','website\WebsiteController@index')->name('home');

Route::get('change-lang/{lang}', 'ChangeLangController@index')->name('chang.lang');
Route::post('/register','user\register\RegisterController@store');
Route::post('/login','AuthenticatedSessionController@store');
Route::get('/logout','AuthenticatedSessionController@destroy')->name('logout');;
Route::get('/email/verify/{hash}','VerifyEmailController@__invoke');
Route::get('verify-user/{code}/{client_id?}', 'VerifyEmailController@activateUser')->name('activate.user');


Route::get('/my-profile','website\MyAccountController@index')->name('my.profile');

Route::group(['middleware' => ['auth','verified']], function () {
    Route::get('/dashboard','user\UserDashboardController@index')->name('user.dashboard');
    Route::post('book-search','user\UserDashboardController@bookSearch')->name('books.search');
    Route::post('borrow-request','user\UserDashboardController@borrowRequest')->name('borrow.request');
    Route::get('borrow-history','user\UserDashboardController@borrowHistory')->name('user.borrow.history');
    Route::get('return-book/{id}','user\UserDashboardController@returnBook')->name('user.return.book');
    Route::post('update-borrow-book','user\UserDashboardController@editBorrowRequest')->name('user.update.borrow.request');
    Route::get('borrow-book-history', 'user\UserDashboardController@fetchBorrowHistory')->name('user.borrow.history');

});
Route::get('/app', function () {
    $role = Auth::user()->role;
        session()->put('role',strtolower($role));
        if($role->id = 3){
            return redirect()->back()->with(['errors_' => [__('msg.access_deny')]]);  
        }else{
            return redirect(route('dashboard'));
        }
});