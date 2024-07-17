<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;

class Collection extends Model
{
    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'name',
        'poster_path',
        'backdrop_path'
    ];

    /**
     * The movies that belong to the production company.
     */
    public function movies(): HasMany
    {
        return $this->hasmany(Movie::class);
    }
}
