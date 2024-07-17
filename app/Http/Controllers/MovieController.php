<?php

namespace App\Http\Controllers;

use App\Models\Movie;
use App\Http\Requests\Movie\UpdateMovieRequest;
use Illuminate\Http\RedirectResponse;
use Illuminate\View\View;

class MovieController extends Controller
{
    /**
     * Display a listing of the resource.
     *
     * @return View
     */
    public function index()
    {
        $movies = Movie::all();

        return view('dashboard');
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function show(Movie $movie)
    {
        $movie->reformatBudget();
        $movie->setColorForPopularity();

        return view('movies.show', [
            'movie' => $movie
        ]);
    }

    /**
     * Show the form for creating a new resource.
     *
     * @return View
     */
    public function edit(Movie $movie)
    {
        return view('movies.edit', [
            'movie' => $movie
        ]);
    }

    /**
     * Update the specified resource in storage.
     *
     * @param UpdateMovieRequest $request
     * @param Movie $movie
     * @return RedirectResponse
     */
    public function update(UpdateMovieRequest $request, Movie $movie)
    {
        $movie->update($request->validated());

        return redirect()->back()->with('success', 'Movie updated with success.');
    }

    /**
     * Remove the specified resource from storage.
     *
     * @param Movie $movie
     * @return RedirectResponse
     */
    public function destroy(Movie $movie)
    {
        $movie->delete();

        return redirect()->route('dashboard')->with('success', 'Movie deleted with success.');
    }
}
