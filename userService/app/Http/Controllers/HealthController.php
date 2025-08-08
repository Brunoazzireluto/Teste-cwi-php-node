<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class HealthController extends Controller
{
    public function check()
    {
        $health = [
            'status' => 'OK',
            'timestamp' => now()->toISOString(),
            'service' => 'user-service',
        ];

        // Verificar conexão com banco de dados
        try {
            DB::connection()->getPdo();
            $health['database'] = 'connected';
        } catch (\Exception $e) {
            $health['database'] = 'disconnected';
            $health['status'] = 'ERROR';
            $health['error'] = $e->getMessage();
        }

        $statusCode = $health['status'] === 'OK' ? 200 : 503;

        return response()->json($health, $statusCode);
    }
}