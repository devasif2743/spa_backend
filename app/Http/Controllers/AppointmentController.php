<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;

use App\Models\appointment;
use App\Models\User;
use Illuminate\Support\Facades\Validator;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Rule;
use Carbon\Carbon;
use App\Models\service;
use App\Models\membershippurchase;
use Barryvdh\DomPDF\Facade\Pdf;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;

use App\Models\Branch;

class AppointmentController extends Controller
{
  

    public function store(Request $request)
{
    // 1️⃣ Validate everything except start/end time (we'll calculate them)
    $validator = Validator::make($request->all(), [
        'customer_name'      => 'required|string',
        'customer_phone'     => 'required|numeric',
        'staff_id'           => 'required|integer',
        'staff_name'         => 'required|string',
        'service_id'         => 'nullable|integer',
        'payment_method'     => 'required|string',
        'transaction_number' => 'nullable|string',
        'cart'               => 'required|array|min:1',
        'item_total'         => 'required|numeric|min:0',
        'bill_discount'      => 'required|numeric|min:0',
        'grand_total'        => 'required|numeric|min:0',
        'total_duration'     => 'required|integer|min:0',  // in minutes
        'customer_source' => 'required|string|max:50',
        'billed_staff_id'    => 'required|integer',
        'billed_staff_name'  => 'required|string|max:255',
        'membership_id'  => 'nullable|integer',
        'totalCartServices'  => 'required|integer',

        'membership_discount'  => 'nullable',
        'free_services_used'  => 'nullable',
        'gst_percent'  => 'nullable',
        'gst_amount'  => 'nullable',
        'final_total'  => 'nullable',
        'voucherCode'  => 'nullable',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ], 422);
    }

    $data = $validator->validated();

    // 2️⃣ Find the staff member’s last appointment that ends after now
    $latest = appointment::where('staff_id', $data['staff_id'])
        ->where('end_time', '>', Carbon::now())
        ->orderBy('end_time', 'desc')
        ->first();

    // 3️⃣ Decide the start time
    //    - if the staff is busy, start after their last appointment ends
    //    - otherwise, start now
    $start = $latest ? Carbon::parse($latest->end_time) : Carbon::now();

    // 4️⃣ Compute the end time
    $end = $start->copy()->addMinutes($data['total_duration']);

    // 5️⃣ Create the appointment
    $appointment = Appointment::create([
        'customer_name'      => $data['customer_name'],
        'customer_phone'     => $data['customer_phone'],
        'staff_id'           => $data['staff_id'],
        'staff_name'         => $data['staff_name'],
        'service_id'         => $data['service_id'] ?? null,
        'payment_method'     => $data['payment_method'],
        'transaction_number' => $data['transaction_number'] ?? null,
        'cart'               => json_encode($data['cart']),
        'item_total'         => $data['item_total'],
        'bill_discount'      => $data['bill_discount'],
        'grand_total'        => $data['grand_total'],
        'start_time'         => $start,
        'end_time'           => $end,
        'total_duration'     => $data['total_duration'],
        'branch_id'     =>  auth()->user()->branch_id,
        'customer_source'=>  $request->customer_source,
        'billed_staff_id'    => $data['billed_staff_id'],
        'billed_staff_name'  => $data['billed_staff_name'],
        'membership_id'  => $data['membership_id'] ?? null,
        'total_service'  => $data['totalCartServices'] ?? null,
        
        
        'membership_discount'  => $data['membership_discount'] ?? null,
        'free_services_used'  => $data['free_services_used'] ?? null,
        'gst_percent'  => $data['gst_percent'] ?? null,
        'gst_amount'  => $data['gst_amount'] ?? null,
        'final_total'  => $data['final_total'] ?? null,
        'voucherCode'  => $data['voucherCode'] ?? null,


    ]);

      $pdf = Pdf::loadView('pdf.bill', ['appointment' => $appointment]);
    $fileName = 'invoice_' . $appointment->id . '.pdf';
    $filePath = 'public/bills/' . $fileName;

    Storage::put($filePath, $pdf->output());

    // 7️⃣ Generate Public URL
    $pdfUrl = asset(Storage::url($filePath)); // e.g. https://yourdomain.com/storage/bills/invoice_1.pdf

    // 8️⃣ Send WhatsApp Message (via 360Dialog)
    $phone = $appointment->customer_phone;

    // Replace with your 360Dialog WhatsApp API token
    $token = env('WHATSAPP_API_TOKEN');

    $message = "Hello {$appointment->customer_name}, your invoice is ready. You can download it here: $pdfUrl";

  
     $curl = curl_init();

    curl_setopt_array($curl, [
        CURLOPT_URL => 'https://api.360messenger.com/v2/sendMessage',
        CURLOPT_RETURNTRANSFER => true,
        CURLOPT_POST => true,
        CURLOPT_POSTFIELDS => [
            'phonenumber' => $phone,
            'text' => $message,
            'url' => $pdfUrl, // optional: attaches PDF link or preview
        ],
    ]);

    $response = curl_exec($curl);
    $error = curl_error($curl);
    curl_close($curl);

    // Optional: decode response
    $whatsappResponse = $response ? json_decode($response, true) : null;

    // 6️⃣ Return response
    return response()->json([
        'status' => true,
        'message' => 'Billing completed, PDF generated and WhatsApp sent',
        'data' => [
            'appointment' => $appointment,
            'pdf_url' => $pdfUrl,
            'whatsapp_response' => $whatsappResponse ?: $error,
        ],
    ]);


    // return response()->json([
    //     'status'  => true,
    //     'message' => 'Appointment stored successfully',
    //     'data'    => $appointment,
    // ], 201);
}


