<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\CustomApiAuthController;
use App\Http\Controllers\BranchController;
use App\Http\Controllers\brandController;
use App\Http\Controllers\ComboController;
use App\Http\Controllers\ProductController;
use App\Http\Controllers\NotificationController;
use App\Http\Controllers\CategoryController;
use App\Http\Controllers\orderController;
use App\Http\Controllers\gameController;
use App\Http\Controllers\ProfileController;
use App\Http\Controllers\CustomerController;
use App\Http\Controllers\ProjectController;
use App\Http\Controllers\staffController;
use App\Http\Controllers\membershippurchaseController;
use App\Http\Controllers\CalenderController;
use App\Http\Controllers\InvoiceController;
use App\Http\Controllers\paymentController;
use App\Http\Controllers\expensesController;
use App\Http\Controllers\dashboardController;
use App\Http\Controllers\AnalyticsController;
use App\Http\Controllers\ChatController;
use App\Http\Controllers\MembershipController;
use App\Http\Controllers\AppointmentController;
use Illuminate\Support\Facades\Broadcast;


/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/


Broadcast::routes(['middleware' => ['auth:api']]);

Route::get('/send-notification', [NotificationController::class, 'send']);

Route::get('/staff-stats', [AppointmentController::class, 'stats']);
Route::get('/appointments-full', [AppointmentController::class, 'full']);






Route::group(['middleware' => 'api'], function ($routes) {



  // login with Mgs91 
  Route::post('/login-otp', [CustomApiAuthController::class, 'loginOtp']);
  Route::post('/verify-login-otp', [CustomApiAuthController::class, 'verifyOtpLoginOTP']);

  // web Api
  Route::post('/web-login', [CustomApiAuthController::class, 'web_login']);
  Route::post('/web-verify-login-otp', [CustomApiAuthController::class, 'webverifyOtpLoginOTP']);


  // for both Web and Api only Email
  Route::post('/reset_password', [CustomApiAuthController::class, 'reset_password_link']);
  Route::post('/verify_otp', [CustomApiAuthController::class, 'verify_otp_update_password']);
});
Route::get('/download-document/{id}',      [ProjectController::class, 'download_documents']);

