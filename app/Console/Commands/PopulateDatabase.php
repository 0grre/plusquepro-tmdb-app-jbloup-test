<?php

namespace App\Console\Commands;

use App\Models\Movie;
use App\Services\TMDbSyncService;
use Illuminate\Console\Command;

class PopulateDatabase extends Command
{
    protected $signature = 'database:populate {timeWindow=day}';
    protected $description = 'Populate the database with genres and trending movies from TMDb';

    protected TMDbSyncService $syncService;

    /**
     * Create a new command instance.
     *
     * @param TMDbSyncService $syncService
     */
    public function __construct(TMDbSyncService $syncService)
    {
        parent::__construct();
        $this->syncService = $syncService;
    }

    /**
     * Execute the console command.
     *
     * @return void
     */
    public function handle(): void
    {
        $this->info('Fetching genres...');
        try {
            $this->syncService->populateGenres();
            $this->info('Genres fetched and stored.');
        } catch (\Exception $e) {
            $this->error("Failed to fetch genres: {$e->getMessage()}");
            return;
        }

        $timeWindow = $this->argument('timeWindow');
        if (!$timeWindow) {
            $timeWindows = ['day', 'week'];
        } else {
            $timeWindows = [$timeWindow];
        }

        foreach ($timeWindows as $timeWindow) {
            $this->info("Fetching trending movies for {$timeWindow}...");
            try {
                $this->syncService->populateTrendingMovies($timeWindow);
                $this->info('Trending movies fetched and stored.');
            } catch (\Exception $e) {
                $this->error("Failed to fetch trending movies for {$timeWindow}: {$e->getMessage()}");
            }
        }

        $this->info('Updating movie details...');
        $movies = Movie::all();
        foreach ($movies as $movie) {
            try {
                $this->syncService->updateMovieDetails($movie);
                $this->info("Updated details for movie: {$movie->title}");
            } catch (\Exception $e) {
                $this->error("Failed to update movie details for movie ID {$movie->id}: {$e->getMessage()}");
            }
        }
        $this->info('Movie details updated.');
    }
}