public function store2(Request $request)
{
    // 1️⃣ Validate everything except start/end time (we'll calculate them)
    $validator = Validator::make($request->all(), [
        'customer_name'      => 'required|string',
        'customer_phone'     => 'required|numeric',
        'staff_id'           => 'required|integer',
        'staff_name'         => 'required|string',
        'service_id'         => 'nullable|integer',
        'payment_method'     => 'required|string',
        'transaction_number' => 'nullable|string',
        'cart'               => 'required|array|min:1',
        'item_total'         => 'required|numeric|min:0',
        'bill_discount'      => 'required|numeric|min:0',
        'grand_total'        => 'required|numeric|min:0',
        'total_duration'     => 'required|integer|min:0',  // in minutes
        'customer_source'    => 'required|string|max:50',
        'billed_staff_id'    => 'required|integer',
        'billed_staff_name'  => 'required|string|max:255',
        'membership_id'      => 'nullable|integer',
        'totalCartServices'  => 'required|integer',

        'membership_discount'=> 'nullable',
        'free_services_used' => 'nullable',
        'gst_percent'        => 'nullable',
        'gst_amount'         => 'nullable',
        'final_total'        => 'nullable',
        'voucherCode'        => 'nullable',

        // ✅ New field for future appointment
        'scheduled_date'     => 'nullable|date',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ], 422);
    }

    $data = $validator->validated();

    // 2️⃣ Pick scheduled date or default to now
    $scheduledDate = $data['scheduled_date']
        ? Carbon::parse($data['scheduled_date'])
        : Carbon::now();

    // 3️⃣ Find the staff member’s last appointment after this scheduled date
    $latest = appointment::where('staff_id', $data['staff_id'])
        ->where('end_time', '>', $scheduledDate)
        ->orderBy('end_time', 'desc')
        ->first();

    // 4️⃣ Decide the start time
    $start = $latest ? Carbon::parse($latest->end_time) : $scheduledDate;

    // 5️⃣ Compute the end time
    $end = $start->copy()->addMinutes($data['total_duration']);

    // 6️⃣ Create the appointment
    $appointment = appointment::create([
        'customer_name'      => $data['customer_name'],
        'customer_phone'     => $data['customer_phone'],
        'staff_id'           => $data['staff_id'],
        'staff_name'         => $data['staff_name'],
        'service_id'         => $data['service_id'] ?? null,
        'payment_method'     => $data['payment_method'],
        'transaction_number' => $data['transaction_number'] ?? null,
        'cart'               => json_encode($data['cart']),
        'item_total'         => $data['item_total'],
        'bill_discount'      => $data['bill_discount'],
        'grand_total'        => $data['grand_total'],
        'start_time'         => $start,
        'end_time'           => $end,
        'total_duration'     => $data['total_duration'],
        'branch_id'          => auth()->user()->branch_id,
        'customer_source'    => $request->customer_source,
        'billed_staff_id'    => $data['billed_staff_id'],
        'billed_staff_name'  => $data['billed_staff_name'],
        'membership_id'      => $data['membership_id'] ?? null,
        'total_service'      => $data['totalCartServices'] ?? null,

        'membership_discount'=> $data['membership_discount'] ?? null,
        'free_services_used' => $data['free_services_used'] ?? null,
        'gst_percent'        => $data['gst_percent'] ?? null,
        'gst_amount'         => $data['gst_amount'] ?? null,
        'final_total'        => $data['final_total'] ?? null,
        'voucherCode'        => $data['voucherCode'] ?? null,
        'adv_booking'        =>'yes',
    ]);

    return response()->json([
        'status'  => true,
        'message' => 'Appointment stored successfully',
        'data'    => $appointment,
    ], 201);
}

public function store1(Request $request)
{
    $validator = Validator::make($request->all(), [
        'customer_name'      => 'required|string',
        'customer_phone'     => 'required|numeric',
        'staff_id'           => 'required|integer',
        'staff_name'         => 'required|string',
        'cart'               => 'required|array|min:1',
        'item_total'         => 'required|numeric|min:0',
        'bill_discount'      => 'required|numeric|min:0',
        'grand_total'        => 'required|numeric|min:0',
        'total_duration'     => 'required|integer|min:0',
        'customer_source'    => 'required|string|max:50',
        'billed_staff_id'    => 'required|integer',
        'billed_staff_name'  => 'required|string|max:255',
        'payment_method'     => 'required|string',
        'scheduled_date'     => 'nullable|date',  // future booking
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ], 422);
    }

    $data = $validator->validated();

    // Scheduled start date/time
    $scheduledDate = $data['scheduled_date']
        ? Carbon::parse($data['scheduled_date'])
        : Carbon::now();

    // Calculate end time
    $end = $scheduledDate->copy()->addMinutes($data['total_duration']);

    // 🔍 Check for overlaps
    $conflict = appointment::where('staff_id', $data['staff_id'])
        ->where(function ($q) use ($scheduledDate, $end) {
            $q->whereBetween('start_time', [$scheduledDate, $end])
              ->orWhereBetween('end_time', [$scheduledDate, $end])
              ->orWhere(function ($q2) use ($scheduledDate, $end) {
                  $q2->where('start_time', '<', $scheduledDate)
                     ->where('end_time', '>', $end);
              });
        })
        ->exists();

    if ($conflict) {
        return response()->json([
            'status'  => false,
            'message' => 'Selected staff is already booked during this time.'
        ], 201);
    }

    // ✅ No conflict, create appointment
    $appointment = appointment::create([
        'customer_name'      => $data['customer_name'],
        'customer_phone'     => $data['customer_phone'],
        'staff_id'           => $data['staff_id'],
        'staff_name'         => $data['staff_name'],
        'cart'               => json_encode($data['cart']),
        'item_total'         => $data['item_total'],
        'bill_discount'      => $data['bill_discount'],
        'grand_total'        => $data['grand_total'],
        'start_time'         => $scheduledDate,
        'end_time'           => $end,
        'total_duration'     => $data['total_duration'],
        'branch_id'          => auth()->user()->branch_id,
        'customer_source'    => $request->customer_source,
        'billed_staff_id'    => $data['billed_staff_id'],
        'billed_staff_name'  => $data['billed_staff_name'],
        'payment_method'     => $data['payment_method'],
        'adv_booking'        => 'yes',
    ]);

    return response()->json([
        'status'  => true,
        'message' => 'Appointment stored successfully',
        'data'    => $appointment,
    ], 201);
}

