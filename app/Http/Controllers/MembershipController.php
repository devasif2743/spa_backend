<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Membership;
use Illuminate\Support\Facades\Validator;
use Illuminate\Validation\Rule;

class MembershipController extends Controller
{
    
    
    public function addMembership(Request $request){

        $validator=Validator::make(request()->all(),[
           
             'name'          => 'required|string|max:255',
            'expiration'    => 'required|integer|min:1',
            'price'         => 'required|numeric|min:0',
            'offer_price'   => 'nullable|numeric|min:0',
            'service_count' => 'required|integer|min:0',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 200);
        }




            $data = $validator->validated();
            $price = $data['price'];
            $offer = $data['offer_price'] ?? null;

            $data['final_price'] = $offer ?? $price;
            $data['discount_percent'] = $offer ? round((($price - $offer) / $price) * 100, 2) : 0;

            $membership = Membership::create($data);

        return response()->json([
            'status' => true,
            'message' => 'Membership created successfully',
            'data' => $membership
        ]);
    }

       // List all branches or one by ID
    // public function list($id = null)
    // {
    //     if ($id) {
    //         $branch = Membership::find($id);
    //         if (!$branch) {
    //             return response()->json([
    //                 'status'  => false,
    //                 'message' => 'Membership not found'
    //             ], 404);
    //         }
    //         return response()->json(['status' => true, 'data' => $branch]);
    //     }

    //     $branches = Membership::orderBy('created_at', 'desc')->paginate(10);
    //     return response()->json(['status' => true, 'data' => $branches]);
    // }

    public function list(Request $request, $id = null)
{
    if ($id) {
        $membership = Membership::find($id);
        if (!$membership) {
            return response()->json([
                'status'  => false,
                'message' => 'Membership not found'
            ], 404);
        }
        return response()->json(['status' => true, 'data' => $membership]);
    }

    $search = $request->input('search');

    $memberships = Membership::when($search, function ($query, $search) {
            $query->where('name', 'LIKE', "%{$search}%");
        })
        ->orderBy('created_at', 'desc')
        ->paginate(6);

    return response()->json(['status' => true, 'data' => $memberships]);
}


    // Update branch
    public function update(Request $request, $id)
    {
        $membership = Membership::find($id);
        if (!$membership) {
            return response()->json([
                'status'  => false,
                'message' => 'Branch not found'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
              'name'          => 'required|string|max:255',
            'expiration'    => 'required|integer|min:1',
            'price'         => 'required|numeric|min:0',
            'offer_price'   => 'nullable|numeric|min:0',
            'service_count' => 'required|integer|min:0',
            ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 422);
        }

          $data = $validator->validated();
        $price = $data['price'];
        $offer = $data['offer_price'] ?? null;

        $data['final_price'] = $offer ?? $price;
        $data['discount_percent'] = $offer ? round((($price - $offer) / $price) * 100, 2) : 0;

        $membership->update($data);


        return response()->json([
            'status'  => true,
            'message' => 'User updated successfully',
            'data'    => $membership
        ]);
    }

    // Delete branch (soft delete)
    public function delete($id)
    {
        $branch = Membership::find($id);
        if (!$branch) {
            return response()->json([
                'status'  => false,
                'message' => 'User not found'
            ], 404);
        }

        $branch->delete();

        return response()->json([
            'status'  => true,
            'message' => 'User deleted successfully'
        ]);
    }
}
