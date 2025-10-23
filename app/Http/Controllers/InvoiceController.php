<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\invoice;
use App\Models\project;
use App\Models\payment;
use Validator;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Auth;
use Carbon\Carbon;

class InvoiceController extends Controller
{
    //

        public function store(Request $request){

            $validator=validator::make($request->all(),[
                'customer'=>'required',
                'project'=>'required',
                'invoiceDate'=>'required|date',
                'dueDate'=>'required|date',
                'advancePaid'=>'required|numeric',
             
                'status'=>'required|string',
                'services'=>'required|array',
                'services.*.name'      => 'required|string',
                'services.*.qty'       => 'required|integer',
                'services.*.unitPrice' => 'required|numeric',
                'services.*.total'     => 'required|numeric',
                'totalAmount'=>'required|numeric',
                'balance'=>'required|numeric',
                'hasGST'=>'required',
                'gstPercent'=>'nullable',
                'getAmount'=>'nullable',
                'gstAmount'=>'nullable',
                'gstNumber'=>'nullable',
            
            ]);

            if($validator->fails()){
                return response()->json([
                    'status'=>false,
                    'error'=>'Validation Error',
                    'message'=> $validator->errors()->first()
                ]);
            }

            try{

                $createInvoice=invoice::create([
                    'customer_id'=>$request->customer,
                    'project_id'=>$request->project,
                    'invoiceDate'=>$request->invoiceDate,
                    'dueDate'=>$request->dueDate,
                    'advancePaid'=>$request->advancePaid,
                    'notes'=>$request->notes,
                    'status'=>$request->status,
                    'services'=>json_encode($request->services),
                    'totalAmount'=>$request->totalAmount,
                    'balance'=>$request->balance,
                    'hasGST'=>$request->hasGST,
                    'gstPercent'=>$request->gstPercent,
                    'gstNumber'=>$request->gstNumber,
                    'gstAmount'=>$request->gstAmount,
                ]);

                // add the data
                //invoiceStatus

                $project_status=project::where('id',$request->project)->update([
                        'invoiceStatus'=>1,
                        'balanceRemaining'=>$request->balance,
                ]);

                if($createInvoice){
                    return response()->json([
                    'status'=>true,
                    'message'=> 'Invoice Created Successfully...!'
                    ]);
                }else{
                    return response()->json([
                    'status'=>false,
                    'message'=> 'Invoice Not Created'
                    ]);
                }


            //      DB::transaction(function() use ($request, &$invoice) {
            //     // 1) create the invoice
            //     $invoice = invoice::create([
            //         'customer_id'  => $request->customer,
            //         'project_id'   => $request->project,
            //         'invoiceDate'  => $request->invoiceDate,
            //         'dueDate'      => $request->dueDate,
            //         'advancePaid'  => $request->advancePaid,
            //         'notes'        => $request->notes,
            //         'status'       => $request->status,
            //         'services'     => json_encode($request->services),
            //         'totalAmount'  => $request->totalAmount,
            //         'balance'      => $request->balance,
            //     ]);

            //     // 2) log to history
            //     payment::create([
                


            //     'project_id'    => $request->project,
            //     'payment_date'  => now(),
            //     'payment_mode'  => $request->payment_mode,
            //     'payment_proof' => $request->payment_proof,
            //     'amount' => $request->amount,
            //     // save the relative storage path, e.g. "payments/abcd1234.pdf"
            //     // 'payment_file'  => $path,
            //     'updated_by'    => auth()->user()->id,




            //     ]);
            // });



            }catch(\Exception $e){
                return response()->json([
                    'status'=>false,
                    'error'=>'Exception Error',
                    'message'=> $e->getMessage()
                ]);
            }

        }


       public function listInvoice($id=null){

            if($id!=null){
                $invoice=invoice::with(['customer'=>function($qry){
                        $qry->select('id','fullName','mobile','email');
                      },
                      'project'=>function($qry){
                            $qry->select('id','projectTitle','services');
                         },
                       'payments'  
                      
                      ])->find($id);
                          return response()->json([
                    'status'=>true,
                    'invoice'=>$invoice
                ]);
            }
            else{
                      $invoice=invoice::with(['customer'=>function($qry){
                        $qry->select('id','fullName');
                      },
                      'project'=>function($qry){
                            $qry->select('id','projectTitle');
                         }
                      
                      ])
                      ->orderBy('created_at', 'desc')->get();

                      $totalRevenue = $invoice->sum('totalAmount');
                       $tobepaid = $invoice->sum('balance');   

                        return response()->json([
                                'status'=>true,
                                'invoice'=>$invoice,
                                'totalRevenue'=>$totalRevenue,
                                'tobepaid'=>$tobepaid,
                            ]);

            }


       }


            public function listInvoice1($id=null){

            if($id!=null){
                $invoice=invoice::with(['customer'=>function($qry){
                        $qry->select('id','fullName','mobile','email');
                      },
                      'project'=>function($qry){
                            $qry->select('id','projectTitle');
                         },
                       'payments'  
                      
                      ])->find($id);
                          return response()->json([
                    'status'=>true,
                    'invoice'=>$invoice
                ]);
            }
            else{
                      $invoice=invoice::with(['customer'=>function($qry){
                        $qry->select('id','fullName');
                      },
                      'project'=>function($qry){
                            $qry->select('id','projectTitle');
                         }
                      
                      ])
                      ->orderBy('created_at', 'desc')->get();

                      $totalRevenue = $invoice->sum('totalAmount');
                       $tobepaid = $invoice->sum('balance');   

                        return response()->json([
                                'status'=>true,
                                'invoice'=>$invoice,
                                'totalRevenue'=>$totalRevenue,
                                'tobepaid'=>$tobepaid,
                            ]);

            }


       }