public function store3(Request $request)
{
    $validator = Validator::make($request->all(), [
        'customer_name'      => 'required|string',
        'customer_phone'     => 'required|numeric',
        'staff_id'           => 'required|integer',
        'staff_name'         => 'required|string',
        'cart'               => 'required|array|min:1',
        'item_total'         => 'required|numeric|min:0',
        'bill_discount'      => 'required|numeric|min:0',
        'grand_total'        => 'required|numeric|min:0',
        'total_duration'     => 'required|integer|min:0',
        'customer_source'    => 'required|string|max:50',
        'billed_staff_id'    => 'required|integer',
        'billed_staff_name'  => 'required|string|max:255',
        'payment_method'     => 'required|string',
        'scheduled_date'     => 'nullable|date',  // future booking
        'membership_id'     => 'nullable',  // future booking
        'free_services_used'     => 'nullable',  // future booking
        'voucherCode'     => 'nullable',  // future booking
        'datetime'     => 'required',  // future booking
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status' => false,
            'errors' => $validator->errors()
        ], 422);
    }

    $data = $validator->validated();

    $scheduledDate = Carbon::parse($data['datetime']);

    // Check if it's a future booking
    $isFutureBooking = $scheduledDate->isFuture() ? 'yes' : 'no';

   

            $scheduledDate = $request->filled('scheduled_date')
        ? Carbon::parse($request->input('scheduled_date'))
        : Carbon::now();



    // Calculate end time
    $end = $scheduledDate->copy()->addMinutes($data['total_duration']);

   
    $appointment = appointment::create([
        'customer_name'      => $data['customer_name'],
        'customer_phone'     => $data['customer_phone'],
        'staff_id'           => $data['staff_id'],
        'staff_name'         => $data['staff_name'],
        'cart'               => json_encode($data['cart']),
        'item_total'         => $data['item_total'],
        'bill_discount'      => $data['bill_discount'],
        'grand_total'        => $data['grand_total'],
        'start_time'         => $scheduledDate,
        'end_time'           => $end,
        'total_duration'     => $data['total_duration'],
        'branch_id'          => auth()->user()->branch_id,
        'customer_source'    => $request->customer_source,
        'billed_staff_id'    => $data['billed_staff_id'],
        'billed_staff_name'  => $data['billed_staff_name'],
        'payment_method'     => $data['payment_method'],
        // 'voucherCode'     => $data['voucherCode'] ?? null,
        'voucherCode' => $data['voucherCode'] ?? null,
        'free_services_used' => $data['free_services_used'] ?? null,
        'membership_id' => $data['membership_id'] ?? null,
        'adv_booking'        => $isFutureBooking,
        'appdate'        => $data['datetime'],
      
    ]);

//      $pdf = Pdf::loadView('pdf.bill', ['appointment' => $appointment]);
//     $fileName = 'invoice_' . $appointment->id . '.pdf';
//     $filePath = 'public/bills/' . $fileName;
//     Storage::put($filePath, $pdf->output());
//     $pdfUrl = asset(Storage::url($filePath));

// $phone = $appointment->customer_phone;
// // $message = "Hello {$appointment->customer_name}, your invoice is ready. You can view or download it here:\n{$pdfUrl}";
// // $message = "*Hello {$appointment->customer_name}*, your invoice is ready! 💬\n\nClick below to view it:\n👉 {$pdfUrl}";

// $message = "💬 *Hello {$appointment->customer_name}*,\n\n"
//           . "Your invoice is ready! 🧾\n\n"
//           . "------------------------------------\n"
//           . "📄 *Invoice ID:* {$appointment->id}\n"
//           . "💰 *Amount:* ₹{$appointment->total_amount}\n"
//           . "------------------------------------\n\n"
//           . "⬇️ *Click the button below to view your invoice:*\n\n"
//           . "🔘 *[ VIEW INVOICE ]* 🔗\n{$pdfUrl}\n\n"
//           . "Thank you for choosing us! 😊";

// $apiKey = env('WHATSAPP_API_TOKEN');
// $curl = curl_init();





// curl_setopt_array($curl, [
//     CURLOPT_URL => "https://api.360messenger.net/sendMessage/{$apiKey}",
//     CURLOPT_RETURNTRANSFER => true,
//     CURLOPT_ENCODING => '',
//     CURLOPT_MAXREDIRS => 10,
//     CURLOPT_TIMEOUT => 30,
//     CURLOPT_FOLLOWLOCATION => true,
//     CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
//     CURLOPT_CUSTOMREQUEST => 'POST',
//     CURLOPT_POSTFIELDS => [
//         'phonenumber' => (str_starts_with($phone, '0') ? $phone : '0' . $phone),
//         'text' => $message,
//         // 'url'  => $pdfUrl,
//     ],
//     //  CURLOPT_POSTFIELDS => json_encode($data),
    
// ]);

