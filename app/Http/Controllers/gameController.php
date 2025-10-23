<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\game;
use Validator;

class gameController extends Controller
{
       public function store(Request $request){

        
        $validator=validator::make($request->all(),[
            'title'=>'required|string',
            'description'=>'required|string',
            'price'=>'required|integer',
            'categoryId'=>'required|integer',
            'genre'=>'required|string',
           
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'error'=>'Validation Error',
                'message'=> $validator->errors()->first()
            ]);
        }

        try{

             $saveCustomer=game::create([
                'title'=>$request->title,
                'description'=>$request->description,
                'price'=>$request->price,
                'categories_id'=>$request->categoryId,
                'genre'=>$request->genre,
                
             ]);

             if($saveCustomer){
                 return response()->json([
                'status'=>true,
                'message'=> 'Game Added Successfully...!'
                ]);
             }else{
                return response()->json([
                'status'=>false,
                'message'=> 'Game Not Added'
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
                     
                        $categoryData = game::where('deleted_at',null)->find($id);
                        
                        if (!$categoryData) {
                            return response()->json([
                                'status' => false,
                                'message' => 'game not found.'
                            ]);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => $categoryData
                        ]);
              }

        $allcategory = game::with('category')->where('deleted_at',null)
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
           'title'=>'required|string',
            'description'=>'required|string',
            'price'=>'required|integer',
            'categoryId'=>'required|integer',
            'genre'=>'required|string',
            

    ]);

 
    $category = game::find($id);

    if (!$category) {
        return response()->json([
            'status' => false,
            'message' => 'Game not found',
        ], 200);
    }

    // 3. Update the category


    $category->update([
    'title' => $validated['title'],
    'description' => $validated['description'],
    'price' => $validated['price'],
    'categories_id' => $validated['categoryId'], // <--- this is important
    'genre' => $validated['genre'],
]);


    // 4. Return response
    return response()->json([
        'status' => true,
        'message' => 'Game updated successfully',
        'category' => $category,
    ]);
}

    public function delete(Request $request, $id)
{

 

 
    $category = game::find($id);

    if (!$category) {
        return response()->json([
            'status' => false,
            'message' => 'Game not found',
        ], 200);
    }

    // 3. Update the category

    $category->deleted_at = now();
        $category->save();

    // 4. Return response
    return response()->json([
        'status' => true,
        'message' => 'Game Deleted successfully',
        'category' => $category,
    ]);
}



}
