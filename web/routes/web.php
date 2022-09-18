<?php

use Illuminate\Support\Facades\Route;



// // login
Route::group(['prefix'=>'login', 'as'=>'login.'], function () {
    Route::get('/', 'LoginController@index')->name('index');
    Route::post('/auth', 'LoginController@auth')->name('auth');
});

Route::get('/', function () {
    return redirect()->route('dashboard.index');
});

// dashboard segment
Route::group(['prefix'=>'dashboard', 'as'=>'dashboard.', 'middleware' =>'WebAuth'], function () {
    Route::resource('/', 'backoffice\DashboardController');
});

// work order segment
Route::group(['prefix'=>'jobs', 'as'=>'jobs.'], function () {
    Route::resource('/', 'backoffice\JobOrderController');
});

// user management
Route::group(['prefix'=>'user-management', 'as'=>'user-management.', 'middleware' =>'WebAuth'], function () {
    Route::resource('/', 'backoffice\UserController')->names('user');
});

// Route::group(['prefix'=>'user-management', 'as'=>'user-management.'], function () {
// });
