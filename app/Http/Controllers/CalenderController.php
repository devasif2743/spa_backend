<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\calender;
use App\Models\User;
use App\Models\customer;
use Validator;
use App\Mail\MeetingScheduledMail;
use Illuminate\Support\Facades\Mail;
use App\Events\MeetingScheduled;

class CalenderController extends Controller
{
    //

    public function create_task(Request $request){
          $saas_id=auth()->user()->saas_id;
     
        
        
        $validator=validator::make($request->all(),[
            'type'=>'required',
            'title'=>'required|string',
            'assignedTo'=>'required',
            // 'assignedToName'=>'required',
            'dueDate'=>'required|date',
            'linkedProjectName'=>'required|string',
            // 'status'=>'required|string',
            'linkedProject'=>'required|string',
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'error'=>'Validation Error',
                'message'=> $validator->errors()->first()
            ]);
        }

        try{

             $saveCustomer=calender::create([
                'type'=>$request->type,
                'task_title'=>$request->title,
                'assignedTo'=>$request->assignedTo,
                'date'=>$request->dueDate,
                'status'=>"Pending",
                'project'=>$request->linkedProjectName,
                'project_id'=>$request->linkedProject,
               
                // 'saas_id'=>'admin',
             ]);

             if($saveCustomer){
                 return response()->json([
                'status'=>true,
                'message'=> 'Task Added Successfully...!'
                ]);
             }else{
                return response()->json([
                'status'=>false,
                'message'=> 'Task Not Added'
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


    public function create_meeting(Request $request){
          $saas_id=auth()->user()->saas_id;
     
        
        
        $validator=validator::make($request->all(),[
            'type'=>'required',
            'meetTitle'=>'required|string',
            'customerId'=>'required',
            'Staffid'=>'required',
            'selectedMembers'=>'required',
            'selectedCustomer'=>'required',
            'selectedCustomerName'=>'required',
            'date'=>'required|date',
            'meetingLink'=>'required|url',
            'slot'=>'required',
            
        
        ]);

        if($validator->fails()){
            return response()->json([
                'status'=>false,
                'error'=>'Validation Error',
                'message'=> $validator->errors()->first()
            ]);
        }

        try{


            // $rawStaff = $request->Staffid;
            //     $staffIds = is_array($rawStaff)
            //         ? $rawStaff
            //         : (is_string($rawStaff) && str_starts_with($rawStaff, '[')
            //             ? json_decode($rawStaff, true)
            //             : explode(',', $rawStaff));
            //     $staffIds = array_filter($staffIds, 'is_numeric');
            //     $staffEmails = User::whereIn('id', $staffIds)->pluck('email')->toArray();

            //     // Customer Email Fetching
            //     $rawCustomer = $request->customerId;
            //     $customerIds = is_array($rawCustomer)
            //         ? $rawCustomer
            //         : (is_string($rawCustomer) && str_starts_with($rawCustomer, '[')
            //             ? json_decode($rawCustomer, true)
            //             : explode(',', $rawCustomer));

            //             // dd($rawCustomer);
            //     $customerIds = array_filter($customerIds, 'is_numeric');
            //     $customerEmails = customer::whereIn('id', $customerIds)->pluck('email')->toArray();

            //     // Final output
            //     dd([
            //         'staffEmails' => $staffEmails,
            //         'customerEmails' => $customerEmails,
            //     ]);



              $staffIds = is_array($request->Staffid)
        ? $request->Staffid
        : (is_string($request->Staffid) && str_starts_with($request->Staffid, '[')
            ? json_decode($request->Staffid, true)
            : explode(',', $request->Staffid));

    $customerIds = is_array($request->customerId)
        ? $request->customerId
        : (is_string($request->customerId) && str_starts_with($request->customerId, '[')
            ? json_decode($request->customerId, true)
            : explode(',', $request->customerId));

    $staffIds = array_filter($staffIds, 'is_numeric');
    $customerIds = array_filter($customerIds, 'is_numeric');

    $staffEmails = User::whereIn('id', $staffIds)->pluck('email')->toArray();
    $customerEmails = Customer::whereIn('id', $customerIds)->pluck('email')->toArray();

    $allRecipients = array_unique(array_merge($staffEmails, $customerEmails));

    $details = [
        'date' => $request->date ?? '2025-06-21',
        'time' => $request->slot ?? '9:30 AM IST',
        'link' => $request->meetingLink ?? 'https://meet.google.com/your-meeting-id',
    ];


    // dd($allRecipients);
    event(new MeetingScheduled($allRecipients, $details));

    //    return response()->json(['message' => 'Meeting scheduled emails are being sent.']);


          
             $saveCustomer=calender::create([
                'type'=>$request->type,
                'task_title'=>$request->meetTitle,
                'assignedTo' => $request->selectedMembers, 
                'date'=>$request->date,
                'customer'=>$request->selectedCustomerName,
                'zoomLink'=>$request->meetingLink,
                'customer_id'=>$request->customerId,
                'assignToId'=>$request->Staffid,
                'timeSlot'=>$request->slot,
                
              
               
                // 'saas_id'=>'admin',
             ]);

             if($saveCustomer){
                 return response()->json([
                'status'=>true,
                'message'=> 'Meeting create Successfully...!'
                ]);
             }else{
                return response()->json([
                'status'=>false,
                'message'=> 'Meeting Not created'
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

            $saas_id=auth()->user()->saas_id;
           

             if ($id !== null) {
                        // $customer = Customer::where('deleted_at','!=',null)->find($id);
                        $calenderData = calender::where('saas_id',$saas_id)->find($id);
                        
                        if (!$calenderData) {
                            return response()->json([
                                'status' => false,
                                'message' => 'Calender not found.'
                            ]);
                        }
                        return response()->json([
                            'status' => true,
                            'data' => $calenderData
                        ]);
              }

        // Fetching all customers (Consider using pagination or selecting necessary fields if large dataset)
        $allCustomers = calender::where('saas_id',$saas_id)->get();

        // Returning the response with data
        return response()->json([
            'status' => true,
            'data' => $allCustomers,
           
        ]);

    } catch (\Exception $e) {
        // Handle the exception
        return response()->json([
            'status' => false,
            'error' => 'Exception Error',
            'message' => $e->getMessage(),
            'trace' => $e->getTraceAsString() // Optionally, add trace for debugging
        ]);

               
        }
    }


}