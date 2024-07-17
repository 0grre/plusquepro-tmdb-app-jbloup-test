<x-app-layout>
    <x-slot name="header">
        <h2 class="font-semibold text-xl text-gray-800 dark:text-gray-200 leading-tight">
            {{ __('Trending movies') }}
        </h2>
    </x-slot>
    <section class="flex items-center">
        @livewire('movies')
    </section>
</x-app-layout>
