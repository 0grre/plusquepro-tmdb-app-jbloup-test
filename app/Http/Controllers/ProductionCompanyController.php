<?php

namespace App\Http\Controllers;

use App\Models\ProductionCompany;
use App\Http\Requests\ProductionCompany\StoreProductionCompanyRequest;
use App\Http\Requests\ProductionCompany\UpdateProductionCompanyRequest;

class ProductionCompanyController extends Controller
{
    public function index()
    {
        $production_companies = ProductionCompany::all();

        return view('production_companies.index', ['production_companies' => $production_companies]);
    }

    public function create()
    {
        return view('production_companies.create');
    }

    public function store(StoreProductionCompanyRequest $request)
    {
        ProductionCompany::create($request->validated());

        return redirect()->route('production_companies.index')->with('success', 'ProductionCompany created with success.');
    }

    public function show(ProductionCompany $production_company)
    {
        return view('production_companies.show', [
            'production_company' => $production_company
        ]);
    }

    public function edit(ProductionCompany $production_company)
    {
        return view('production_companies.edit', [
            'production_company' => $production_company
         ]);
    }

    public function update(UpdateProductionCompanyRequest $request, ProductionCompany $production_company)
    {
        $production_company->update($request->validated());

        return redirect()->route('production_companies.index')->with('success', 'ProductionCompany updated with success.');
    }

    public function destroy(ProductionCompany $production_company)
    {
        $production_company->delete();

        return redirect()->route('production_companies.index')->with('success', 'ProductionCompany deleted with success.');
    }
}
