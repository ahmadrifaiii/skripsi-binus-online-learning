<?php

namespace App\Http\Middleware;

use Closure;

class APIAuth
{
    /**
     * Handle an incoming request.
     *
     * @param  \Illuminate\Http\Request  $request
     * @param  \Closure  $next
     * @return mixed
     */
    public function handle($request, Closure $next)
    {
        $header =$request->header('Authorization');
        if($header==""){
            return response()->json(['status' => 'error', 'message' => 'Token tidak ditemukan']);
        }

        return $next($request);
    }
}
