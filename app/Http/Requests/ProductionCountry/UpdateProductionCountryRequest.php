<?php

namespace App\Http\Requests\ProductionCountry;

use Illuminate\Foundation\Http\FormRequest;

class UpdateProductionCountryRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'iso31661' => 'required|string|max:255',
			'name' => 'nullable|string|max:255'
        ];
    }
}
