<?php

namespace App\Http\Requests\SpokenLanguage;

use Illuminate\Foundation\Http\FormRequest;

class UpdateSpokenLanguageRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'englishName' => 'nullable|string|max:255',
			'iso6391' => 'required|string|max:255',
			'name' => 'nullable|string|max:255'
        ];
    }
}
