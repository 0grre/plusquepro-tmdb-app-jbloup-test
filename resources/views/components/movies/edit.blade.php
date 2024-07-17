<section class="bg-white dark:bg-gray-900">
    <div class="max-w-4xl px-4 py-8 mx-auto lg:py-16">
        <h2 class="mb-4 text-xl font-bold text-gray-900 dark:text-white">Edit {{ $movie->title }}</h2>
        <form action="{{ route('movies.update', $movie->id) }}" method="POST">
            @csrf
            @method('PUT')
            <div class="grid gap-4 mb-4 sm:grid-cols-2 sm:gap-6 sm:mb-5">
                <div class="sm:col-span-2">
                    <label for="title"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Title</label>
                    <input type="text" name="title" id="title"
                           class="bg-gray-50 border {{ $errors->has('title') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old(')title', $movie->title) }}" required>
                    @if ($errors->has('title'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('title') }}</p>
                    @endif
                </div>
                <div class="sm:col-span-2">
                    <label for="original_title" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Original
                        Title</label>
                    <input type="text" name="original_title" id="original_title"
                           class="bg-gray-50 border {{ $errors->has('original_title') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('original_title', $movie->original_title) }}">
                    @if ($errors->has('original_title'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('original_title') }}</p>
                    @endif
                </div>
                <div class="sm:col-span-2">
                    <label for="overview"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Overview</label>
                    <textarea id="overview" name="overview" rows="4"
                              class="block p-2.5 w-full text-sm text-gray-900 bg-gray-50 rounded-lg border {{ $errors->has('overview') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 focus:ring-primary-500 focus:border-primary-500' }} dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500">{{ old('overview', $movie->overview) }}</textarea>
                    @if ($errors->has('title'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('title') }}</p>
                    @endif
                </div>
                <div class="sm:col-span-2">
                    <label for="poster_path" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Poster
                        Path</label>
                    <input type="text" name="poster_path" id="poster_path"
                           class="bg-gray-50 border {{ $errors->has('poster_path') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('poster_path', $movie->poster_path) }}">
                    @if ($errors->has('poster_path'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('poster_path') }}</p>
                    @endif
                </div>
                <div class="sm:col-span-2">
                    <label for="backdrop_path" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Backdrop
                        Path</label>
                    <input type="text" name="backdrop_path" id="backdrop_path"
                           class="bg-gray-50 border {{ $errors->has('backdrop_path') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('backdrop_path', $movie->backdrop_path) }}">
                    @if ($errors->has('backdrop_path'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('backdrop_path') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="original_language" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Original
                        Language</label>
                    <input type="text" name="original_language" id="original_language"
                           class="bg-gray-50 border {{ $errors->has('original_language') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('original_language', $movie->original_language) }}">
                    @if ($errors->has('original_language'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('original_language') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="popularity" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Popularity</label>
                    <input type="number" name="popularity" id="popularity"
                           class="bg-gray-50 border {{ $errors->has('popularity') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('popularity', $movie->popularity) }}">
                    @if ($errors->has('popularity'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('popularity') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="release_date" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Release
                        Date</label>
                    <input type="date" name="release_date" id="release_date"
                           class="bg-gray-50 border {{ $errors->has('release_date') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('release_date', $movie->release_date) }}">
                    @if ($errors->has('release_date'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('release_date') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="vote_average" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Vote
                        Average</label>
                    <input type="number" step="0.1" name="vote_average" id="vote_average"
                           class="bg-gray-50 border {{ $errors->has('vote_average') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('vote_average', $movie->vote_average) }}">
                    @if ($errors->has('vote_average'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('vote_average') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="vote_count" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Vote
                        Count</label>
                    <input type="number" name="vote_count" id="vote_count"
                           class="bg-gray-50 border {{ $errors->has('vote_count') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('vote_count', $movie->vote_count) }}">
                    @if ($errors->has('vote_count'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('vote_count') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="budget"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Budget</label>
                    <input type="number" name="budget" id="budget"
                           class="bg-gray-50 border {{ $errors->has('budget') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('budget', $movie->budget) }}">
                    @if ($errors->has('budget'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('budget') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="homepage"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Homepage</label>
                    <input type="text" name="homepage" id="homepage"
                           class="bg-gray-50 border {{ $errors->has('homepage') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('homepage', $movie->homepage) }}">
                    @if ($errors->has('homepage'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('homepage') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="imdb_id" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">IMDB
                        ID</label>
                    <input type="text" name="imdb_id" id="imdb_id"
                           class="bg-gray-50 border {{ $errors->has('imdb_id') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('imdb_id', $movie->imdb_id) }}">
                    @if ($errors->has('imdb_id'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('imdb_id') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="revenue"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Revenue</label>
                    <input type="number" name="revenue" id="revenue"
                           class="bg-gray-50 border {{ $errors->has('revenue') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('revenue', $movie->revenue) }}">
                    @if ($errors->has('revenue'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('revenue') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="runtime" class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Runtime
                        (minutes)</label>
                    <input type="number" name="runtime" id="runtime"
                           class="bg-gray-50 border {{ $errors->has('runtime') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('runtime', $movie->runtime) }}">
                    @if ($errors->has('runtime'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('runtime') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="status"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Status</label>
                    <input type="text" name="status" id="status"
                           class="bg-gray-50 border {{ $errors->has('status') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('status', $movie->status) }}">
                    @if ($errors->has('status'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('status') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="tagline"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Tagline</label>
                    <input type="text" name="tagline" id="tagline"
                           class="bg-gray-50 border {{ $errors->has('tagline') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block w-full p-2.5 dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500"
                           value="{{ old('tagline', $movie->tagline) }}">
                    @if ($errors->has('tagline'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('tagline') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="adult"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Adult</label>
                    <input type="checkbox" name="adult" id="adult"
                           class="bg-gray-50 border {{ $errors->has('adult') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" {{ old('adult', $movie->adult) ? 'checked' : '' }}>
                    @if ($errors->has('adult'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('adult') }}</p>
                    @endif
                </div>
                <div class="w-full">
                    <label for="video"
                           class="block mb-2 text-sm font-medium text-gray-900 dark:text-white">Video</label>
                    <input type="checkbox" name="video" id="video"
                           class="bg-gray-50 border {{ $errors->has('video') ? 'border-red-500 bg-red-50 text-red-900 placeholder-red-700 focus:ring-red-500 focus:border-red-500' : 'border-gray-300 text-gray-900 focus:ring-primary-600 focus:border-primary-600' }} text-sm rounded-lg block dark:bg-gray-700 dark:border-gray-600 dark:placeholder-gray-400 dark:text-white dark:focus:ring-primary-500 dark:focus:border-primary-500" {{ old('video', $movie->video) ? 'checked' : '' }}>
                    @if ($errors->has('video'))
                        <p class="mt-2 text-sm text-red-600 dark:text-red-500"><span
                                class="font-medium">Oups !</span> {{ $errors->first('video') }}</p>
                    @endif
                </div>
            </div>
            <div class="flex items-center space-x-4">
                <button type="submit"
                        class="text-white bg-primary-700 hover:bg-primary-800 focus:ring-4 focus:outline-none focus:ring-primary-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:bg-primary-600 dark:hover:bg-primary-700 dark:focus:ring-primary-800">
                    Update Movie
                </button>
                <button id="deleteButton-{{ $movie->id }}" data-modal-target="deleteModal-{{ $movie->id }}"
                        data-modal-toggle="deleteModal-{{ $movie->id }}"
                        class="text-red-600 inline-flex items-center hover:text-white border border-red-600 hover:bg-red-600 focus:ring-4 focus:outline-none focus:ring-red-300 font-medium rounded-lg text-sm px-5 py-2.5 text-center dark:border-red-500 dark:text-red-500 dark:hover:text-white dark:hover:bg-red-600 dark:focus:ring-red-900">
                    <svg class="w-5 h-5 mr-1 -ml-1" fill="currentColor" viewBox="0 0 20 20"
                         xmlns="http://www.w3.org/2000/svg">
                        <path fill-rule="evenodd"
                              d="M9 2a1 1 0 00-.894.553L7.382 4H4a1 1 0 000 2v10a2 2 0 002 2h8a2 2 0 002-2V6a1 1 0 100-2h-3.382l-.724-1.447A1 1 0 0011 2H9zM7 8a1 1 0 012 0v6a1 1 0 11-2 0V8zm5-1a1 1 0 00-1 1v6a1 1 0 102 0V8a1 1 0 00-1-1z"
                              clip-rule="evenodd"></path>
                    </svg>
                    Delete
                </button>
            </div>
        </form>
    </div>
    <x-movies.delete-modal :movie="$movie"/>
</section>
