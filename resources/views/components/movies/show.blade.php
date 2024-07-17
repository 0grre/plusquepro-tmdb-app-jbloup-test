<section class="py-8 bg-white md:py-16 dark:bg-gray-900 antialiased">
    <div class="max-w-screen-xl px-4 mx-auto lg:px-12 w-full my-6">
        <div class="lg:grid lg:grid-cols-2 lg:gap-8 xl:gap-16">
            <div class="shrink-0 max-w-md lg:max-w-lg mx-auto">
                <img class="w-full dark:hidden"
                     src="{{ config('services.tmdb.images_url') . "w500$movie->poster_path" }}" alt=""/>
                <img class="w-full hidden dark:block"
                     src="https://flowbite.s3.amazonaws.com/blocks/e-commerce/imac-front-dark.svg" alt=""/>
            </div>

            <div class="mt-6 sm:mt-8 lg:mt-0">

                <h1 class="text-xl font-semibold text-gray-900 sm:text-2xl dark:text-white">
                    {{ $movie->title }}  <span class="text-lg font-normal text-gray-500 dark:text-gray-400">({{ $movie->original_title }})</span>
                </h1>
                <h3 class="ml-2 mt-2 text-lg font-semibold text-gray-500 dark:text-white">
                    {{ $movie->tagline }}
                </h3>
                <div class="mt-4 sm:items-center sm:gap-4 sm:flex">
                    <p class="text-2xl font-extrabold text-gray-900 sm:text-3xl dark:text-white">
                        {{ $movie->popularity }}
                    </p>

                    <div class="flex items-center gap-2 mt-2 sm:mt-0">
                        @php($stars = round($movie->vote_average / 2))
                        <div class="flex items-center gap-1">
                            @for ($i = 1; $i <= 5; $i++)
                                <svg
                                    class="w-4 h-4 text-yellow-300"
                                    aria-hidden="true"
                                    xmlns="http://www.w3.org/2000/svg"
                                    width="24"
                                    height="24"
                                    fill="currentColor"
                                    viewBox="0 0 24 24"
                                >
                                    <path
                                        d="M13.849 4.22c-.684-1.626-3.014-1.626-3.698 0L8.397 8.387l-4.552.361c-1.775.14-2.495 2.331-1.142 3.477l3.468 2.937-1.06 4.392c-.413 1.713 1.472 3.067 2.992 2.149L12 19.35l3.897 2.354c1.52.918 3.405-.436 2.992-2.15l-1.06-4.39 3.468-2.938c1.353-1.146.633-3.336-1.142-3.477l-4.552-.36-1.754-4.17Z"
                                    />
                                </svg>
                            @endfor
                        </div>
                        <p class="text-sm font-medium leading-none text-gray-500 dark:text-gray-400">
                            ({{ $movie->vote_average }})
                        </p>
                        <a href="{{ $movie->homepage }}" target="_blank"
                           class="text-sm font-medium leading-none text-gray-900 underline hover:no-underline dark:text-white">
                            {{ $movie->vote_count }} Votes
                        </a>
                    </div>
                </div>

                <div class="mt-6 sm:gap-4 sm:items-center sm:flex sm:mt-8">
                    <a href="{{ route('movies.edit', $movie) }}"
                        title=""
                        class="flex items-center justify-center py-2.5 px-5 text-sm font-medium text-gray-900 focus:outline-none bg-white rounded-lg border border-gray-200 hover:bg-gray-100 hover:text-primary-700 focus:z-10 focus:ring-4 focus:ring-gray-100 dark:focus:ring-gray-700 dark:bg-gray-800 dark:text-gray-400 dark:border-gray-600 dark:hover:text-white dark:hover:bg-gray-700"
                        role="button">
                        <svg class="w-5 h-5 -ms-2 me-2" xmlns="http://www.w3.org/2000/svg"
                             viewbox="0 0 20 20" fill="currentColor" aria-hidden="true">
                            <path
                                d="M17.414 2.586a2 2 0 00-2.828 0L7 10.172V13h2.828l7.586-7.586a2 2 0 000-2.828z"/>
                            <path fill-rule="evenodd" clip-rule="evenodd"
                                  d="M2 6a2 2 0 012-2h4a1 1 0 010 2H4v10h10v-4a1 1 0 112 0v4a2 2 0 01-2 2H4a2 2 0 01-2-2V6z"/>
                        </svg>
                        Edit
                    </a>
                </div>

                <ul class="mt-6 flex items-center gap-4">
                    <li class="flex items-center gap-2">
                        <svg class="h-4 w-4 text-gray-500 dark:text-gray-400" aria-hidden="true"
                             xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">
                            <path stroke="currentColor" stroke-linecap="round" stroke-width="2"
                                  d="M8 7V6c0-.6.4-1 1-1h11c.6 0 1 .4 1 1v7c0 .6-.4 1-1 1h-1M3 18v-7c0-.6.4-1 1-1h11c.6 0 1 .4 1 1v7c0 .6-.4 1-1 1H4a1 1 0 0 1-1-1Zm8-3.5a1.5 1.5 0 1 1-3 0 1.5 1.5 0 0 1 3 0Z"/>
                        </svg>
                        <p class="text-sm font-medium text-gray-500 dark:text-gray-400">Budget {{ $movie->budget }} $</p>
                    </li>
                </ul>
                <hr class="my-3 md:my-8 border-gray-200 dark:border-gray-800"/>
                <dl>
                    <dt class="mb-3 font-semibold leading-none text-gray-900 dark:text-white">Release date</dt>
                    <dd class="mb-4 font-light text-gray-500 sm:mb-5 dark:text-gray-400">
                        {{ \Carbon\Carbon::parse($movie->release_date)->format('j F, Y')  }}
                    </dd>
                    <dt class="mb-3 font-semibold leading-none text-gray-900 dark:text-white">Categories</dt>
                    <dd class="mb-4 font-light text-gray-500 sm:mb-5 dark:text-gray-400">
                        <div>
                            @foreach($movie->genres as $genre)
                                <span class="bg-primary-100 text-primary-800 text-xs font-medium me-2 px-2.5 py-0.5 rounded dark:bg-primary-900 dark:text-primary-300">{{ $genre->name }}</span>
                            @endforeach
                        </div>
                    </dd>
                </dl>

                <p class="mb-6 text-gray-500 dark:text-gray-400">
                    {{ $movie->overview }}
                </p>
            </div>
        </div>
    </div>
</section>
