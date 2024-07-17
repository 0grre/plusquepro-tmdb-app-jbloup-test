<?php

namespace App\Livewire;

use Illuminate\Support\Facades\Log;
use Illuminate\View\View;
use Livewire\Component;
use Livewire\WithPagination;
use App\Models\Movie;
use App\Models\Genre;

class Movies extends Component
{
    use WithPagination;

    public string $search = '';
    public array $selectedGenres = [];
    public int $perPage = 10;

    /**
     * Search and filter query string
     *
     * @var array|array[]
     */
    protected array $queryString = [
        'search' => ['except' => ''],
        'genre' => ['except' => ''],
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
     * Reset page when search or genre is updated
     *
     * @return void
     */
    public function updatingGenre(): void
    {
        $this->resetPage();
    }
/**
     * Format budget
     *
     * @param int $number
     * @return string
     */
    public function formatBudget(int $number): string
    {
        $number = (string)$number;

        $length = strlen($number);

        if ($length >= 6 && str_ends_with($number, '000000')) {
            return substr($number, 0, -6) . 'M';
        } elseif ($length >= 3 && str_ends_with($number, '000')) {
            return substr($number, 0, -3) . 'K';
        } else {
            return $number;
        }
    }

    /**
     * Get color for popularity
     *
     * @param int $popularity
     * @return string
     */
    public function getColorForPopularity(int $popularity): string
    {
        return match (true) {
            $popularity >= 5000 => 'bg-green-300',
            $popularity >= 2000 => 'bg-green-400',
            $popularity >= 1000 => 'bg-yellow-300',
            $popularity >= 500 => 'bg-orange-400',
            default => 'bg-red-700',
        };
    }

    /**
     * Render the component
     *
     * @return View
     */
    public function render()
    {
        Log::debug('Selected Genres:', $this->selectedGenres);

        $query = Movie::query();

        if ($this->search) {
            $query->where('title', 'like', '%' . $this->search . '%')
                ->orWhere('original_title', 'like', '%' . $this->search . '%');
        }

        if (!empty($this->selectedGenres)) {
            $query->whereHas('genres', function ($q) {
                $q->whereIn('name', $this->selectedGenres);
            });
        }

        $movies = $query->with('genres')->paginate($this->perPage)->onEachSide(1);

        foreach ($movies as $movie) {
            $movie->budget = $this->formatBudget($movie->budget);
            $movie->popularity_color = $this->getColorForPopularity($movie->popularity);
        }

        $genres = Genre::all();



        return view('livewire.movies', [
            'movies' => $movies,
            'genres' => $genres,
        ]);
    }
}
