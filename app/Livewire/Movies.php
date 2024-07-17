<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Artisan;
use Illuminate\Support\Facades\Cache;
use Illuminate\View\View;
use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Movie;
use App\Models\Genre;

class Movies extends Component
{
    use WithPagination;

    public array $selectedGenres = [];
    public string $search = '';
    public int $perPage = 10;
    public string $timeWindow = 'day';

    /**
     * Search and filter query string
     *
     * @var array|array[]
     */
    protected array $queryString = [
        'search' => ['except' => ''],
        'genre' => ['except' => ''],
        'timeWindow' => ['except' => 'day']
    ];

    /**
     * Reset page when search or genre is updated
     *
     * @return void
     */
    public function updatingSearch(): void
    {
        $this->resetPage();
    }

    /**
     * Update genres
     *
     * @return void
     */
    public function updatingGenres(): void
    {
        $this->resetPage();
    }

    /**
     * Update the time window
     *
     * @param string $timeWindow
     * @return void
     */
    public function updateTimeWindow(string $timeWindow): void
    {
        $this->timeWindow = $timeWindow;
        $this->resetPage();
    }

    /**
     * Render the component
     *
     * @return View
     */
    public function render(): View
    {
        $cacheKey = 'movies_' . $this->timeWindow;
        $movies = Cache::get($cacheKey);

        if (!$movies) {
            Artisan::call('database:populate', ['timeWindow' => $this->timeWindow]);
            $movies = Cache::get($cacheKey);
        }

        $query = Movie::whereIn('id', collect($movies)->pluck('id'));

        if ($this->search) {
            $query->where(function ($q) {
                $q->where('title', 'like', '%' . $this->search . '%')
                    ->orWhere('original_title', 'like', '%' . $this->search . '%');
            });
        }

        if (!empty($this->selectedGenres)) {
            $query->whereHas('genres', function ($q) {
                $q->whereIn('name', $this->selectedGenres);
            });
        }

        $movies = $query->with('genres')->paginate($this->perPage)->onEachSide(1);

        foreach ($movies as $movie) {
            $movie->reformatBudget();
            $movie->setColorForPopularity();
        }

        $genres = Genre::all();

        return view('livewire.movies', [
            'movies' => $movies,
            'genres' => $genres,
        ]);
    }
}
