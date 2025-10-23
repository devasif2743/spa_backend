<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Combo;
use App\Models\Product;
class ComboController extends Controller
{
  public function list($id = null)
    {
        try {
            if ($id) {
                $combo = Combo::find($id);
                if (!$combo) {
                    return response()->json([
                        'status' => false,
                        'message' => 'Combo not found'
                    ]);
                }

                $combo->products = Product::whereIn('id', $combo->product_ids)->get();

                return response()->json([
                    'status' => true,
                    'data' => $combo
                ]);
            }

            $combos = Combo::orderBy('created_at', 'desc')->get();

            foreach ($combos as $combo) {
                $combo->products = Product::whereIn('id', $combo->product_ids)->get();
            }

            return response()->json([
                'status' => true,
                'data' => $combos
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'error' => 'Exception Error',
                'message' => $e->getMessage()
            ]);
        }
    }

    // ========================
    // Store Combo
    // ========================
    public function store(Request $request)
    {
        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string',
            'product_ids' => 'required|array|min:2|max:3',
            'product_ids.*' => 'exists:products,id',
            'price'       => 'required|numeric|min:0',
            'offer_price' => 'nullable|numeric|min:0',
            'branch_ids'  => 'nullable|array',
        ]);

        try {
            // Get products
            $products = Product::whereIn('id', $validated['product_ids'])->get();

            if ($products->count() < 2) {
                return response()->json([
                    'status' => false,
                    'message' => 'At least 2 valid products required'
                ]);
            }

            // Calculations
            $totalOriginalPrice = $products->sum('final_price');
            $finalPrice = $validated['offer_price'] ?? $validated['price'];
            $savingsPercent = $totalOriginalPrice > 0
                ? round((($totalOriginalPrice - $finalPrice) / $totalOriginalPrice) * 100, 2)
                : 0;

            $stock = $products->min('stock'); // limited by lowest product stock

            $combo = Combo::create([
                'name' => $validated['name'],
                'description' => $validated['description'] ?? null,
                'price' => $validated['price'],
                'offer_price' => $validated['offer_price'] ?? null,
                'final_price' => $finalPrice,
                'savings_percent' => $savingsPercent,
                'stock' => $stock,
                'product_ids' => $validated['product_ids'],
                'branch_ids' => $validated['branch_ids'] ?? [],
            ]);

            $combo->products = $products;

            return response()->json([
                'status' => true,
                'message' => 'Combo created successfully',
                'data' => $combo
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'error' => 'Exception Error',
                'message' => $e->getMessage()
            ]);
        }
    }

    // ========================
    // Update Combo
    // ========================
    public function update(Request $request, $id)
    {
        $combo = Combo::find($id);
        if (!$combo) {
            return response()->json([
                'status' => false,
                'message' => 'Combo not found'
            ]);
        }

        $validated = $request->validate([
            'name'        => 'required|string|max:255',
            'description' => 'nullable|string',
            'product_ids' => 'required|array|min:2|max:3',
            'product_ids.*' => 'exists:products,id',
            'price'       => 'required|numeric|min:0',
            'offer_price' => 'nullable|numeric|min:0',
            'branch_ids'  => 'nullable|array',
        ]);

        try {
            $products = Product::whereIn('id', $validated['product_ids'])->get();
            $totalOriginalPrice = $products->sum('final_price');
            $finalPrice = $validated['offer_price'] ?? $validated['price'];
            $savingsPercent = $totalOriginalPrice > 0
                ? round((($totalOriginalPrice - $finalPrice) / $totalOriginalPrice) * 100, 2)
                : 0;

            $stock = $products->min('stock');

            $combo->update([
                'name' => $validated['name'],
                'description' => $validated['description'] ?? null,
                'price' => $validated['price'],
                'offer_price' => $validated['offer_price'] ?? null,
                'final_price' => $finalPrice,
                'savings_percent' => $savingsPercent,
                'stock' => $stock,
                'product_ids' => $validated['product_ids'],
                'branch_ids' => $validated['branch_ids'] ?? [],
            ]);

            $combo->products = $products;

            return response()->json([
                'status' => true,
                'message' => 'Combo updated successfully',
                'data' => $combo
            ]);
        } catch (\Exception $e) {
            return response()->json([
                'status' => false,
                'error' => 'Exception Error',
                'message' => $e->getMessage()
            ]);
        }
    }

    // ========================
    // Delete Combo
    // ========================
    public function delete($id)
    {
        $combo = Combo::find($id);
        if (!$combo) {
            return response()->json([
                'status' => false,
                'message' => 'Combo not found'
            ]);
        }

        $combo->delete();

        return response()->json([
            'status' => true,
            'message' => 'Combo deleted successfully'
        ]);
    }
}
