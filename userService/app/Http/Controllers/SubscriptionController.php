<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Http;

class SubscriptionController extends Controller
{
    public function fetchSubscription(Request $request)
    {
        $token = config('services.subscription_api.token');
        $baseUrl = config('services.subscription_api.url');
        $email = $request->query('email');

        if (!$email) {
            return response()->json(['error' => 'Email is required'], 400);
        }

        $url = $baseUrl . urlencode($email);

        $response = Http::withToken($token)->get($url);

        if ($response->successful()) {
            return response()->json($response->json());
        }

        return response()->json([
            'error' => 'Error to fetch subscription',
            'status' => $response->status(),
            'body' => $response->body(),
        ], $response->status());
    }
}
