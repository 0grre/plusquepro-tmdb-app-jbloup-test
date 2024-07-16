<?php

namespace App\Http\Controllers;

use App\Models\ProductionCountry;
use App\Http\Requests\ProductionCountry\StoreProductionCountryRequest;
use App\Http\Requests\ProductionCountry\UpdateProductionCountryRequest;

class ProductionCountryController extends Controller
{
    public function index()
    {
        $production_countries = ProductionCountry::all();

        return view('production_countries.index', ['production_countries' => $production_countries]);
    }

    public function create()
    {
        return view('production_countries.create');
    }

    public function store(StoreProductionCountryRequest $request)
    {
        ProductionCountry::create($request->validated());

        return redirect()->route('production_countries.index')->with('success', 'ProductionCountry created with success.');
    }

    public function show(ProductionCountry $production_country)
    {
        return view('production_countries.show', [
            'production_country' => $production_country
        ]);
    }

    public function edit(ProductionCountry $production_country)
    {
        return view('production_countries.edit', [
            'production_country' => $production_country
         ]);
    }

    public function update(UpdateProductionCountryRequest $request, ProductionCountry $production_country)
    {
        $production_country->update($request->validated());

        return redirect()->route('production_countries.index')->with('success', 'ProductionCountry updated with success.');
    }

    public function destroy(ProductionCountry $production_country)
    {
        $production_country->delete();

        return redirect()->route('production_countries.index')->with('success', 'ProductionCountry deleted with success.');
    }
}