// ✅ Generate and save PDF
$pdf = Pdf::loadView('pdf.bill', ['appointment' => $appointment]);
$fileName = 'invoice_' . $appointment->id . '.pdf';
$filePath = 'public/bills/' . $fileName;
Storage::put($filePath, $pdf->output());
$pdfUrl = asset(Storage::url($filePath));

// ✅ Decode services from cart
$cartItems = json_decode($appointment->cart, true);
$serviceLines = '';
$totalAmount = 0;

foreach ($cartItems as $item) {
    $name = $item['name'] ?? 'Service';
    $lineTotal = $item['line_total'] ?? 0;
    $serviceLines .= "• {$name} — ₹{$lineTotal}\n";
    $totalAmount += (float) $lineTotal;
}

// ✅ Format WhatsApp message
$message = "💬 *Hello {$appointment->customer_name}*,\n\n"
    . "Your invoice is ready! 🧾\n\n"
    . "🏢 *Branch:* {$appointment->branch['name']}\n"
    . "👩‍💼 *Staff:* {$appointment->staff_name}\n"
    . "💳 *Payment:* {$appointment->payment_method}\n"
    . "------------------------------------\n"
    . "🧖‍♀️ *Services:*\n{$serviceLines}\n"
    . "💰 *Grand Total:* ₹{$appointment->grand_total}\n"
    . "------------------------------------\n\n"
    . "⬇️ *Click below to view your invoice:*\n\n"
    . "🔘 *[ VIEW INVOICE ]* 🔗\n{$pdfUrl}\n\n"
    . "Thank you for visiting us! 😊";

// ✅ Prepare WhatsApp API request
$apiKey = env('WHATSAPP_API_TOKEN');
$phone = $appointment->customer_phone;

// ensure proper phone format (add leading 0 if needed)
if (!str_starts_with($phone, '0')) {
    $phone = '0' . $phone;
}

$curl = curl_init();
curl_setopt_array($curl, [
    CURLOPT_URL => "https://api.360messenger.net/sendMessage/{$apiKey}",
    CURLOPT_RETURNTRANSFER => true,
    CURLOPT_ENCODING => '',
    CURLOPT_MAXREDIRS => 10,
    CURLOPT_TIMEOUT => 30,
    CURLOPT_FOLLOWLOCATION => true,
    CURLOPT_HTTP_VERSION => CURL_HTTP_VERSION_1_1,
    CURLOPT_CUSTOMREQUEST => 'POST',
    CURLOPT_POSTFIELDS => [
        'phonenumber' => $phone,
        'text' => $message,
    ],
]);

$response = curl_exec($curl);
$error = curl_error($curl);
curl_close($curl);

// (Optional) Log response for debugging
if ($error) {
    Log::error("WhatsApp Send Error: " . $error);
} else {
    Log::info("WhatsApp Sent: " . $response);
}


$response = curl_exec($curl);
$error = curl_error($curl);
curl_close($curl);

// Handle response
if ($error) {
    $whatsappResponse = ['error' => $error];
} else {
    $decoded = json_decode($response, true);
    if (json_last_error() === JSON_ERROR_NONE) {
        $whatsappResponse = $decoded;
    } else {
        $whatsappResponse = ['raw' => trim($response)];
    }
}

// return to client
return response()->json([
    'status' => true,
    'message' => 'Billing completed, PDF generated and WhatsApp sent',
    'data' => [
        'appointment' => $appointment,
        'pdf_url' => $pdfUrl,
        'whatsapp_response' => $whatsappResponse,
    ],
]);


    // return response()->json([
    //     'status'  => true,
    //     'message' => 'Appointment stored successfully',
    //     'data'    => $appointment,
    // ], 201);
}



    public function index(){
        $now = Carbon::now();

         $staff = User::where('branch_id', auth()->user()->branch_id)
        ->where('role','therapist')
        ->get()                               // ✅ fetch the collection first
        ->map(function ($s) use ($now) {
            // find this staff's latest appointment that ends after now
            $latest = appointment::where('staff_id', $s->id)
                ->where('end_time', '>', $now)
                ->orderBy('end_time', 'desc')
                ->first();

            $minutesFree = 0;
            if ($latest) {
                $minutesFree = Carbon::parse($latest->end_time)->diffInMinutes($now);
            }

            return [
                'id'           => $s->id,
                'name'         => $s->name,
                'next_free_in' => $minutesFree, // 0 means currently free
            ];
        });

    return response()->json([
        'status' => true,
        'staff'  => $staff,
    ]);
    }

    

     public function allstaff(){
        $now = Carbon::now();

         $staff = User::where('branch_id', auth()->user()->branch_id)
        
        ->get()                               // ✅ fetch the collection first
        ->map(function ($s) use ($now) {
            // find this staff's latest appointment that ends after now
            $latest = appointment::where('staff_id', $s->id)
                ->where('end_time', '>', $now)
                ->orderBy('end_time', 'desc')
                ->first();

            $minutesFree = 0;
            if ($latest) {
                $minutesFree = Carbon::parse($latest->end_time)->diffInMinutes($now);
            }

            return [
                'id'           => $s->id,
                'name'         => $s->name,
                'next_free_in' => $minutesFree, // 0 means currently free
            ];
        });

    return response()->json([
        'status' => true,
        'staff'  => $staff,
    ]);
    }


    public function advstaff_old(Request $request)
{
    // If frontend passes ?date=2025-09-25T14:00, use that, else default to now
    $date = $request->query('date');
    $targetTime = $date ? Carbon::parse($date) : Carbon::now();

    $staff = User::where('branch_id', auth()->user()->branch_id)
        ->get()
        ->map(function ($s) use ($targetTime) {
            // find this staff's latest appointment that ends after target time
            $latest = appointment::where('staff_id', $s->id)
                ->where('end_time', '>', $targetTime)
                ->orderBy('end_time', 'desc')
                ->first();

            $minutesFree = 0;
            if ($latest) {
                $minutesFree = Carbon::parse($latest->end_time)->diffInMinutes($targetTime);
            }

            return [
                'id'           => $s->id,
                'name'         => $s->name,
                'next_free_in' => $minutesFree, // 0 means free at that date/time
            ];
        });

    return response()->json([
        'status' => true,
        'staff'  => $staff,
    ]);
}


