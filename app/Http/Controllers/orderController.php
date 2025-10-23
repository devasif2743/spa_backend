<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\order;
use App\Models\game;
use App\Models\product;
use Validator;

class orderController extends Controller
{
      
    

    public function store(Request $request)
{
    $validator = validator::make($request->all(), [
        'customerId' => 'required|string',
        'customerName' => 'required|string',
        'customerMobile' => 'required|string',
        'items' => 'required|array',
        'total' => 'required',
        'status' => 'required',
        'staffId' => 'required',
        'staffName' => 'required',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'error' => 'Validation Error',
            'message' => $validator->errors()->first()
        ]);
    }

    try {
        // Start DB transaction
        \DB::beginTransaction();

        // Save Order
        $saveCustomer = order::create([
            'customerId' => $request->customerId,
            'customerName' => $request->customerName,
            'customerMobile' => $request->customerMobile,
            'items' => json_encode($request->items),
            'total' => $request->total,
            'status' => $request->status,
            'staffId' => $request->staffId,
            'staffName' => $request->staffName,
        ]);

        // Reduce stock for each item
        foreach ($request->items as $item) {
            if ($item['type'] === 'product' && isset($item['productId'])) {
                $product = product::find($item['productId']);
                if ($product) {
                    $product->stock = max(0, $product->stock - $item['quantity']);
                    $product->save();
                }
            } elseif ($item['type'] == 'game' && isset($item['gameId'])) {
                $game = game::find($item['gameId']);
                if ($game) {
                    $game->stock = max(0, $game->stock - $item['quantity']);
                    $game->save();
                }
            }
        }

        \DB::commit();

        return response()->json([
            'status' => true,
            'message' => 'Order Added and stock updated successfully!'
        ]);
    } catch (\Exception $e) {
        \DB::rollBack();
        return response()->json([
            'status' => false,
            'error' => 'Exception Error',
            'message' => $e->getMessage()
        ]);
    }
}


       public function list($id=null){
        try{

          

             if ($id !== null) {
                     
                        $categoryData = order::where('deleted_at',null)->find($id);
                        
                        if (!$categoryData) {
                            return response()->json([
                                'status' => false,
                                'message' => 'order not found.'
                            ]);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => $categoryData
                        ]);
              }

        $allcategory = order::where('deleted_at',null)
         ->orderBy('created_at', 'desc')
        ->get();

        // Returning the response with data
        return response()->json([
            'status' => true,
            'data' => $allcategory,
           
        ]);

    } catch (\Exception $e) {
       
        return response()->json([
            'status' => false,
            'error' => 'Exception Error',
            'message' => $e->getMessage(),
            'trace' => $e->getTraceAsString() // Optionally, add trace for debugging
        ]);

               
        }
    }

   
 public function update(Request $request, $id)
{
    $validated = $request->validate([
        'newStatus' => 'required|string|in:cancelled,returned',
    ]);

    $order = Order::find($id);

    if (!$order) {
        return response()->json([
            'status' => false,
            'message' => 'Order not found',
        ], 404);
    }

    $newStatus = $validated['newStatus'];

    // Decode items if stored as JSON string
    $items = is_string($order->items) ? json_decode($order->items, true) : $order->items;

    if (in_array($newStatus, ['cancelled', 'returned'])) {
        // foreach ($items as $item) {
        //     if (!isset($item['type']) || $item['type'] !== 'product') continue;

        //     $product = Product::find($item['product_id']);
        //     if ($product) {
        //         $product->stock += $item['quantity'];
        //         $product->save();
        //     }
        // }


        foreach ($items as $item) {
    if (!isset($item['type']) || $item['type'] !== 'product') continue;
    if (!isset($item['productId'])) continue; // avoid crash

    $product = Product::find($item['productId']);
    if ($product) {
        $product->stock += $item['quantity'];
        $product->save();
    }
}

    }

    $order->status = $newStatus;
    $order->save();

    return response()->json([
        'status' => true,
        'message' => 'Order updated successfully',
        'order' => $order,
    ]);
}


    public function delete(Request $request, $id)
{

 

 
    $category = category::find($id);

    if (!$category) {
        return response()->json([
            'status' => false,
            'message' => 'Category not found',
        ], 200);
    }

    // 3. Update the category

    $category->deleted_at = now();
        $category->save();

    // 4. Return response
    return response()->json([
        'status' => true,
        'message' => 'Category Deleted successfully',
        'category' => $category,
    ]);
}


}
