<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class Genre extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = ['name'];

    /**
     * The movies that belong to the genre.
     */
    public function movies(): BelongsToMany
    {
        return $this->belongsToMany(Movie::class);
    }

    /**
     * The primary key associated with the table.
     *
     * @var string
     */
    public $incrementing = false;
}
