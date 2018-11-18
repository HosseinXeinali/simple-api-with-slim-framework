<?php

namespace App\Model;

use Illuminate\Database\Eloquent\Model;

class Operation extends Model{
    protected $table = 'operations';
    protected  $primaryKey = 'id';
    protected $fillable = ['type', 'time', 'product_id'];
}
