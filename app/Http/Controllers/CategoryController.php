<?php
namespace App\Http\Controllers;
use App\Models\category;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
class CategoryController extends Controller
{
    //l
    public function store(Request $request){
        $validator=validator::make($request->all(),[
            'name'=>'required|string',
            'description'=>'required|string',
        ]);
        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'error'=>'Validation Error',
                'message'=> $validator->errors()->first()
            ]);
        }
        try{
             $saveCustomer=category::create([
                'name'=>$request->name,
                'description'=>$request->description,
             ]);
             if($saveCustomer){
                 return response()->json([
                'status'=>true,
                'message'=> 'category Added Successfully...!'
                ]);
             }else{
                return response()->json([
                'status'=>false,
                'message'=> 'category Not Added'
                ]);
             }
        }catch(\Exception $e){
              return response()->json([
                'status'=>false,
                'error'=>'Exception Error',
                'message'=> $e->getMessage()
            ]);
        }
    }
       public function list($id=null){
        try{
             if ($id !== null) {
                        $categoryData = category::find($id);
                        if (!$categoryData) {
                            return response()->json([
                                'status' => false,
                                'message' => 'category not found.'
                            ]);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => $categoryData
                        ]);
              }
        $allcategory = category::orderBy('created_at', 'desc')
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
        'name' => 'required|string|max:255',
        'description' => 'nullable|string',
    ]);
    $category = category::find($id);
    if (!$category) {
        return response()->json([
            'status' => false,
            'message' => 'Category not found',
        ], 200);
    }
    // 3. Update the category
    $category->update($validated);
    // 4. Return response
    return response()->json([
        'status' => true,
        'message' => 'Category updated successfully',
        'category' => $category,
    ]);
}
public function delete($id)
{
    $category = category::find($id);

    if (!$category) {
        return response()->json([
            'status'  => false,
            'message' => 'Category not found',
        ], 404);
    }

    // Permanently delete the record
    $category->delete();

    return response()->json([
        'status'  => true,
        'message' => 'Category deleted permanently',
    ]);
}

//delete
}