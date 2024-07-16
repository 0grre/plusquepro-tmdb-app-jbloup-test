<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Movie extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
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
}
