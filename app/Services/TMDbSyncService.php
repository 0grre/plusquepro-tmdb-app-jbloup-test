<?php

namespace App\Services;

use App\Models\Genre;
use App\Models\Movie;
use App\Models\ProductionCompany;
use App\Models\SpokenLanguage;
use Illuminate\Support\Facades\Log;

class TMDbSyncService
{
    protected TMDbApiService $apiService;

    /**
     * Create a new service instance.
     *
     * @param TMDbApiService $apiService
     */
    public function __construct(TMDbApiService $apiService)
    {
        $this->apiService = $apiService;
    }

    /**
     * Populate the database with genres.
     *
     * @return void
     */
    public function populateGenres(): void
    {
        $genres = $this->apiService->getGenres();

        foreach ($genres as $genreData) {
            Genre::updateOrCreate(
                ['id' => $genreData['id']],
                ['name' => $genreData['name']]
            );
        }
    }

    /**
     * Populate the database with trending movies.
     *
     * @param string $timeWindow
     * @return void
     */
    public function populateTrendingMovies(string $timeWindow = 'day'): void
    {
        $trendingMovies = $this->apiService->getTrendingMovies($timeWindow);

        foreach ($trendingMovies as $movieData) {
            Movie::updateOrCreate(
                ['id' => $movieData['id']],
                $this->formatTrendingMovie($movieData)
            );
        }
    }

    /**
     * Update movie details.
     *
     * @param Movie $movie
     * @return void
     */
    public function updateMovieDetails(Movie $movie): void
    {
        $movieDetails = $this->apiService->getMovieDetails($movie->id);

        if (isset($movieDetails['success']) && $movieDetails['success'] === false) {
            Log::warning("Failed to update movie details for movie ID {$movie->id}: {$movieDetails['status_message']}");
            return;
        }

        $movie->update($this->formatMovieDetails($movieDetails));
        $this->syncMovieRelations($movie, $movieDetails);
    }

    /**
     * Sync movie relations.
     *
     * @param Movie $movie
     * @param array $movieData
     * @return void
     */
    private function syncMovieRelations(Movie $movie, array $movieData): void
    {
        if (isset($movieData['genres'])) {
            $genres = collect($movieData['genres'])->filter(function ($genreData) {
                return !empty($genreData['id']) && !empty($genreData['name']);
            })->map(function ($genreData) {
                return Genre::firstOrCreate(['id' => $genreData['id']], ['name' => $genreData['name']]);
            });
            $movie->genres()->sync($genres->pluck('id'));
        }

        if (isset($movieData['production_companies'])) {
            $productionCompanies = collect($movieData['production_companies'])->filter(function ($companyData) {
                return !empty($companyData['name']);
            })->map(function ($companyData) {
                return ProductionCompany::firstOrCreate(
                    ['name' => $companyData['name']],
                    ['logo_path' => $companyData['logo_path'], 'origin_country' => $companyData['origin_country']]
                );
            });
            $movie->productionCompanies()->sync($productionCompanies->pluck('id'));
        }

        if (isset($movieData['spoken_languages'])) {
            $spokenLanguages = collect($movieData['spoken_languages'])->filter(function ($languageData) {
                return !empty($languageData['iso_639_1']) && !empty($languageData['english_name']);
            })->map(function ($languageData) {
                return SpokenLanguage::firstOrCreate(
                    ['iso_639_1' => $languageData['iso_639_1']],
                    ['english_name' => $languageData['english_name']]
                );
            });
            $movie->spokenLanguages()->sync($spokenLanguages->pluck('id'));
        }
    }

    /**
     * Format movie data.
     *
     * @param array $movie
     * @return array
     */
    private function formatTrendingMovie(array $movie): array
    {
        return [
            'id' => $movie['id'],
            'title' => $movie['title'],
            'original_title' => $movie['original_title'],
            'overview' => $movie['overview'],
            'poster_path' => $movie['poster_path'],
            'backdrop_path' => $movie['backdrop_path'] ?? null,
            'release_date' => $movie['release_date'],
            'vote_average' => $movie['vote_average'],
            'vote_count' => $movie['vote_count'],
            'popularity' => $movie['popularity'],
            'media_type' => $movie['media_type'] ?? null,
            'adult' => $movie['adult'] ?? false,
            'original_language' => $movie['original_language'] ?? null,
            'video' => $movie['video'] ?? false,
        ];
    }

    /**
     * Format movie details.
     *
     * @param array $movie
     * @return array
     */
    private function formatMovieDetails(array $movie): array
    {
        return [
            'id' => $movie['id'],
            'title' => $movie['title'],
            'original_title' => $movie['original_title'],
            'overview' => $movie['overview'],
            'poster_path' => $movie['poster_path'],
            'backdrop_path' => $movie['backdrop_path'] ?? null,
            'release_date' => $movie['release_date'],
            'vote_average' => $movie['vote_average'],
            'vote_count' => $movie['vote_count'],
            'popularity' => $movie['popularity'],
            'homepage' => $movie['homepage'] ?? null,
            'imdb_id' => $movie['imdb_id'] ?? null,
            'runtime' => $movie['runtime'] ?? null,
            'status' => $movie['status'] ?? null,
            'tagline' => $movie['tagline'] ?? null,
            'media_type' => $movie['media_type'] ?? null,
            'adult' => $movie['adult'] ?? false,
            'original_language' => $movie['original_language'] ?? null,
            'video' => $movie['video'] ?? false,
            'budget' => $movie['budget'] ?? null,
            'revenue' => $movie['revenue'] ?? null,
        ];
    }
}