public function advstaff(Request $request)
{
    // Use scheduled date from frontend if provided, else now
    $date = $request->query('date');
    $targetTime = $date ? Carbon::parse($date) : Carbon::now();

    $staff = User::where('branch_id', auth()->user()->branch_id)
        ->get()
        ->map(function ($s) use ($targetTime) {
            // find latest appointment that overlaps/ends after chosen time
            $latest = Appointment::where('staff_id', $s->id)
                ->where('end_time', '>', $targetTime)
                ->orderBy('end_time', 'asc') // earliest upcoming
                ->first();

            if ($latest) {
                $start = Carbon::parse($latest->start_time)->format('h:i A');
                $end   = Carbon::parse($latest->end_time)->format('h:i A');

                return [
                    'id'   => $s->id,
                    'name' => $s->name,
                    'status' => 'busy',
                    'slot' => $start . ' to ' . $end,
                ];
            } else {
                // Staff free for the rest of the day
                return [
                    'id'   => $s->id,
                    'name' => $s->name,
                    'status' => 'free',
                    'slot' => $targetTime->format('h:i A') . ' onwards',
                ];
            }
        });

    return response()->json([
        'status' => true,
        'staff'  => $staff,
    ]);
}


public function staffAvailability(Request $request)
{
    $date = Carbon::parse($request->date)->toDateString();

    $staff = User::where('branch_id', auth()->user()->branch_id)
        ->where('role','therapist')
        ->get()
        ->map(function ($s) use ($date) {
            $appointments = appointment::where('staff_id', $s->id)
                ->whereDate('start_time', $date)
                ->orderBy('start_time', 'asc')
                ->get();

            $slots = [];
            foreach ($appointments as $app) {
                $slots[] = [
                    'from'   => Carbon::parse($app->start_time)->format('h:i A'),
                    'to'     => Carbon::parse($app->end_time)->format('h:i A'),
                    'status' => 'busy'
                ];
            }

            return [
                'id'    => $s->id,
                'name'  => $s->name,
                'slots' => $slots
            ];
        });

    return response()->json([
        'status' => true,
        'staff'  => $staff,
    ]);
}






   public function checkPhone($phone)
    {
        $appointment = appointment::where('customer_phone', $phone)
                   ->latest()
                   ->first(['customer_name', 'customer_phone']); // fetch only these columns

    if ($appointment) {
        return response()->json([
            'exists' => true,
            'customer_name' => $appointment->customer_name,
            'customer_phone' => $appointment->customer_phone,
        ]);
    }

    return response()->json(['exists' => false]);
    }


    // app/Http/Controllers/ReportController.php
    public function reportss_old(Request $request)
{


        $branchId = $request->query('branch_id');   // optional
        $days     = $request->query('days', 30);    // default 30 days
        $start    = now()->subDays($days);

        // Filter appointments/billings in the given period
        $query = DB::table('appointments')   // or appointments table if revenue is there
            ->where('created_at', '>=', $start);

        if ($branchId) {
            $query->where('branch_id', $branchId);
        }

        $transactions = $query->get();

        // --- Totals ---
        $totalRevenue      = $transactions->sum('grand_total');
        $totalTransactions = $transactions->count();
        $avgTransaction    = $totalTransactions > 0
            ? $totalRevenue / $totalTransactions
            : 0;

        // --- Daily revenue (for line chart) ---
        $daily = DB::table('appointments')
            ->select(
                DB::raw('DATE(created_at) as date'),
                DB::raw('SUM(grand_total) as revenue'),
                DB::raw('COUNT(*) as transactions')
            )
            ->where('created_at', '>=', $start)
            ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
            ->groupBy(DB::raw('DATE(created_at)'))
            ->orderBy('date')
            ->get();

      
        $categoryRevenue = [];
      

        foreach ($transactions as $t) {
                $rawCart = $t->cart ?? '[]';
                $items   = json_decode($rawCart, true);

                if (!is_array($items)) {
                    // skip invalid or empty cart
                    continue;
                }

                foreach ($items as $item) {
                    $name = $item['name'] ?? 'Unknown';
                    $categoryRevenue[$name] = ($categoryRevenue[$name] ?? 0)
                                            + (($item['price'] ?? 0) * ($item['quantity'] ?? 1));
                }
            }


        $categoryPerformance = collect($categoryRevenue)
            ->map(fn($rev, $name) => ['name' => $name, 'revenue' => $rev])
            ->values();

        return response()->json([
            'totalRevenue'       => $totalRevenue,
            'totalTransactions'  => $totalTransactions,
            'avgTransaction'     => $avgTransaction,
            'dailyData'          => $daily,
            'categoryPerformance'=> $categoryPerformance,
        ]);
    }

     public function report(Request $request)
    {

       $branchId = auth()->user()->branch_id;
    $days     = (int) $request->query('days', 30);
    $start    = now()->subDays($days);

    // 1️⃣  Filter appointments
    $query = DB::table('appointments')
        ->where('created_at', '>=', $start);

    if ($branchId) {
        $query->where('branch_id', $branchId);
    }

    $transactions = $query->get();

    // 2️⃣  Totals
    $totalRevenue      = $transactions->sum('grand_total');
    $totalTransactions = $transactions->count();
    $avgTransaction    = $totalTransactions > 0
        ? $totalRevenue / $totalTransactions
        : 0;

    // 3️⃣  Daily revenue trend
    $daily = DB::table('appointments')
        ->select(
            DB::raw('DATE(created_at) as date'),
            DB::raw('SUM(grand_total) as revenue'),
            DB::raw('COUNT(*) as transactions')
        )
        ->where('created_at', '>=', $start)
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy(DB::raw('DATE(created_at)'))
        ->orderBy('date')
        ->get();

    // 4️⃣  Category (Service) performance
    $categoryRevenue = [];
    foreach ($transactions as $t) {
        $rawCart = $t->cart ?? '[]';
        $items   = json_decode($rawCart, true);
        if (is_string($items)) {
            $items = json_decode($items, true);
        }
        if (!is_array($items)) continue;

        foreach ($items as $item) {
            $name  = $item['name'] ?? 'Unknown';
            $price = (float)($item['price'] ?? 0);
            $qty   = (int)($item['quantity'] ?? 1);
            $categoryRevenue[$name] = ($categoryRevenue[$name] ?? 0) + ($price * $qty);
        }
    }

    $categoryPerformance = collect($categoryRevenue)
        ->map(fn ($rev, $name) => ['name' => $name, 'revenue' => $rev])
        ->values();

    // 5️⃣  Customer source performance  (walk-in, google, linkedin …)
    $customerSourcePerformance = DB::table('appointments')
        ->select(
            DB::raw("COALESCE(customer_source,'Unknown') as source"),
            DB::raw("COUNT(*) as count")
        )
        ->where('created_at', '>=', $start)
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy('source')
        ->orderBy('count','desc')
        ->get();

    // 6️⃣  Final response
    return response()->json([
        'totalRevenue'            => $totalRevenue,
        'totalTransactions'       => $totalTransactions,
        'avgTransaction'          => $avgTransaction,
        'dailyData'               => $daily,
        'categoryPerformance'     => $categoryPerformance,
        'customerSourcePerformance'=> $customerSourcePerformance,
    ]);
    }

      public function reportss_working(Request $request)
    {

        $branchId = $request->query('branch_id');
    $days     = (int) $request->query('days', 30);
    $start    = now()->subDays($days);

    // 1️⃣  Filter appointments
    $query = DB::table('appointments')
        ->where('created_at', '>=', $start);

    if ($branchId) {
        $query->where('branch_id', $branchId);
    }

    $transactions = $query->get();

    // 2️⃣  Totals
    $totalRevenue      = $transactions->sum('grand_total');
    $totalTransactions = $transactions->count();
    $avgTransaction    = $totalTransactions > 0
        ? $totalRevenue / $totalTransactions
        : 0;

    // 3️⃣  Daily revenue trend
    $daily = DB::table('appointments')
        ->select(
            DB::raw('DATE(created_at) as date'),
            DB::raw('SUM(grand_total) as revenue'),
            DB::raw('COUNT(*) as transactions')
        )
        ->where('created_at', '>=', $start)
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy(DB::raw('DATE(created_at)'))
        ->orderBy('date')
        ->get();

    // 4️⃣  Category (Service) performance
    $categoryRevenue = [];
    foreach ($transactions as $t) {
        $rawCart = $t->cart ?? '[]';
        $items   = json_decode($rawCart, true);
        if (is_string($items)) {
            $items = json_decode($items, true);
        }
        if (!is_array($items)) continue;

        foreach ($items as $item) {
            $name  = $item['name'] ?? 'Unknown';
            $price = (float)($item['price'] ?? 0);
            $qty   = (int)($item['quantity'] ?? 1);
            $categoryRevenue[$name] = ($categoryRevenue[$name] ?? 0) + ($price * $qty);
        }
    }

    $categoryPerformance = collect($categoryRevenue)
        ->map(fn ($rev, $name) => ['name' => $name, 'revenue' => $rev])
        ->values();

    // 5️⃣  Customer source performance  (walk-in, google, linkedin …)
    $customerSourcePerformance = DB::table('appointments')
        ->select(
            DB::raw("COALESCE(customer_source,'Unknown') as source"),
            DB::raw("COUNT(*) as count")
        )
        ->where('created_at', '>=', $start)
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy('source')
        ->orderBy('count','desc')
        ->get();

    // 6️⃣  Final response
    return response()->json([
        'totalRevenue'            => $totalRevenue,
        'totalTransactions'       => $totalTransactions,
        'avgTransaction'          => $avgTransaction,
        'dailyData'               => $daily,
        'categoryPerformance'     => $categoryPerformance,
        'customerSourcePerformance'=> $customerSourcePerformance,
    ]);
    }

    public function reportss(Request $request)
{
    $branchId  = $request->query('branch_id');

    // ✅ Accept start_date and end_date in `Y-m-d` format (e.g. 2025-09-01)
    $startDate = $request->query('start_date');
    $endDate   = $request->query('end_date');

    // Fallback to “last 30 days” if no dates provided
    if ($startDate && $endDate) {
        $start = Carbon::parse($startDate)->startOfDay();
        $end   = Carbon::parse($endDate)->endOfDay();
    } else {
        $days  = (int) $request->query('days', 30);
        $start = now()->subDays($days);
        $end   = now();
    }

    // 1️⃣ Filter appointments
    $query = DB::table('appointments')
        ->whereBetween('created_at', [$start, $end]);

    if ($branchId) {
        $query->where('branch_id', $branchId);
    }

    $transactions = $query->get();

    // 2️⃣ Totals
    $totalRevenue      = $transactions->sum('grand_total');
    $totalTransactions = $transactions->count();
    $avgTransaction    = $totalTransactions > 0
        ? $totalRevenue / $totalTransactions
        : 0;

    // 3️⃣ Daily revenue trend
    $daily = DB::table('appointments')
        ->select(
            DB::raw('DATE(created_at) as date'),
            DB::raw('SUM(final_total) as revenue'),
            DB::raw('COUNT(*) as transactions')
        )
        ->whereBetween('created_at', [$start, $end])
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy(DB::raw('DATE(created_at)'))
        ->orderBy('date')
        ->get();

    // 4️⃣ Category (Service) performance
    $categoryRevenue = [];
    foreach ($transactions as $t) {
        $rawCart = $t->cart ?? '[]';
        $items   = json_decode($rawCart, true);
        if (is_string($items)) {
            $items = json_decode($items, true);
        }
        if (!is_array($items)) continue;

        foreach ($items as $item) {
            $name  = $item['name'] ?? 'Unknown';
            $price = (float)($item['price'] ?? 0);
            $qty   = (int)($item['quantity'] ?? 1);
            $categoryRevenue[$name] = ($categoryRevenue[$name] ?? 0) + ($price * $qty);
        }
    }

    $categoryPerformance = collect($categoryRevenue)
        ->map(fn ($rev, $name) => ['name' => $name, 'revenue' => $rev])
        ->values();

    // 5️⃣ Customer source performance
    $customerSourcePerformance = DB::table('appointments')
        ->select(
            DB::raw("COALESCE(customer_source,'Unknown') as source"),
            DB::raw("COUNT(*) as count")
        )
        ->whereBetween('created_at', [$start, $end])
        ->when($branchId, fn($q) => $q->where('branch_id', $branchId))
        ->groupBy('source')
        ->orderBy('count','desc')
        ->get();

    // 6️⃣ Response
    return response()->json([
        'totalRevenue'             => $totalRevenue,
        'totalTransactions'        => $totalTransactions,
        'avgTransaction'           => $avgTransaction,
        'dailyData'                => $daily,
        'categoryPerformance'      => $categoryPerformance,
        'customerSourcePerformance'=> $customerSourcePerformance,
    ]);
}


    public function branches()
{
    return response()->json(Branch::select('id','name')->get());
}


