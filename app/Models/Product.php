<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Product extends Model
{
    use HasFactory;
     public $guarded=[];

      protected $casts = [
        'branch_ids' => 'array',
    ];

     protected $appends = ['image_url'];

    public function getImageUrlAttribute() {
        return $this->image ? asset('storage/' . $this->image) : null;
    }

    public function brand() {
        return $this->belongsTo(Brand::class);
    }

    public function category() {
        return $this->belongsTo(Category::class);
    }

     
}
