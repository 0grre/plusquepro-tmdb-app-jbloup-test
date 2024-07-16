<?php

namespace Database\Seeders;

use App\Models\User;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\Hash;

class AdminUserSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $adminEmail = env('BO_USER');
        $adminPassword = env('BO_PASSWORD');

        User::updateOrCreate(
            ['email' => $adminEmail],
            [
                'name' => 'Admin',
                'email' => $adminEmail,
                'password' => Hash::make($adminPassword),
            ]
        );
    }
}
