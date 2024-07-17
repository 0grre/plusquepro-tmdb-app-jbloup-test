<?php

namespace App\Http\Requests\Movie;

use Illuminate\Foundation\Http\FormRequest;

class UpdateMovieRequest extends FormRequest
{
    /**
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * @return array
     */
    public function rules(): array
    {
        return [
            'title' => 'required|string|max:255',
			'original_title' => 'nullable|string|max:255',
			'overview' => 'nullable|string',
			'poster_path' => 'nullable|string|max:255',
			'backdrop_path' => 'nullable|string|max:255',
			'adult' => 'nullable|boolean',
			'original_language' => 'nullable|string|max:255',
			'popularity' => 'nullable|numeric',
			'release_date' => 'nullable|date',
			'video' => 'nullable|boolean',
			'vote_average' => 'nullable|numeric|max:10',
			'vote_count' => 'nullable|integer',
			'budget' => 'nullable|integer',
			'homepage' => 'nullable|string|max:255',
			'imdb_id' => 'nullable|string|max:255',
			'revenue' => 'nullable|integer',
			'runtime' => 'nullable|integer',
			'status' => 'nullable|string|max:255',
			'tagline' => 'nullable|string|max:255'
        ];
    }
}
