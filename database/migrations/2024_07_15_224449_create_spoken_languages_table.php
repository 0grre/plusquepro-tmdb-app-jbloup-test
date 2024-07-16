<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateSpokenLanguagesTable extends Migration
{
    public function up(): void
    {
        Schema::create('spoken_languages', function (Blueprint $table) {
            $table->id();
            $table->string('name')->nullable();
            $table->string('iso_639_1')->unique();
            $table->string('english_name')->nullable();
            $table->timestamps();
        });

        Schema::create('movie_spoken_language', function (Blueprint $table) {
            $table->id();
            $table->foreignId('movie_id')->constrained()->onDelete('cascade');
            $table->foreignId('spoken_language_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('movie_spoken_language');
        Schema::dropIfExists('spoken_languages');
    }
}
