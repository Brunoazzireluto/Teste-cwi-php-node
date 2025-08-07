<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;
use App\Models\User;

class UserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
            User::create([
        'name' => 'luffy',
        'email' => 'luffy@email.com',
        'password' => Hash::make('L123'),
        ]);

        User::create([
            'name' => 'zoro',
            'email' => 'zoro@email.com',
            'password' => Hash::make('Z123'),
        ]);
    }
}
