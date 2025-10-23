<?php

namespace App\Http\Controllers;



use App\Models\Product;
use App\Models\service;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Storage;

class ProjectController extends Controller
{
     public function store(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'name'        => 'required|string|max:255',
            'description'    => 'required|string',
            'price'       => 'required|numeric|min:0',
            'offer_price' => 'nullable|numeric|min:0',
            'duration' => 'nullable|numeric|min:0',
        ]);

        if ($validator->fails()) {
            return response()->json(['status' => false, 'message' => $validator->errors()->first()], 422);
        }

        $data = $validator->validated();

        // File Upload
      
        // Discount & Final Price
        $price = $data['price'];
        $offer = $data['offer_price'] ?? null;
        $data['final_price'] = $offer ?? $price;
        $data['discount_percent'] = $offer ? round((($price - $offer) / $price) * 100, 2) : 0;

        $product = service::create($data);

        return response()->json(['status' => true, 'message' => 'Product created successfully', 'data' => $product]);
    }

    // List Products
    // public function list($id = null)
    // {
    //     if ($id) {
    //         $product = service::find($id);
    //         if (!$product) {
    //             return response()->json(['status' => false, 'message' => 'Service not found'], 404);
    //         }
    //         return response()->json(['status' => true, 'data' => $product]);
    //     }

    //     $products = service::orderBy('created_at', 'desc')->paginate(2);
    //     return response()->json(['status' => true, 'data' => $products]);
    // }

    public function list(Request $request, $id = null)
{
    if ($id) {
        $product = service::find($id);
        if (!$product) {
            return response()->json([
                'status' => false,
                'message' => 'Service not found'
            ], 404);
        }
        return response()->json([
            'status' => true,
            'data' => $product
        ]);
    }

    $search = $request->input('search');

    $products = service::when($search, function ($query, $search) {
            return $query->where('name', 'LIKE', "%{$search}%");
        })
        ->orderBy('created_at', 'desc')
        ->paginate(10);

    return response()->json([
        'status' => true,
        'data' => $products
    ]);
}


    // Update Product
    public function update(Request $request, $id)
{
    $service = Service::find($id);
    if (!$service) {
        return response()->json([
            'status'  => false,
            'message' => 'Service not found'
        ], 404);
    }

    $validator = Validator::make($request->all(), [
        'name'        => 'required|string|max:255',
        'description' => 'nullable|string',
        'price'       => 'required|numeric|min:0',
        'offer_price' => 'nullable|numeric|min:0|lt:price',
        'duration'    => 'required|string|max:50', // e.g. "30 mins", "1 hour"
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'message' => $validator->errors()->first()
        ], 422);
    }

    $data = $validator->validated();

    // 🔹 Calculate final price & discount again
    $price = $data['price'];
    $offer = $data['offer_price'] ?? null;

    $data['final_price'] = $offer ?? $price;
    $data['discount_percent'] = $offer
        ? round((($price - $offer) / $price) * 100, 2)
        : 0;

    // 🔹 Update service
    $service->update($data);

    return response()->json([
        'status'  => true,
        'message' => 'Service updated successfully',
        'data'    => $service
    ]);
}

    // Delete Product
    public function delete($id)
    {
        $product = service::find($id);
        if (!$product) {
            return response()->json(['status' => false, 'message' => 'Product not found'], 404);
        }

        
        $product->delete();

        return response()->json(['status' => true, 'message' => 'Product deleted successfully']);
    }
}
