<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductionCountriesTable extends Migration
{
    public function up(): void
    {
        Schema::create('production_countries', function (Blueprint $table) {
            $table->id();
            $table->string('iso31661');
			$table->string('name')->nullable();
            $table->timestamps();
        });

        Schema::create('movie_production_country', function (Blueprint $table) {
            $table->id();
            $table->foreignId('movie_id')->constrained()->onDelete('cascade');
            $table->foreignId('production_country_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('movie_production_country');
        Schema::dropIfExists('production_companies');
    }
}
