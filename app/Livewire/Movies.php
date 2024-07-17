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
     * Render the component
     *
     * @return View
     */
    public function render(): View
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
