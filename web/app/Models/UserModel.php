<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class UserModel extends Authenticatable
{
    use HasApiTokens, Notifiable;
    public $incrementing = false;
   protected const DELETED_AT = 'deleted_at';
    protected $table = "users";
    protected $hidden = ['password', 'remember_token'];

    protected $fillable = [
        'id',
        'name',
        'email',
        'password',
        'created_by',
        'updated_by',
    ];
	

}
