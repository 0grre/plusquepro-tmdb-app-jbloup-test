<?php

namespace App\Providers;

use App\Services\TMDbApiService;
use App\Services\TMDbSyncService;
use Illuminate\Support\ServiceProvider;

class AppServiceProvider extends ServiceProvider
{
    /**
     * Register any application services.
     */
    public function register(): void
    {
        $this->app->singleton(TMDbApiService::class, function ($app) {
            return new TMDbApiService();
        });

        $this->app->singleton(TMDbSyncService::class, function ($app) {
            return new TMDbSyncService($app->make(TMDbApiService::class));
        });
    }

    /**
     * Bootstrap any application services.
     */
    public function boot(): void
    {
        //
    }
}
