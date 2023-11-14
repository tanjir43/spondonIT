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
        Schema::create('borrow_book_histories', function (Blueprint $table) {
            $table->id();
            $table->foreignId('borrow_book_id')->constrained('borrow_books');
            $table->foreignId('user_id')->constrained('users');
            $table->integer('prev_quantity')->default(0);
            $table->integer('new_quantity')->default(0);

            $table->integer('created_by')->references('id')->on('users');
            $table->integer('updated_by')->nullable()->references('id')->on('users');
            $table->integer('deleted_by')->nullable()->references('id')->on('users');

            $table->timestamps();
            $table->softDeletes();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('borrow_book_histories');
    }
};
