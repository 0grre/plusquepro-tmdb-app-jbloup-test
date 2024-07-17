<?php

use App\Http\Controllers\MovieController;
use Illuminate\Support\Facades\Route;
use App\Livewire\Movies;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/

// ---------------- Guest ---------------- //
Route::get('/', function () {
    return view('welcome');
});

// ---------------- Authenticated ---------------- //
Route::middleware(['auth:sanctum', config('jetstream.auth_session'), 'verified',])->group(function () {

    // ---------------- Movies ---------------- //
    Route::get('/dashboard', [MovieController::class, 'index'])->name('dashboard');
    Route::get('/movies/{movie}', [MovieController::class, 'show'])->name('movies.show');
    Route::get('/movies/{movie}/edit', [MovieController::class, 'edit'])->name('movies.edit');
    Route::put('/movies/{movie}', [MovieController::class, 'update'])->name('movies.update');
    Route::delete('/movies/{movie}', [MovieController::class, 'destroy'])->name('movies.destroy');

    Route::get('/movies/trending/refresh', [MovieController::class, 'refresh'])->name('movies.refresh');

    // ---------------- Livewire ---------------- //
    Route::get('/components/movies', Movies::class)->name('components.movies.index');
});

