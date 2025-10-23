<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\membershippurchase;
use App\Models\Membership;
use App\Models\appointment;
use Carbon\Carbon;
use Illuminate\Support\Facades\Validator;

class membershippurchaseController extends Controller
{
    public function store(Request $request)
{
    // ✅ Validate incoming request
    $validator = Validator::make($request->all(), [
        'name'           => 'required|string|max:255',
        'phone'          => 'required|digits:10',
        'email'          => 'required|email',
        'plan_id'        => 'required|integer|exists:memberships,id',
        'payment_method' => 'required|string|in:cash,upi,card',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors()->first(),
        ], 200);
    }

    $data = $validator->validated();

    // ✅ Fetch the membership plan and amount
    $plan = Membership::find($data['plan_id']);
    if (!$plan) {
        return response()->json([
            'status'  => false,
            'message' => 'Selected membership plan not found.'
        ], 404);
    }

    $amount = $plan->final_price;
    $plan_name = $plan->name;
    $service_count = $plan->service_count;
   

    $expirationDays = $plan->expiration;   // e.g. 30
    $endDate = Carbon::now()->addDays($expirationDays);

    // ✅ Create purchase record
    $membership = MembershipPurchase::create([
        'customer_name'   => $data['name'],
        'customer_phone'  => $data['phone'],
        'customer_email'  => $data['email'],
        'plan_id'         => $data['plan_id'],
        'payment_method'  => $data['payment_method'],
        'amount'          => $amount,
        'plan_name'          => $plan_name,
        'service_count'          => $service_count,
        'expiration'          => $endDate,
    ]);

    return response()->json([
        'status'  => true,
        'message' => 'Membership purchased successfully',
        'data'    => $membership,
    ], 201);
}


public function checkBalance(Request $request)
{

      $validator = Validator::make($request->all(), [
        'phone'          => 'required|digits:10',
        ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'message' => $validator->errors()->first(),
        ], 200);
    }


 
    // $membership = membershippurchase::where('customer_phone', $request->phone)->latest()->first();

    // if (!$membership) {
    //     return response()->json(['has_membership' => false]);
    // }

    // // Example: assume the plan includes `allowed_services` count
    // // $usedCount = appointment::where('customer_phone', $request->phone)->count();
    // // $usedCount = appointment::where('membership_id', $membership->id)->count();
    // $usedCount = appointment::where('membership_id', $membership->id)
    // ->sum('total_service');
    
    
    // $remaining = max(0, $membership->service_count - $usedCount);

    // $expires_on= $membership->expiration;
    // return response()->json([
    //     'id'=>$membership->id,
    //     'has_membership'     => true,
    //     'plan_name'          => $membership->plan_name,
    //     'remaining_services' => $remaining,
    //     'plan_price'         => $membership->amount,
    //     'expires_on'=>$expires_on
    // ]);


       $memberships = membershippurchase::where('customer_phone', $request->phone)
            ->where('expiration', '>=', Carbon::now())
            ->orderBy('expiration')
            ->get();

        if ($memberships->isEmpty()) {
            return response()->json(['has_membership' => false]);
        }

        $data = $memberships->map(function ($m) {
            // usedCount is the SUM of total_service in appointments for this membership
            $used = appointment::where('membership_id', $m->id)->sum('free_services_used');
            return [
                'id'                => $m->id,
                'plan_name'         => $m->plan_name,
                'expires_on'        => $m->expiration,
                'remaining_services'=> max(0, $m->service_count - $used),
                'plan_price'        => $m->amount,
            ];
        });

        return response()->json([
            'has_membership' => true,
            'memberships'    => $data
        ]);

}
}
