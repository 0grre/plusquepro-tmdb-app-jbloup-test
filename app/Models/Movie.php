<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Movie extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'title',
        'original_title',
        'overview',
        'poster_path',
        'backdrop_path',
        'media_type',
        'adult',
        'original_language',
        'popularity',
        'release_date',
        'video',
        'vote_average',
        'vote_count',
        'budget',
        'homepage',
        'imdb_id',
        'revenue',
        'runtime',
        'status',
        'tagline',
    ];

    /**
     * The genres that belong to the movie.
     */
    public function genres(): BelongsToMany
    {
        return $this->belongsToMany(Genre::class);
    }

    /**
     * The production countries that belong to the movie.
     */
    public function productionCompanies(): BelongsToMany
    {
        return $this->belongsToMany(ProductionCompany::class);
    }

    /**
     * The production countries that belong to the movie.
     */
    public function productionCountries(): BelongsToMany
    {
        return $this->belongsToMany(ProductionCountry::class);
    }

    /**
     * The production countries that belong to the movie.
     */
    public function spokenLanguages(): BelongsToMany
    {
        return $this->belongsToMany(SpokenLanguage::class);
    }

    /**
     * The collections that belong to the movie.
     */
    public function collection(): BelongsTo
    {
        return $this->belongsTo(Collection::class);
    }

    /**
     * Format the budget.
     *
     * @return void
     */
    public function reformatBudget(): void
    {
        $budget = $this->budget;
        $length = strlen($budget);

        if ($length >= 6 && str_ends_with($budget, '000000')) {
            $this->budget = substr($budget, 0, -6) . 'M';
        } elseif ($length >= 3 && str_ends_with($budget, '000')) {
            $this->budget = substr($budget, 0, -3) . 'K';
        }
    }

    /**
     * Get the color for popularity.
     *
     * @return void
     */
    public function setColorForPopularity(): void
    {
        $this->popularity_color = match (true) {
            $this->popularity >= 5000 => 'bg-green-300',
            $this->popularity >= 2000 => 'bg-green-400',
            $this->popularity >= 1000 => 'bg-yellow-300',
            $this->popularity >= 500 => 'bg-orange-500',
            default => 'bg-red-700',
        };
    }
}
