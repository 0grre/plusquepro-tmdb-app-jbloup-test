<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class SpokenLanguage extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'english_name',
        'iso_639_1',
        'name'
    ];

    /**
     * The movies that belong to the spoken language.
     */
    public function movies(): BelongsToMany
    {
        return $this->belongsToMany(Movie::class);
    }
}
