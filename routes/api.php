<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
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
    
});