public function stats(Request $request)
{
  

     $now   = Carbon::now();
    $today = Carbon::today();

    // 🔹 ?branch_id=all or a specific id
    $branchId = $request->query('branch_id');

    // 🔹 Only therapists, eager-load branch to get name
    $staffQuery = User::where('role', 'therapist')->with('branch');

    if ($branchId && $branchId !== 'all') {
        $staffQuery->where('branch_id', $branchId);
    }

    $staffs = $staffQuery->get()->map(function ($s) use ($now, $today) {

        $appointments = $s->appointments()
            ->whereDate('start_time', $today)
            ->orderBy('start_time')
            ->get();

        $status     = 'free';
        $nextFreeIn = null;

        foreach ($appointments as $appt) {
            $start = Carbon::parse($appt->start_time);
            $end   = Carbon::parse($appt->end_time);

            if ($now->between($start, $end)) {
                $status     = 'busy';
                $nextFreeIn = $now->diffInMinutes($end, false);
                break;
            }

            if ($start->greaterThan($now) && $nextFreeIn === null) {
                $nextFreeIn = $now->diffInMinutes($start, false);
            }
        }

        return [
            'id'                 => $s->id,
            'name'               => $s->name,
            'branch_id'          => $s->branch_id,
            'branch_name'        => optional($s->branch)->name,   // ✅ add branch name
            'status'             => $status,
            'next_free_in'       => $nextFreeIn,
            'appointments_today' => $appointments->count(),
            'revenue_today'      => $appointments->sum('grand_total'),
        ];
    });

    return response()->json($staffs);
}

