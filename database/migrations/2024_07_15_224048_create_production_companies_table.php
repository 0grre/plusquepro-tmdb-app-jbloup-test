<?php

use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

class CreateProductionCompaniesTable extends Migration
{
    public function up(): void
    {
        Schema::create('production_companies', function (Blueprint $table) {
            $table->id();
            $table->string('name');
			$table->string('logoPath')->nullable();
			$table->string('originCountry')->nullable();
            $table->timestamps();
        });

        Schema::create('movie_production_company', function (Blueprint $table) {
            $table->id();
            $table->foreignId('movie_id')->constrained()->onDelete('cascade');
            $table->foreignId('production_company_id')->constrained()->onDelete('cascade');
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('movie_production_company');
        Schema::dropIfExists('production_companies');
    }
}
