<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use App\Http\Requests\Movie\StoreMovieRequest;
use App\Http\Requests\Movie\UpdateMovieRequest;

class MovieController extends Controller
{
    public function index()
    {
        $movies = Movie::all();

        return view('movies.index', ['movies' => $movies]);
    }

    public function create()
    {
        return view('movies.create');
    }

    public function store(StoreMovieRequest $request)
    {
        Movie::create($request->validated());

        return redirect()->route('movies.index')->with('success', 'Movie created with success.');
    }

    public function show(Movie $movie)
    {
        return view('movies.show', [
            'movie' => $movie
        ]);
    }

    public function edit(Movie $movie)
    {
        return view('movies.edit', [
            'movie' => $movie
         ]);
    }

    public function update(UpdateMovieRequest $request, Movie $movie)
    {
        $movie->update($request->validated());

        return redirect()->route('movies.index')->with('success', 'Movie updated with success.');
    }

    public function destroy(Movie $movie)
    {
        $movie->delete();

        return redirect()->route('movies.index')->with('success', 'Movie deleted with success.');
    }
}
