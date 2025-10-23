<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use App\Models\Category;
class game extends Model
{
    use HasFactory;
     public $guarded=[];


      public function category()
    {
        return $this->belongsTo(category::class,'categories_id','id');
    }

}
