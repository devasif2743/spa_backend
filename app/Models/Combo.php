<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Combo extends Model
{
    use HasFactory;

      public $guarded=[];

       protected $casts = [
        'product_ids' => 'array',
        'branch_ids' => 'array',
    ];

    // relation: products included in this combo
    public function products()
    {
        return $this->hasMany(Product::class, 'id', 'product_ids');
    }

    // Accessor for expanded products
    public function getExpandedProductsAttribute()
    {
        return Product::whereIn('id', $this->product_ids)->get();
    }
}
