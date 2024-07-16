<?php

namespace App\Http\Controllers;

use App\Models\SpokenLanguage;
use App\Http\Requests\SpokenLanguage\StoreSpokenLanguageRequest;
use App\Http\Requests\SpokenLanguage\UpdateSpokenLanguageRequest;

class SpokenLanguageController extends Controller
{
    public function index()
    {
        $spoken_languages = SpokenLanguage::all();

        return view('spoken_languages.index', ['spoken_languages' => $spoken_languages]);
    }

    public function create()
    {
        return view('spoken_languages.create');
    }

    public function store(StoreSpokenLanguageRequest $request)
    {
        SpokenLanguage::create($request->validated());

        return redirect()->route('spoken_languages.index')->with('success', 'SpokenLanguage created with success.');
    }

    public function show(SpokenLanguage $spoken_language)
    {
        return view('spoken_languages.show', [
            'spoken_language' => $spoken_language
        ]);
    }

    public function edit(SpokenLanguage $spoken_language)
    {
        return view('spoken_languages.edit', [
            'spoken_language' => $spoken_language
         ]);
    }

    public function update(UpdateSpokenLanguageRequest $request, SpokenLanguage $spoken_language)
    {
        $spoken_language->update($request->validated());

        return redirect()->route('spoken_languages.index')->with('success', 'SpokenLanguage updated with success.');
    }

    public function destroy(SpokenLanguage $spoken_language)
    {
        $spoken_language->delete();

        return redirect()->route('spoken_languages.index')->with('success', 'SpokenLanguage deleted with success.');
    }
}
