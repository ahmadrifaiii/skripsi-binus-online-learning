<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

// Route::middleware('auth:api')->get('/user', function (Request $request) {
//     return $request->user();
// });

Route::post('/login', 'api\AuthenticationController@login');

Route::group(['prefix'=>'joborder', 'as'=>'joborder', 'middleware'=>['APIAuth']], function(){
    Route::get('/list', 'api\JobOrderController@list');
    Route::get('/recent', 'api\JobOrderController@recent');
    Route::get('/current', 'api\JobOrderController@current');
    Route::get('/{id}', 'api\JobOrderController@detail');
    Route::get('/{id}/{status}', 'api\JobOrderController@updateStatus');
});


Route::group(['prefix'=>'web', 'as'=>'bo.jobs.'], function(){
    Route::get('/tabulator', 'api\JobOrderController@tabulator')->name('tabulator');
});
