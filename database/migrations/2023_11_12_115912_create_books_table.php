<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('books', function (Blueprint $table) {
            $table->id();

 
            $table->string('name')->collation('utf16_general_ci');
            $table->string('slug')->unique();
            $table->string('book_code')->collation('utf16_general_ci')->unique();
            $table->foreignId('media_id')->nullable()->constrained('media');

            $table->date('publish_year')->nullable();
            $table->float('regular_price')->nullable();
            $table->float('offer_price')->nullable();
            $table->string('language')->default('english')->nullable()->collation('utf16_general_ci');
            
            $table->integer('quantity')->nullable()->default(0);
            $table->string('isbn')->unique();
            $table->string('print_version')->nullable()->collation('utf16_general_ci');
            $table->string('cover_binding')->nullable()->collation('utf16_general_ci');
            
            $table->string('book_condition')->nullable()->collation('utf16_general_ci');
            $table->string('country')->nullable()->collation('utf16_general_ci');
            $table->integer('sku')->unique();

            $table->string('edition')->nullable()->collation('utf16_general_ci');
            $table->text('description')->nullable()->collation('utf16_general_ci');

            $table->integer('created_by')->references('id')->on('users');
            $table->integer('updated_by')->nullable()->references('id')->on('users');
            $table->integer('deleted_by')->nullable()->references('id')->on('users');

            $table->softDeletes();

            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('books');
    }
};
