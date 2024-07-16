<?php

namespace App\Http\Requests\Movie;

use Illuminate\Foundation\Http\FormRequest;

class StoreMovieRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'title' => 'required|string|max:255',
			'originalTitle' => 'nullable|string|max:255',
			'overview' => 'nullable|string',
			'posterPath' => 'nullable|string|max:255',
			'backdropPath' => 'nullable|string|max:255',
			'mediaType' => 'nullable|string|max:255',
			'adult' => 'nullable|boolean',
			'originalLanguage' => 'nullable|string|max:255',
			'popularity' => 'nullable|numeric',
			'releaseDate' => 'nullable|date',
			'video' => 'required|boolean',
			'voteAverage' => 'nullable|numeric',
			'voteCount' => 'nullable|integer',
			'budget' => 'nullable|integer',
			'homepage' => 'nullable|string|max:255',
			'imdbId' => 'nullable|string|max:255',
			'revenue' => 'nullable|integer',
			'runtime' => 'nullable|integer',
			'status' => 'nullable|string|max:255',
			'tagline' => 'nullable|string|max:255'
        ];
    }
}
