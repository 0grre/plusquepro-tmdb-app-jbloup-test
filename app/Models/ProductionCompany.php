<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;

class ProductionCompany extends Model
{
    use HasFactory;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'id',
        'name',
        'logo_path',
        'origin_country'
    ];

    /**
     * The movies that belong to the production company.
     */
    public function movies(): BelongsToMany
    {
        return $this->belongsToMany(Movie::class);
    }
}
