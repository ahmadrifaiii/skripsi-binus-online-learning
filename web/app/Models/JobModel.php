<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Laravel\Sanctum\HasApiTokens;
use Illuminate\Notifications\Notifiable;

class JobModel extends Model
{
    //
    use Notifiable;
    public $incrementing = false; 
    protected const DELETED_AT = 'deleted_at';
    protected $table = "job_workorders";

    protected $fillable = [
        'id',
        'workorder_number',
        'workorder_name',
        'workorder_description',
        'status',
        'workorder_created_by',
        'workorder_created_at',
        'workorder_updated_by',
        'workorder_updated_at',
    ];
}
