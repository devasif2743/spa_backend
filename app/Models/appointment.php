<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

    use Carbon\Carbon;
class appointment extends Model
{
    use HasFactory;

    public $guarded = [];


    public function membership(){
        return $this->belongsTo(Membership::class,"membership_id");
    }

      public function branch(){
        return $this->belongsTo(Branch::class,"branch_id");
    }


  
     protected $casts = [
        'cart' => 'array',     // allow cart JSON to be used as array
        'start_time' => 'datetime',
        'end_time'   => 'datetime',
    ];



public function getCreatedAtFormattedAttribute()
{
    return Carbon::parse($this->created_at)
        ->timezone('Asia/Kolkata')
        ->format('d-M-Y h:ia'); 
}


public function getStartTimeFormattedAttribute()
{
    return Carbon::parse($this->start_time)
        ->timezone('Asia/Kolkata')
        ->format('d-M-Y h:ia'); 
}

public function getEndTimeFormattedAttribute()
{
    return Carbon::parse($this->end_time)
        ->timezone('Asia/Kolkata')
        ->format('d-M-Y h:ia'); 
}

}
