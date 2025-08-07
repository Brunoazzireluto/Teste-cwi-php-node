<?php

namespace App\Http\Controllers;

use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class UserController extends Controller
{
    public function index() {
        return User::all();
    }

    public function store(Request $request) {
        return User::create([
            'name' => $request->name,
            'email' => $request->email,
            'password' => Hash::make($request->password),
        ]);
    }

    public function show($id) {
        return User::findOrFail($id);
    }

    public function update(Request $request, $id) {
        $user = User::findOrFail($id);
        $user->update($request->only('name', 'email', 'password'));
        return $user;
    }

    public function destroy($id) {
        $user = User::findOrFail($id);
        $user->delete();
        return response()->json(['message' => 'Deleted']);
    }
}
