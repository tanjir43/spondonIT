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

Route::middleware(['auth:sanctum',config('jetstream.auth_session'),'verified','Blade'])
->group(function () {

    Route::get('/app/dashboard', 'admin\DashboardController@index')->name('dashboard');

    #new requested employee
    Route::get('requested-user','admin\requestedUser\RequestedUserController@index')->name('requested.user');
    Route::get('requested-user-datatable','admin\requestedUser\RequestedUserController@datatable')->name('requested.user.datatable');
    Route::get('requested-user-accept/{id}', 'admin\requestedUser\RequestedUserController@accept')->name('requested.user.accept');
    Route::get('requested-user-reject/{id}', 'admin\requestedUser\RequestedUserController@reject')->name('requested.user.reject');

    #Author
    Route::get('author-list', 'admin\author\AuthorController@index')->name('authors');
    Route::get('author-datatable', 'admin\author\AuthorController@datatable')->name('author.datatable');
    Route::post('save-author/{id?}', 'admin\author\AuthorController@save')->name('author.save');
    Route::get('author-edit/{id}', 'admin\author\AuthorController@edit')->name('author.edit');
    Route::get('block-author/{id}', 'admin\author\AuthorController@block')->name('author.block');
    Route::get('unblock-author/{id}', 'admin\author\AuthorController@unblock')->name('author.unblock');
    
    #Books
    Route::get('books', 'admin\book\BookController@index')->name('books');
    Route::get('books-datatable', 'admin\book\BookController@datatable')->name('books.datatable');
    Route::post('save-book/{id?}', 'admin\book\BookController@save')->name('books.save');
    Route::get('books-edit/{id}', 'admin\book\BookController@edit')->name('books.edit');
    Route::get('block-books/{id}', 'admin\book\BookController@block')->name('books.block');
    Route::get('unblock-books/{id}', 'admin\book\BookController@unblock')->name('books.unblock');
    
    #Borrow Books
    Route::get('borrow-books', 'admin\book\BorrowController@index')->name('borrow.books');
    Route::get('borrow-books-datatable', 'admin\book\BorrowController@datatable')->name('borrow.datatable');
    Route::get('borrow-books-accept/{id}', 'admin\book\BorrowController@accept')->name('borrow.accept');
    Route::get('borrow-books-reject/{id}', 'admin\book\BorrowController@reject')->name('borrow.reject');
});