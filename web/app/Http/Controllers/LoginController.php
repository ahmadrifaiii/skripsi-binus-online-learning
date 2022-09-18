<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Redirect;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Session;
use \Auth;
use DB;
use Illuminate\Support\Str;

class LoginController extends Controller
{

    public function index()
    {
        if (Session::has('_session_auth')) {
            return Redirect::route('dashboard.index');
        }

        return view('pages.login.index');
    }

    public function auth(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($valid->fails()) {
            return Redirect::back()->withErrors($valid)->withInput();
        }
        
        $getUser = DB::table('users')->where('email', $request->email)->first();
        if ($getUser === null) {
            return Redirect::back()->withErrors('Email Tidak ditemukan')->withInput();
        }

        if (!Hash::check($request->password, $getUser->password)) {
            return Redirect::back()->withErrors('Password Salah')->withInput();
        }
        if(Auth::attempt(['email' => $request->email, 'password' => $request->password])){
            $user = Auth::user();
            $user->remember_token = Str::random(60);
            $user->save();
            Session::put('_session_auth', ['email' => $getUser->email, 'name' => $getUser->name]);
            return Redirect::route('dashboard.index');
        }

        return Redirect::back()->withErrors($valid)->withInput();
    }

}
