<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class CreateUserLevelTable extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('user_levels', function (Blueprint $table) {
            $table->string('id', 50)->primary();
            $table->string('parent_id', 50);
            $table->string('name', 50);
            $table->integer('level')->default(0);
            $table->boolean('is_active')->default(true);

            $table->timestamp('deleted_at')->nullable();
            $table->timestamp('created_at')->useCurrent()->useCurrentOnCreate();
            $table->string('created_by', 50)->nullable();
            $table->timestamp('updated_at')->useCurrent()->useCurrentOnUpdate();
            $table->string('updated_by', 50)->nullable();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('user_level');
    }
}
