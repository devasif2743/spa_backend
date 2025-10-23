<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Message;
use App\Events\MessageSent;
use Auth;
class ChatController extends Controller
{
    
public function fetchMessages(Request $request)
{
   
          $request->validate([
            'user_id' => 'required|exists:users,id',
        ]);

        $authId = Auth::id();

        $messages = Message::where(function ($q) use ($authId, $request) {
            $q->where('sender_id', $authId)
              ->where('receiver_id', $request->user_id);
        })->orWhere(function ($q) use ($authId, $request) {
            $q->where('sender_id', $request->user_id)
              ->where('receiver_id', $authId);
        })->orderBy('created_at', 'asc')->get();

        return response()->json($messages); 





}

public function sendMessage(Request $request)
{


         $request->validate([
            'receiver_id' => 'required|exists:users,id',
            'message' => 'required|string|max:1000',
        ]);

        $message = Message::create([
            'sender_id' => Auth::id(),
            'receiver_id' => $request->receiver_id,
            'message' => $request->message
        ]);

        broadcast(new MessageSent($message))->toOthers();

        return response()->json([
            'status' => 'Message Sent',
            'message' => $message
        ]);





}
}
