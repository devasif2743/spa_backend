<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\expense;
use Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class expensesController extends Controller
{


   
   
    public function store(Request $request)
{
    $validator = Validator::make($request->all(), [
        'title'        => 'required|string',
        'amount'       => 'required|numeric',
        'category'     => 'required|string',
        'project'      => 'nullable|string',
        'client'       => 'nullable|string',
        'status'       => 'required|in:paid,unpaid,partial,pending',
        'dateIncurred' => 'nullable|date',
        'dueDate'      => 'nullable|date',
        'hasBill'      => 'boolean',
        'enteredBy'    => 'nullable|string',
        'bill'     => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:20480'
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'message' => $validator->errors()->first()
        ], 200);
    }

    $filePath = null;
    if ($request->hasFile('bill')) {
        $filePath = $request->file('bill')->store('bills', 'public');
    }

    $expense = expense::create([
        'title'         => $request->title,
        'amount'        => $request->amount,
        'category'      => $request->category,
        'project'       => $request->project,
        'client'        => $request->client,
        'status'        => $request->status,
        'date_incurred' => $request->dateIncurred,
        'due_date'      => $request->dueDate,
        'has_bill'      => $request->hasBill ?? false,
        'entered_by'    => $request->enteredBy,
        'bill_file'     => $filePath
    ]);

    return response()->json([
        'status'  => true,
        'message' => 'Expense recorded with bill file',
        'data'    => $expense
    ]);
    }



    public function update(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'title'        => 'required|string',
        'amount'       => 'required|numeric',
        'category'     => 'required|string',
        'project'      => 'nullable|string',
        'client'       => 'nullable|string',
        'status'       => 'required|in:paid,unpaid,partial,pending',
        'dateIncurred' => 'nullable|date',
        'dueDate'      => 'nullable|date',
        'hasBill'      => 'boolean',
        'enteredBy'    => 'nullable|string',
        'bill'         => 'nullable|file|mimes:pdf,jpg,jpeg,png|max:20480'
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'message' => $validator->errors()->first()
        ], 200);
    }

    $expense = expense::find($id);
    if (!$expense) {
        return response()->json([
            'status'  => false,
            'message' => 'Expense not found.'
        ], 404);
    }

    // Handle new bill file if uploaded
    if ($request->hasFile('bill')) {
        $filePath = $request->file('bill')->store('bills', 'public');
        $expense->bill_file = $filePath;
    }

    // Update the rest of the fields
    $expense->title         = $request->title;
    $expense->amount        = $request->amount;
    $expense->category      = $request->category;
    $expense->project       = $request->project;
    $expense->client        = $request->client;
    $expense->status        = $request->status;
    $expense->date_incurred = $request->dateIncurred;
    $expense->due_date      = $request->dueDate;
    $expense->has_bill      = $request->hasBill ?? false;
    $expense->entered_by    = $request->enteredBy;

    $expense->save();

    return response()->json([
        'status'  => true,
        'message' => 'Expense updated successfully.',
        'data'    => $expense
    ]);
}

    public function delete($id){

       $expense = expense::find($id);

    if (!$expense) {
        return response()->json([
            'status' => false,
            'message' => 'Expense not found.'
        ], 404);
    }

    $expense->delete();

    return response()->json([
        'status' => true,
        'message' => 'Expense deleted successfully.'
    ]);
    }


    //


       public function list($id=null){

            if($id!=null){
                $invoice=expense::find($id);
                          return response()->json([
                    'status'=>true,
                    'invoice'=>$invoice
                ]);
            }
            else{
                      $invoice=expense::
                      orderBy('created_at', 'desc')->get();

                  
                        return response()->json([
                                'status'=>true,
                                'expanses'=>$invoice,
                               
                            ]);

            }


       }


       public function getAnalytics1()
{
    // 1. Monthly expense and dummy revenue (for demo)
    $monthlyExpenses = expense::select(
            DB::raw("MONTH(created_at) as month"),
            DB::raw("SUM(amount) as expenses")
        )
        ->whereYear('created_at', now()->year)
        ->groupBy(DB::raw("MONTH(created_at)"))
        ->orderBy(DB::raw("MONTH(created_at)"))
        ->get();

    $monthLabels = [1=>"Jan", 2=>"Feb", 3=>"Mar", 4=>"Apr", 5=>"May", 6=>"Jun", 7=>"Jul", 8=>"Aug", 9=>"Sep", 10=>"Oct", 11=>"Nov", 12=>"Dec"];

    $monthlyExpenseData = [];
    foreach ($monthLabels as $num => $name) {
        $found = $monthlyExpenses->firstWhere('month', $num);
        $monthlyExpenseData[] = [
            'month' => $name,
            'expenses' => $found ? (float)$found->expenses : 0,
            'revenue' => rand(40000, 70000) // replace with real data if available
        ];
    }

    // 2. Category-wise totals
    $categoryData = expense::select(
            'category',
            DB::raw('SUM(amount) as total')
        )
        ->groupBy('category')
        ->get()
        ->map(function ($item) {
            return [
                'name' => $item->category ?? 'Miscellaneous',
                'value' => (float)$item->total,
                'color' => $this->fakeColorForCategory($item->category) // function below
            ];
        });

    return response()->json([
        'status' => true,
        'monthlyExpenseData' => $monthlyExpenseData,
        'categoryData' => $categoryData
    ]);


    
    


        }

        public function getAnalytics()
{
    // 1. Monthly expenses
    $monthlyExpenses = expense::select(
            DB::raw("MONTH(created_at) as month"),
            DB::raw("SUM(amount) as expenses")
        )
        ->whereYear('created_at', now()->year)
        ->groupBy(DB::raw("MONTH(created_at)"))
        ->orderBy(DB::raw("MONTH(created_at)"))
        ->get()
        ->keyBy('month'); // faster lookup

    // 2. Monthly revenue (from invoices - advance_paid)
    $monthlyRevenue = DB::table('invoices')
        ->select(
            DB::raw("MONTH(created_at) as month"),
            DB::raw("SUM(advancePaid) as revenue")
        )
        ->whereYear('created_at', now()->year)
        ->groupBy(DB::raw("MONTH(created_at)"))
        ->orderBy(DB::raw("MONTH(created_at)"))
        ->get()
        ->keyBy('month');

    // Month labels
    $monthLabels = [1=>"Jan", 2=>"Feb", 3=>"Mar", 4=>"Apr", 5=>"May", 6=>"Jun", 7=>"Jul", 8=>"Aug", 9=>"Sep", 10=>"Oct", 11=>"Nov", 12=>"Dec"];

    $monthlyExpenseData = [];
    foreach ($monthLabels as $num => $name) {
        $monthlyExpenseData[] = [
            'month' => $name,
            'expenses' => isset($monthlyExpenses[$num]) ? (float)$monthlyExpenses[$num]->expenses : 0,
            'revenue' => isset($monthlyRevenue[$num]) ? (float)$monthlyRevenue[$num]->revenue : 0
        ];
    }

    // 3. Category-wise expenses
    $categoryData = expense::select(
            'category',
            DB::raw('SUM(amount) as total')
        )
        ->groupBy('category')
        ->get()
        ->map(function ($item) {
            return [
                'name' => $item->category ?? 'Miscellaneous',
                'value' => (float)$item->total,
                'color' => $this->fakeColorForCategory($item->category)
            ];
        });

    return response()->json([
        'status' => true,
        'monthlyExpenseData' => $monthlyExpenseData,
        'categoryData' => $categoryData
    ]);
}



     public    function fakeColorForCategory($category) {
    return match($category) {
        'Hosting' => '#8b5cf6',
        'Software' => '#06b6d4',
        'Design Outsource' => '#10b981',
        'Travel' => '#f59e0b',
        default => '#ef4444', // Miscellaneous or unknown
    };
}



           

}
