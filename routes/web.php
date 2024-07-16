<?php

use App\Models\Movie;
use Illuminate\Support\Facades\Route;

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

Route::get('/', function () {
    return view('welcome');
});

Route::middleware([
    'auth:sanctum',
    config('jetstream.auth_session'),
    'verified',
])->group(function () {
    Route::get('/dashboard', function () {
        return view('dashboard');
    })->name('dashboard');
});

// Routes for Movie
Route::resource('movies', App\Http\Controllers\MovieController::class);

// Routes for Genre
Route::resource('genres', App\Http\Controllers\GenreController::class);

// Routes for ProductionCompany
Route::resource('production-companies', App\Http\Controllers\ProductionCompanyController::class);

// Routes for ProductionCountry
Route::resource('production-countries', App\Http\Controllers\ProductionCountryController::class);

// Routes for SpokenLanguage
Route::resource('spoken-languages', App\Http\Controllers\SpokenLanguageController::class);


Route::get('test', function () {
    $service = app()->make(App\Services\TMDbApiService::class);
    $syncService = app()->make(App\Services\TMDbSyncService::class);
//    $genres = $service->getTrendingMovies();
    $genres = Movie::all();

    foreach ($genres as $genre) {
        $syncService->updateMovieDetails($genre);
    }

    dd($syncService->formatMovieDetails($service->getMovieDetails(974262))[ "id" ]);
});
