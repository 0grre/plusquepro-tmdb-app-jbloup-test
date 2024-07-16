<?php

namespace App\Http\Controllers;

use App\Models\Genre;
use App\Http\Requests\Genre\StoreGenreRequest;
use App\Http\Requests\Genre\UpdateGenreRequest;

class GenreController extends Controller
{
    public function index()
    {
        $genres = Genre::all();

        return view('genres.index', ['genres' => $genres]);
    }

    public function create()
    {
        return view('genres.create');
    }

    public function store(StoreGenreRequest $request)
    {
        Genre::create($request->validated());

        return redirect()->route('genres.index')->with('success', 'Genre created with success.');
    }

    public function show(Genre $genre)
    {
        return view('genres.show', [
            'genre' => $genre
        ]);
    }

    public function edit(Genre $genre)
    {
        return view('genres.edit', [
            'genre' => $genre
         ]);
    }

    public function update(UpdateGenreRequest $request, Genre $genre)
    {
        $genre->update($request->validated());

        return redirect()->route('genres.index')->with('success', 'Genre updated with success.');
    }

    public function destroy(Genre $genre)
    {
        $genre->delete();

        return redirect()->route('genres.index')->with('success', 'Genre deleted with success.');
    }
}
