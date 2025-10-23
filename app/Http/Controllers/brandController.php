<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use App\Models\brand;
use Illuminate\Support\Facades\Validator;

class brandController extends Controller
{
public function store(Request $request)
{
    // ✅ Validate both name & image
    $validator = Validator::make($request->all(), [
        'name'  => 'required|string|max:500',
        'image' => 'required|image|mimes:jpg,jpeg,png,gif,webp|max:2048', 
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'error'   => 'Validation Error',
            'message' => $validator->errors()->first()
        ], 422);
    }

    try {
        $imagePath = null;

        // ✅ Handle image upload
        if ($request->hasFile('image')) {
            $image = $request->file('image');
            // Save to storage/app/public/brands
            $imagePath = $image->store('brands', 'public');
        }

        // ✅ Save brand
        $saveCustomer = brand::create([
            'name'  => $request->name,
            'image' => $imagePath, // store path in DB
        ]);

        if ($saveCustomer) {
            return response()->json([
                'status'  => true,
                'message' => 'Brand Added Successfully...!',
                'data'    => $saveCustomer
            ]);
        } else {
            return response()->json([
                'status'  => false,
                'message' => 'Brand Not Added'
            ]);
        }
    } catch (\Exception $e) {
        return response()->json([
            'status'  => false,
            'error'   => 'Exception Error',
            'message' => $e->getMessage()
        ], 500);
    }
}

    
public function list($id = null)
{
    try {
        if ($id !== null) {
            $brand = brand::find($id);

            if (!$brand) {
                return response()->json([
                    'status'  => false,
                    'message' => 'Brand not found.'
                ]);
            }

            // ✅ Add full image URL
            if ($brand->image) {
                $brand->image_url = asset('storage/' . $brand->image);
            }

            return response()->json([
                'status' => true,
                'data'   => $brand
            ]);
        }

        $allbrand = brand::orderBy('created_at', 'desc')->get();

        // ✅ Map image URL for each brand
        $allbrand->transform(function ($brand) {
            if ($brand->image) {
                $brand->image_url = asset('storage/' . $brand->image);
            }
            return $brand;
        });

        return response()->json([
            'status' => true,
            'data'   => $allbrand
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status'  => false,
            'error'   => 'Exception Error',
            'message' => $e->getMessage(),
            'trace'   => $e->getTraceAsString() // for debugging
        ]);
    }
}

public function update(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'name'  => 'required|string|max:500',
        'image' => 'nullable|image|mimes:jpg,jpeg,png,gif,webp|max:2048',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'error'   => 'Validation Error',
            'message' => $validator->errors()->first()
        ], 422);
    }

    try {
        $brand = brand::find($id);

        if (!$brand) {
            return response()->json([
                'status'  => false,
                'message' => 'Brand not found.'
            ], 404);
        }

        // ✅ Update fields
        $brand->name = $request->name;

        // ✅ Handle image update
        if ($request->hasFile('image')) {
            // Delete old image if exists
            if ($brand->image && \Storage::disk('public')->exists($brand->image)) {
                \Storage::disk('public')->delete($brand->image);
            }

            // Save new image
            $brand->image = $request->file('image')->store('brands', 'public');
        }

        $brand->save();

        return response()->json([
            'status'  => true,
            'message' => 'Brand updated successfully!',
            'data'    => $brand
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status'  => false,
            'error'   => 'Exception Error',
            'message' => $e->getMessage()
        ], 500);
    }
}

public function destroy($id)
{
    try {
        $brand = brand::find($id);

        if (!$brand) {
            return response()->json([
                'status'  => false,
                'message' => 'Brand not found.'
            ], 404);
        }

        // ✅ Delete image if exists
        if ($brand->image && \Storage::disk('public')->exists($brand->image)) {
            \Storage::disk('public')->delete($brand->image);
        }

        $brand->delete();

        return response()->json([
            'status'  => true,
            'message' => 'Brand deleted successfully!'
        ]);
    } catch (\Exception $e) {
        return response()->json([
            'status'  => false,
            'error'   => 'Exception Error',
            'message' => $e->getMessage()
        ], 500);
    }
}






}