       public function update1(Request $request, $id)
{
    $validated = $request->validate([
        'customer' => 'required|integer|exists:customers,id',
        'project' => 'required|integer|exists:projects,id',
        'invoiceDate' => 'required|date',
        'dueDate' => 'required|date',
        'advancePaid' => 'nullable|numeric',
        'status' => 'required|in:Paid,Unpaid',
        'notes' => 'nullable|string',
        'services' => 'required|array|min:1',
        'services.*.name' => 'required|string',
        'services.*.qty' => 'required|numeric|min:1',
        'services.*.unitPrice' => 'required|numeric|min:0',
        'services.*.total' => 'required|numeric|min:0',
    ]);

    DB::beginTransaction();

    try {
        // 1. Update invoice
        $invoice = invoice::findOrFail($id);
        $invoice->update([
            'customer_id' => $validated['customer'],
            'project_id' => $validated['project'],
            'invoiceDate' => $validated['invoiceDate'],
            'dueDate' => $validated['dueDate'],
            'advancePaid' => $validated['advancePaid'],
            'status' => $validated['status'],
            'notes' => $validated['notes'],
            'totalAmount' => $request->totalAmount,
            'balance' => $request->balance,
        ]);

        // 2. Delete old services
        $invoice->services()->delete();

        // 3. Insert updated services
        foreach ($validated['services'] as $service) {
            $invoice->services()->create([
                'name' => $service['name'],
                'qty' => $service['qty'],
                'unitPrice' => $service['unitPrice'],
                'total' => $service['total'],
            ]);
        }

        DB::commit();

        return response()->json([
            'success' => true,
            'message' => 'Invoice updated successfully.',
            'invoice' => $invoice->load('services')
        ]);
    } catch (\Exception $e) {
        DB::rollBack();
        return response()->json([
            'success' => false,
            'message' => 'Update failed.',
            'error' => $e->getMessage()
        ], 500);
    }
        }

        public function update_bkp_workin(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'customer'              => 'required',
        'project'               => 'required',
        'invoiceDate'           => 'required|date',
        'dueDate'               => 'required|date',
        'advancePaid'           => 'required|numeric',
        'notes'                 => 'required|string',
        'status'                => 'required|string',
        'services'              => 'required|array',
        'services.*.name'       => 'required|string',
        'services.*.qty'        => 'required|integer',
        'services.*.unitPrice'  => 'required|numeric',
        'services.*.total'      => 'required|numeric',
        'totalAmount'           => 'required|numeric',
        'balance'               => 'required|numeric',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'error'   => 'Validation Error',
            'message' => $validator->errors()->first()
        ]);
    }

    try {
        $invoice = invoice::find($id);

        if (!$invoice) {
            return response()->json([
                'status' => false,
                'message' => 'Invoice not found.'
            ]);
        }

        $invoice->update([
            'customer_id'  => $request->customer,
            'project_id'   => $request->project,
            'invoiceDate'  => $request->invoiceDate,
            'dueDate'      => $request->dueDate,
            'advancePaid'  => $request->advancePaid,
            'notes'        => $request->notes,
            'status'       => $request->status,
            'services'     => json_encode($request->services),
            'totalAmount'  => $request->totalAmount,
            'balance'      => $request->balance,
        ]);

        return response()->json([
            'status' => true,
            'message' => 'Invoice updated successfully.'
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'status' => false,
            'error' => 'Exception Error',
            'message' => $e->getMessage()
        ]);
    }
}


public function update(Request $request, $id)
{
    $validator = Validator::make($request->all(), [
        'customer'              => 'required',
        'project'               => 'required',
        'invoiceDate'           => 'required|date',
        'dueDate'               => 'required|date',
        'advancePaid'           => 'required|numeric',
        'notes'                 => 'nullable|string',
        'status'                => 'required|string',
        'services'              => 'required|array',
        'services.*.name'       => 'required|string',
        'services.*.qty'        => 'required|integer',
        'services.*.unitPrice'  => 'required|numeric',
        'services.*.total'      => 'required|numeric',
        'totalAmount'           => 'required|numeric',
        'balance'               => 'required|numeric',
        'hasGST'                => 'required|boolean',
        'gstPercent'            => 'nullable|numeric',
        'getAmount'             => 'nullable|numeric',
        'gstNumber'             => 'nullable|string',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'error'   => 'Validation Error',
            'message' => $validator->errors()->first()
        ]);
    }

    try {
        $invoice = Invoice::find($id);

        if (!$invoice) {
            return response()->json([
                'status' => false,
                'message' => 'Invoice not found.'
            ]);
        }

        $invoice->update([
            'customer_id'  => $request->customer,
            'project_id'   => $request->project,
            'invoiceDate'  => $request->invoiceDate,
            'dueDate'      => $request->dueDate,
            'advancePaid'  => $request->advancePaid,
            'notes'        => $request->notes,
            'status'       => $request->status,
            'services'     => $request->services, // JSON column, no encode needed
            'totalAmount'  => $request->totalAmount,
            'balance'      => $request->balance,
            'hasGST'       => $request->hasGST,
            'gstPercent'   => $request->gstPercent,
            'gstAmount'    => $request->getAmount,
            'gstNumber'    => $request->gstNumber,
        ]);

        return response()->json([
            'status'  => true,
            'message' => 'Invoice updated successfully.'
        ]);

    } catch (\Exception $e) {
        return response()->json([
            'status'  => false,
            'error'   => 'Exception Error',
            'message' => $e->getMessage()
        ]);
    }
}


}
