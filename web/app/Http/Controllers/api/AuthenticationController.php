<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Models\UserModel;
use Illuminate\Support\Facades\Hash;
use Auth;
use Illuminate\Support\Str;


class AuthenticationController extends Controller
{
    public function login(Request $request)
    {
        $valid = Validator::make($request->all(), [
            'email' => 'required|email',
            'password' => 'required',
        ]);

        if ($valid->fails()) {
            return  response()->json(['status' => 'error', 'message' => 'Email Tidak ditemukan']);
        }

        $getUser = UserModel::where('email', $request->email)->first();
        if ($getUser === null) {
            return response()->json(['status' => 'error', 'message' => 'Email Tidak ditemukan']);
        }

        if (!Hash::check($request->password, $getUser->password)) {
            return  response()->json(['status' => 'error', 'message' => 'Email Tidak ditemukan']);
        }

        $credentials  = $request->only('email', 'password');
        if (Auth::attempt($credentials)) {
            $user = Auth::user();
            $user->remember_token = Str::random(60);
            $user->save();
            return response()->json(['status' => 'success', 'data' => [
                'user' => $user,
                'token' => $user->remember_token,
            ]], 200);
        }
    }
}