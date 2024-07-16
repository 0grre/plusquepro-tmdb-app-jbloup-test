<?php

namespace App\Http\Requests\ProductionCompany;

use Illuminate\Foundation\Http\FormRequest;

class StoreProductionCompanyRequest extends FormRequest
{
    public function authorize()
    {
        return true;
    }

    public function rules()
    {
        return [
            'name' => 'required|string|max:255',
			'logoPath' => 'nullable|string|max:255',
			'originCountry' => 'nullable|string|max:255'
        ];
    }
}
