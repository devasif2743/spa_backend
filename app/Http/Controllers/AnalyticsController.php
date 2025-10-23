<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\payment;
use Illuminate\Support\Facades\DB;
use Carbon\Carbon;
use Carbon\CarbonPeriod;
class AnalyticsController extends Controller
{
    //

    public function get_analytics(Request $request){

        
         $range = $request->query('range', 'current'); // 'current', '6months', 'yearly', or 'custom'

    // Set the date range
    if ($range === '6months') {
        $from = Carbon::now()->subMonths(5)->startOfMonth();
        $to = Carbon::now()->endOfMonth();
    } elseif ($range === 'yearly') {
        $from = Carbon::now()->startOfYear();
        $to = Carbon::now()->endOfYear();
    } elseif ($range === 'custom') {
        $from = Carbon::parse($request->query('from'));
        $to = Carbon::parse($request->query('to'));
    } else {
        $from = Carbon::now()->startOfMonth();
        $to = Carbon::now()->endOfMonth();
    }

    // Grouped Payments
    $payments = DB::table('payments')
        ->select(DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"), DB::raw("SUM(amount) as total"))
        ->whereBetween('created_at', [$from, $to])
        ->groupBy('month')
        ->pluck('total', 'month');

    // Grouped Invoices
    $invoices = DB::table('invoices')
        ->select(DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"), DB::raw("SUM(totalAmount) as total"))
        ->whereBetween('created_at', [$from, $to])
        ->groupBy('month')
        ->pluck('total', 'month');

    // Grouped Expenses
    $expenses = DB::table('expenses')
        ->select(DB::raw("DATE_FORMAT(created_at, '%Y-%m') as month"), DB::raw("SUM(amount) as total"))
        ->whereBetween('created_at', [$from, $to])
        ->where('status', 'paid')
        ->groupBy('month')
        ->pluck('total', 'month');

    // Generate monthly list
    $period = CarbonPeriod::create($from, '1 month', $to);
    $data = [];

    // foreach ($period as $date) {
    //     $key = $date->format('Y-m');
    //     $data[] = [
    //         'month' => $date->format('F Y'),
    //         'payments' => (float) ($payments[$key] ?? 0),
    //         'invoices' => (float) ($invoices[$key] ?? 0),
    //         'expenses' => (float) ($expenses[$key] ?? 0),
            
    //     ];
    // }


    foreach ($period as $date) {
    $key = $date->format('Y-m');
    $invoiceTotal = (float) ($invoices[$key] ?? 0);
    $expenseTotal = (float) ($expenses[$key] ?? 0);
    $paymentTotal = (float) ($payments[$key] ?? 0);

    $data[] = [
        'month' => $date->format('F Y'),
        'payments' => $paymentTotal,
        'invoices' => $invoiceTotal,
        'expenses' => $expenseTotal,
        'profit_or_loss' => $invoiceTotal - $expenseTotal // ✅ Net profit or loss
    ];
}

 $totalBalance = \App\Models\invoice::sum('balance');
    return response()->json([
        'status' => true,
        'data' => $data,
        'balance' => $totalBalance,
    ]);


   
}





}
