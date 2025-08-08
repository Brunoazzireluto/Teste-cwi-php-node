<?php

use App\Http\Controllers\UserController;
use App\Http\Controllers\HealthController;
use App\Http\Controllers\SubscriptionController;
use Illuminate\Support\Facades\Route;

// Rota de health check
Route::get('/health', [HealthController::class, 'check']);

// Rotas de usuários
Route::get('/users', [UserController::class, 'index']);
Route::post('/users', [UserController::class, 'store']);
Route::get('/users/{id}', [UserController::class, 'show']);
Route::put('/users/{id}', [UserController::class, 'update']);
Route::delete('/users/{id}', [UserController::class, 'destroy']);

// Rota de Subscription
Route::get('/external/', [SubscriptionController::class, 'fetchSubscription']);