// Route::group(['middleware'=>['jwt.verify', 'checkPos']],function($routes){
Route::group(['middleware' => ['jwt.verify'],  'prefix' => 'admin'], function ($routes) {

  Route::post('add-brand', [brandController::class, 'store']);
  Route::get('list-brand/{id?}', [brandController::class, 'list']);
  Route::post('update-brand/{id}', [brandController::class, 'update']);
  Route::delete('delete-brand/{id}', [brandController::class, 'destroy']);


  Route::post('add-category', [CategoryController::class, 'store']);
  Route::get('list-category/{id?}', [CategoryController::class, 'list']);
  Route::match(['put', 'patch', 'post'], 'update-category/{id}', [CategoryController::class, 'update']);
  Route::delete('delete-category/{id}', [CategoryController::class, 'delete']);

  // Staff
  Route::post('add-staff', [staffController::class, 'addStaff']);
  Route::post('add-staff-branch', [staffController::class, 'addStaffbranch']);
  Route::get('list-staff/{id?}', [staffController::class, 'list']);
  Route::post('update-staff/{id}', [staffController::class, 'update']);
  Route::delete('delete-staff/{id}', [staffController::class, 'delete']);

  // membership   
  Route::post('add-membership', [MembershipController::class, 'addMembership']);
  Route::get('list-membership/{id?}', [MembershipController::class, 'list']);
  Route::post('update-membership/{id}', [MembershipController::class, 'update']);
  Route::delete('delete-membership/{id}', [MembershipController::class, 'delete']);


  // purchase membership
  Route::post('purchase-membership', [membershippurchaseController::class, 'store']);
  Route::get('/membership/check', [membershippurchaseController::class, 'checkBalance']);
  Route::post('/check-voucher', [AppointmentController::class, 'checkvoacher']);

  Route::get('/member-transactions', [AppointmentController::class, 'memberTransactions']);
  Route::get('/member-transactions-all', [AppointmentController::class, 'memberTransactionsAll']);
  Route::get('/member-transactions-details', [AppointmentController::class, 'byMembership']);
  // add billing
  Route::post('add-billing', [AppointmentController::class, 'store']);
  Route::post('adv-billing', [AppointmentController::class, 'store1']);
  Route::post('today-billing', [AppointmentController::class, 'store3']);
  Route::get('staff', [AppointmentController::class, 'index']);
  Route::get('list-staff-data', [AppointmentController::class, 'listStaff']);
  Route::get('allstaff', [AppointmentController::class, 'allstaff']);
  // Route::get('advstaff', [AppointmentController::class,'advstaff']);
  Route::get('advstaff', [AppointmentController::class, 'staffAvailability']);
  Route::get('/appointments/check-phone/{phone}', [AppointmentController::class, 'checkPhone']);
  Route::get('/reports', [AppointmentController::class, 'report']);
  Route::get('/reportss', [AppointmentController::class, 'reportss']);
  Route::get('/branchess', [AppointmentController::class, 'branches']);







  Route::post('add-branch', [BranchController::class, 'store']);
  Route::get('list-branch/{id?}', [BranchController::class, 'list']);
  Route::post('update-branch/{id}', [BranchController::class, 'update']);
  Route::delete('delete-branch/{id}', [BranchController::class, 'delete']);

  Route::post('add-product', [ProjectController::class, 'store']);
  Route::get('list-product/{id?}', [ProjectController::class, 'list']);
  Route::post('update-product/{id}', [ProjectController::class, 'update']);
  Route::delete('delete-product/{id}', [ProjectController::class, 'delete']);

  Route::get('/list-combo/{id?}', [ComboController::class, 'list']);
  Route::post('/add-combo', [ComboController::class, 'store']);
  Route::post('/update-combo/{id}', [ComboController::class, 'update']);
  Route::delete('/delete-combo/{id}', [ComboController::class, 'delete']);


  //games 
  Route::post('add-game', [gameController::class, 'store']);
  Route::get('list-game/{id?}', [gameController::class, 'list']);
  Route::match(['put', 'patch'], 'update-game/{id}', [gameController::class, 'update']);
  Route::delete('delete-game/{id}', [gameController::class, 'delete']);



  // product



  // order

  Route::post('add-order', [orderController::class, 'store']);
  Route::get('list-orders/{id?}', [orderController::class, 'list']);
  Route::match(['put', 'patch'], 'update-order/{id}', [orderController::class, 'update']);


  // dashboard
  Route::get('/dashboard', [DashboardController::class, 'index']);


  // end












  Route::post('add-customer', [CustomerController::class, 'store']);
  Route::get('list-customer/{id?}', [CustomerController::class, 'list']);
  Route::put('customer-update/{id}', [CustomerController::class, 'update']);
  Route::delete('delete-customer/{id}', [CustomerController::class, 'soft_destroy']);



  // Project Module
  Route::post('add-project', [ProjectController::class, 'store']);
  Route::get('list-project/{id?}', [ProjectController::class, 'list']);
  Route::get('list-project-by-customer-id/{id}', [ProjectController::class, 'listproject']);
  Route::get('list-project/{id?}', [ProjectController::class, 'list']);
  Route::put('/projects-stage-update/{id}',      [ProjectController::class, 'update']);
  Route::post('/project-update',      [ProjectController::class, 'projectupdate']);
  Route::post('/project-status-update',      [ProjectController::class, 'projectStageupdate']);
  Route::post('/project-document',      [ProjectController::class, 'add_documents']);
  Route::delete('project-document-delete/{id}',      [ProjectController::class, 'delete_documents']);
  // Route::get('/download-document/{filename}',      [ProjectController::class, 'download_documents']);

  //staff module
  Route::get('list-staff/{id?}', [staffController::class, 'list']);
  Route::get('list-staff-only-branch/{id?}', [staffController::class, 'list_staff_only_branch']);
  Route::post('create-staff', [staffController::class, 'store']);
  Route::get('all-staff/{id?}', [staffController::class, 'staff_list']);
  // Route::post('update-staff',[staffController::class,'updateStaff']);
  // Route::delete('delete-staff/{id}',[staffController::class,'deleteStaff']);


  // calender
  Route::post('create-task', [CalenderController::class, 'create_task']);
  Route::post('create-meeting', [CalenderController::class, 'create_meeting']);
  Route::get('list-all-calender/{id?}', [CalenderController::class, 'list']);



  // invoice 
  Route::post('create-invoice', [InvoiceController::class, 'store']);
  Route::get('list-invoice/{id?}', [InvoiceController::class, 'listInvoice1']);
  Route::get('list-invoices/{id}', [InvoiceController::class, 'listInvoice']);
  Route::put('/invoices-update/{id}', [InvoiceController::class, 'update']);

  // invoice payment
  Route::post('create-payment', [paymentController::class, 'create']);

  // expanses
  Route::post('create-expanses', [expensesController::class, 'store']);
  Route::post('update-expanses/{id}', [expensesController::class, 'update']);
  Route::delete('delete-expanses/{id}', [expensesController::class, 'delete']);
  Route::get('list-expanses/{id?}', [expensesController::class, 'list']);
  Route::get('/analytics', [expensesController::class, 'getAnalytics']);

  // dashboard 
  Route::get('/getOverview', [dashboardController::class, 'getOverview']);


  //  chat controller
  Route::get('/messages', [ChatController::class, 'fetchMessages']);
  Route::post('/messages', [ChatController::class, 'sendMessage']);




  //below no need

  // Route::put('/projects-domain-update/{id}',      [ProjectController::class, 'updateDomain']);

  // Route::put('/projects-hosting-update/{id}',      [ProjectController::class, 'updateHosting']);
  // Route::put('/projects-design-update/{id}',      [ProjectController::class, 'updateDesign']);
  // Route::put('/projects-live-update/{id}',      [ProjectController::class, 'updateMadeLive']);
  // Route::put('/projects-balance-update/{id}',      [ProjectController::class, 'updateBalanceAsked']);



  // Route::get('get-profile',[ProfileController::class,'index']);


});

// Route::group(['middleware'=>['jwt.verify', 'checkManager']],function($routes){
Route::group(['middleware' => ['jwt.verify', 'checkManager'],  'prefix' => 'manager'], function ($routes) {});

Route::get('list-expanses-open/{id?}', [expensesController::class, 'list']);

Route::get('/analytics22', [expensesController::class, 'getAnalytics']);
Route::get('/getOverview1', [dashboardController::class, 'getOverview']);

Route::get('/analytics', [AnalyticsController::class, 'get_analytics']);
