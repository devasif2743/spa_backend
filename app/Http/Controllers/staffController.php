<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\User;
use Carbon\Carbon;

use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Hash;
use Illuminate\Validation\Rule;

class staffController extends Controller
{
    //

    public function addStaff(Request $request){

        
        $validator=Validator::make(request()->all(),[
           
            'name' => 'required|string|max:150',
          
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
            'role' => ['required', Rule::in(['manager','pos','therapist'])],
            'branch_id' => 'required|exists:branches,id'
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 200);
        }




         $staff = User::create([
            'name' => $request->name,
            'contact' => $request->contact,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'branch_id' => $request->branch_id
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Staff created successfully',
            'data' => $staff
        ]);
    }

        public function addStaffbranch(Request $request){

        $validator=Validator::make(request()->all(),[
           
            'name' => 'required|string|max:150',
            'contact' => 'required|digits:10|unique:users,contact',
          
            'email' => 'required|email|unique:users,email',
            'password' => 'required|min:6',
            'role' => ['required', Rule::in(['manager','pos','therapist'])],
           
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first()
            ], 200);
        }




         $staff = User::create([
            'name' => $request->name,
            'contact' => $request->contact,
            'email' => $request->email,
            'password' => Hash::make($request->password),
            'role' => $request->role,
            'branch_id' => auth()->user()->branch_id
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Staff created successfully',
            'data' => $staff
        ]);
    }

    //addStaffbranch
       // List all branches or one by ID
    // public function list($id = null)
    // {
    //     if ($id) {
    //         $branch = User::find($id);
    //         if (!$branch) {
    //             return response()->json([
    //                 'status'  => false,
    //                 'message' => 'User not found'
    //             ], 404);
    //         }
    //         return response()->json(['status' => true, 'data' => $branch]);
    //     }

    //     $branches = User::with('branch')->orderBy('created_at', 'desc')->paginate(10);
    //     return response()->json(['status' => true, 'data' => $branches]);
    // }

    public function list(Request $request, $id = null)
{
    if ($id) {
        $user = User::with('branch')->find($id);
        if (!$user) {
            return response()->json([
                'status'  => false,
                'message' => 'User not found'
            ], 404);
        }
        return response()->json(['status' => true, 'data' => $user]);
    }

    $search = $request->input('search');
    $role   = $request->input('role');

    $users = User::with('branch')
        ->when($search, function ($query, $search) {
            $query->where('name', 'LIKE', "%{$search}%");
        })
        ->when($role, function ($query, $role) {
            $query->where('role', $role);
        })
        ->orderBy('created_at', 'desc')
        ->paginate(10);

    return response()->json(['status' => true, 'data' => $users]);
}



    //  public function list_staff_only_branch($id = null)
    // {
    //     if ($id) {
    //         $branch = User::find($id);
    //         if (!$branch) {
    //             return response()->json([
    //                 'status'  => false,
    //                 'message' => 'User not found'
    //             ], 404);
    //         }
    //         return response()->json(['status' => true, 'data' => $branch]);
    //     }

    //     $branches = User::where('branch_id',auth()->user()->branch_id)->orderBy('created_at', 'desc')->paginate(10);
    //     return response()->json(['status' => true, 'data' => $branches]);
    // }

    public function list_staff_only_branch(Request $request, $id = null)
{
    if ($id) {
        $user = User::find($id);
        if (!$user) {
            return response()->json([
                'status'  => false,
                'message' => 'User not found'
            ], 404);
        }
        return response()->json(['status' => true, 'data' => $user]);
    }

    $search = $request->input('search');
    $role   = $request->input('role');

    $staff = User::where('branch_id', auth()->user()->branch_id)
        ->when($search, function ($q) use ($search) {
            $q->where('name', 'LIKE', "%{$search}%");
        })
        ->when($role, function ($q) use ($role) {
            $q->where('role', $role);
        })
        ->orderBy('created_at', 'desc')
        ->paginate(10);

    return response()->json(['status' => true, 'data' => $staff]);
}


    // Update branch
    public function update_old(Request $request, $id)
    {
        $branch = User::find($id);
        if (!$branch) {
            return response()->json([
                'status'  => false,
                'message' => 'Branch not found'
            ], 404);
        }

        $validator = Validator::make($request->all(), [
                'name'     => 'required|string|max:255',
                'contact'  => [
                    'required',
                    'digits:10',
                    Rule::unique('users', 'contact')->ignore($branch->id), // ✅ ignore current user
                ],
                'email'    => [
                    'required',
                    'email',
                    Rule::unique('users', 'email')->ignore($branch->id),   // ✅ ignore current user
                ],
                'role'     => 'required|string',
                'branch_id'=> 'nullable|integer|exists:branches,id',
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
            'message' => 'User updated successfully',
            'data'    => $branch
        ]);
    }

    public function update(Request $request, $id)
{

  
    $branch = User::find($id);
    if (!$branch) {
        return response()->json([
            'status'  => false,
            'message' => 'User not found'
        ], 404);
    }

    $validator = Validator::make($request->all(), [
        'name'      => 'required|string|max:255',
        'contact'   => [
            'required',
            'digits:10',
            Rule::unique('users', 'contact')->ignore($branch->id),
        ],
        'email'     => [
            'required',
            'email',
            Rule::unique('users', 'email')->ignore($branch->id),
        ],
        'role'      => 'required|string',
        // 'branch_id' => 'required|integer|exists:branches,id',
        // 'branch_id' => 'required|integer|exists:branches,id',
        'password'  => 'nullable|string|min:6   ', 
        // ✅ use `password_confirmation` field in request
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'message' => $validator->errors()->first()
        ], 200);
    }

    $data = $validator->validated();

    // ✅ If password provided → hash before saving
    if (!empty($data['password'])) {
        $data['password'] = Hash::make($data['password']);
    } else {
        unset($data['password']); // avoid overwriting with null
    }

    $branch->update($data);

    return response()->json([
        'status'  => true,
        'message' => 'User updated successfully',
        'data'    => $branch
    ]);
}

    // Delete branch (soft delete)
    public function delete($id)
    {
        $branch = User::find($id);
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