public function full(Request $request)
{
    $branchId = $request->query('branch_id'); // optional filter

    // $query = appointment::with('membership')->query();
     $query = appointment::with(['membership:id,name','branch:id,name']);

    if ($branchId && $branchId !== 'all') {
        $query->where('branch_id', $branchId);
    }

    $appointments = $query
        ->orderBy('created_at', 'desc')
        ->get()
        ->map(function ($a) {
            return [
                'id'               => $a->id,
                'appdate'    => $a->appdate,
                'customer_name'    => $a->customer_name,
                'customer_phone'   => $a->customer_phone,
                'staff_id'         => $a->staff_id,
                'staff_name'       => $a->staff_name,
                'service_id'       => $a->service_id,
                'payment_method'   => $a->payment_method,
                'transaction_num'  => $a->transaction_number,
                // decode cart JSON to array
                'cart'             => json_decode($a->cart, true),
                'item_total'       => $a->item_total,
                'bill_discount'    => $a->bill_discount,
                'grand_total'      => $a->grand_total,
                'start_time'       => $a->start_time,
                'StartTime'       => $a->StartTime,
                'total_duration'   => $a->total_duration,
                
                'end_time'         => $a->end_time,
                'EndTime'         => $a->EndTime,
                'branch_name'         => $a->branch ? $a->branch->name : null, 

                'start_time_formatted' => $a->start_time_formatted,
                'end_time_formatted'   => $a->end_time_formatted,

                'branch_id'        => $a->branch_id,
                'customer_source'  => $a->customer_source,

                 'billed_staff_id'    => $a->billed_staff_id,
                'billed_staff_name'  => $a->billed_staff_name,
                'membership_id'      => $a->membership_id,
                'total_service'      => $a->total_service,
                'membership_discount'=> $a->membership_discount,
                'free_services_used' => $a->free_services_used,
                'gst_percent'        => $a->gst_percent,
                'gst_amount'         => $a->gst_amount,
                'final_total'        => $a->final_total,

                 'membership'         => $a->membership,
                 'voacher'         => $a->voucherCode,


                'created_at_formatted' => $a->created_at_formatted,

                'created_at'         => $a->created_at,
                'updated_at'         => $a->updated_at,


               
            ];
        });

    return response()->json($appointments);
}

