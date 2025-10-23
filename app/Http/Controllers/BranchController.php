<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Branch;
use Illuminate\Support\Facades\Validator;

class BranchController extends Controller
{

      public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'address' => 'required|string|max:500',
            'phone'   => 'required|digits:10',
            'email'   => 'required|email|max:255',
            'manager' => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 200);
        }

        $branch = Branch::create($validator->validated());

        return response()->json([
            'status'  => true,
            'message' => 'Branch created successfully',
            'data'    => $branch
        ]);
    }

    // List all branches or one by ID
    // public function list($id = null)
    // {
    //     if ($id) {
    //         $branch = Branch::find($id);
    //         if (!$branch) {
    //             return response()->json([
    //                 'status'  => false,
    //                 'message' => 'Branch not found'
    //             ], 404);
    //         }
    //         return response()->json(['status' => true, 'data' => $branch]);
    //     }

    //     $branches = Branch::orderBy('created_at', 'desc')->paginate(10);
    //     return response()->json(['status' => true, 'data' => $branches]);
    // }

    public function list(Request $request, $id = null)
{
    if ($id) {
        $branch = Branch::find($id);
        if (!$branch) {
            return response()->json([
                'status'  => false,
                'message' => 'Branch not found'
            ], 404);
        }
        return response()->json(['status' => true, 'data' => $branch]);
    }

    $search = $request->input('search');

    $branches = Branch::when($search, function ($query, $search) {
            return $query->where('name', 'LIKE', "%{$search}%");
        })
        ->orderBy('created_at', 'desc')
        ->paginate(perPage: 6);

    return response()->json(['status' => true, 'data' => $branches]);
}


    // Update branch
    public function update(Request $request, $id)
    {
        $branch = Branch::find($id);
        if (!$branch) {
            return response()->json([
                'status'  => false,
                'message' => 'Branch not found'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
            'name'    => 'required|string|max:255',
            'address' => 'required|string|max:500',
            'phone'   => 'nullable|string|max:20',
            'email'   => 'nullable|email|max:255',
            'manager' => 'nullable|string|max:255',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 422);
        }

        $branch->update($validator->validated());

        return response()->json([
            'status'  => true,
            'message' => 'Branch updated successfully',
            'data'    => $branch
        ]);
    }

    // Delete branch (soft delete)
    public function delete($id)
    {
        $branch = Branch::find($id);
        if (!$branch) {
            return response()->json([
                'status'  => false,
                'message' => 'Branch not found'
            ], 404);
        }

        $branch->delete();

        return response()->json([
            'status'  => true,
            'message' => 'Branch deleted successfully'
        ]);
    }


}
