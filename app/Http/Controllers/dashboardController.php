<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\customer;
use App\Models\project;
use App\Models\invoice;
use App\Models\calender;
use App\Models\activitie;

use App\Models\order;
use App\Models\product;
use App\Models\game;
use App\Models\category;


class dashboardController extends Controller
{
    
    public function index()
    {
        $productsCount = product::count();
        $gamesCount = game::count();
        $orders = order::latest()->take(5)->get();
        $totalOrders = order::count();
        $completedOrders = order::where('status', 'completed')->get();
        $totalRevenue = $completedOrders->sum('total');
        $categoriesCount = category::count();

        return response()->json([
            'status' => true,
            'data' => [
                'productsCount' => $productsCount,
                'gamesCount' => $gamesCount,
                'ordersCount' => $totalOrders,
                'categoriesCount' => $categoriesCount,
                'totalRevenue' => $totalRevenue,
                'recentOrders' => $orders,
            ]
        ]);
    }





}