public function memberTransactions(Request $request)
    {
        // Validate phone

    $validator = Validator::make($request->all(), [
        'phone' => 'required|digits:10',
    ]);

    if ($validator->fails()) {
        return response()->json([
            'status'  => false,
            'message' => $validator->errors()->first(),
        ], 422);
    }

    $phone = $request->phone;

    // 1️⃣ Fetch memberships
    $memberships = membershippurchase::where('customer_phone', $phone)
        ->orderBy('created_at', 'desc')
        ->get();

    if ($memberships->isEmpty()) {
        return response()->json([
            'status' => true,
            'customer_phone' => $phone,
            'memberships' => [],
            'appointments' => [],
            'message' => 'No memberships found'
        ]);
    }

    // 2️⃣ Collect membership IDs
    $membershipIds = $memberships->pluck('id');

    // 3️⃣ Fetch appointments grouped by membership_id
    $usedCounts = appointment::whereIn('membership_id', $membershipIds)
        ->select('membership_id', DB::raw('SUM(total_service) as used_services'))
        ->groupBy('membership_id')
        ->pluck('used_services','membership_id');

    // 4️⃣ Attach remaining count to each membership
    $memberships = $memberships->map(function ($m) use ($usedCounts) {
        $used = $usedCounts[$m->id] ?? 0;
        $m->used_services = (int)$used;
        $m->remaining_services = max(0, $m->service_count - $used);
        return $m;
    });

    // 5️⃣ Fetch detailed appointments
    $appointments = appointment::whereIn('membership_id', $membershipIds)
        ->orderBy('created_at','desc')
        ->get();

    return response()->json([
        'status'        => true,
        'customer_phone'=> $phone,
        'memberships'   => $memberships,
        // 'appointments'  => $appointments,
    ]);
    }


    public function checkvoacher(Request $request){
            $validator = Validator::make($request->all(), [
                    'voucherCode' => 'required',
                ]);

                if ($validator->fails()) {
                    return response()->json([
                        'status'  => false,
                        'message' => $validator->errors()->first(),
                    ], 200);
                }

                  $voucherCode = $request->voucherCode;

                    // 1. Check if voucher already used
                    $alreadyUsed = appointment::where('voucherCode', $voucherCode)->exists();
                    if ($alreadyUsed) {
                        return response()->json([
                            'status'  => false,
                            'message' => 'This voucher code has already been used.',
                        ], 200);
                    }
                    else{
                          return response()->json([
                            'status'  => true,
                            'message' => 'Applied.',
                        ], 200);
                    }


    }

  public function memberTransactionsAll(Request $request)
{
    // ✅ Phone is optional now
    $phone = $request->phone;

    // If a phone is provided, validate it
    if ($phone) {
        $validator = Validator::make($request->all(), [
            'phone' => 'digits:10',
        ]);

        if ($validator->fails()) {
            return response()->json([
                'status'  => false,
                'message' => $validator->errors()->first(),
            ], 422);
        }
    }

    // 1️⃣ Fetch memberships
    $query = membershippurchase::orderBy('created_at', 'desc');

    if ($phone) {
        $query->where('customer_phone', $phone);
    }

    $memberships = $query->get();

    if ($memberships->isEmpty()) {
        return response()->json([
            'status'         => true,
            'customer_phone' => $phone,
            'memberships'    => [],
            'message'        => $phone
                ? 'No memberships found for this phone'
                : 'No memberships found',
        ]);
    }

    // 2️⃣ Collect membership IDs
    $membershipIds = $memberships->pluck('id');

    // 3️⃣ Fetch appointments usage counts
    $usedCounts = appointment::whereIn('membership_id', $membershipIds)
        ->select('membership_id', DB::raw('SUM(total_service) as used_services'))
        ->groupBy('membership_id')
        ->pluck('used_services', 'membership_id');

    // 4️⃣ Add used/remaining to each membership
    $memberships = $memberships->map(function ($m) use ($usedCounts) {
        $used = $usedCounts[$m->id] ?? 0;
        $m->used_services = (int) $used;
        $m->remaining_services = max(0, $m->service_count - $used);
        return $m;
    });

    // Optional: if you need all appointments, you can uncomment
    // $appointments = Appointment::whereIn('membership_id', $membershipIds)
    //     ->orderBy('created_at', 'desc')
    //     ->get();

    return response()->json([
        'status'         => true,
        'customer_phone' => $phone,
        'memberships'    => $memberships,
        // 'appointments' => $appointments,
    ]);
}

      public function byMembership(Request $request)
    {
        $membershipId = $request->query('membership_id');

        if (!$membershipId) {
            return response()->json([
                'status' => false,
                'message' => 'membership_id is required',
            ], 400);
        }

        // Fetch all appointments where membership_id matches
        $transactions = appointment::where('membership_id', $membershipId)
            ->orderBy('created_at', 'desc')
            ->get([
                'id',
                'customer_name',
                'staff_name',
                'service_id',
                'cart',
                'start_time',
                'end_time',
                'item_total',
                'bill_discount',
                'grand_total',
                'final_total',
                'gst_percent',
                'gst_amount',
                'created_at'
            ]);

        // If you need service names from cart JSON:
        $transactions->transform(function ($t) {
            $items = json_decode($t->cart, true);
            $t->service_name = collect($items)->pluck('name')->implode(', ');
            return $t;
        });

        return response()->json([
            'status'       => true,
            'membership_id'=> $membershipId,
            'transactions' => $transactions
        ]);
    }


}
