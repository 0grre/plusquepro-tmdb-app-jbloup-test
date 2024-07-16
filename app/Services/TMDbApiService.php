<?php

namespace App\Services;

use Illuminate\Support\Facades\Http;

class TMDbApiService
{
    protected string $apiKey;
    protected string $baseUrl;

    /**
     * TMDbService constructor.
     */
    public function __construct()
    {
        $this->apiKey = config('services.tmdb.api_key');
        $this->baseUrl = config('services.tmdb.base_url');
    }

    /**
     * Make a request to the TMDb API
     *
     * @param string $endpoint
     * @return mixed
     */
    private function makeRequest(string $endpoint): mixed
    {
        $response = Http::withHeaders([
            'Authorization' => 'Bearer ' . $this->apiKey,
        ])->get("{$this->baseUrl}/{$endpoint}");

        return $response->json();
    }

    /**
     * Get trending movies
     *
     * @param string $timeWindow
     * @return mixed
     */
    public function getTrendingMovies(string $timeWindow = 'day'): mixed
    {
        return $this->makeRequest("trending/movie/{$timeWindow}")['results'];
    }

    /**
     * Get movie details
     *
     * @param int $movieId
     * @param string $language
     * @return mixed
     */
    public function getMovieDetails(int $movieId, string $language = 'en_US'): mixed
    {
        return $this->makeRequest("movie/{$movieId}?language={$language}");
    }

    /**
     * Get movie genres
     *
     * @param string $language
     * @return mixed
     */
    public function getGenres(string $language = 'en'): mixed
    {
        return $this->makeRequest("genre/movie/list?language={$language}")['genres'];
    }
}
