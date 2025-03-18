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
        Schema::create('users', function (Blueprint $table) {
            $table->increments('id');
            $table->string('first_name', 191);
            $table->string('last_name', 191);
            $table->string('email', 191);
            $table-> string('phone', 191);
            $table->string('password', 191);
            $table->text('role');
            $table->datetime('last_login');
            $table->timestamps();
        });
        Schema::create('products', function(Blueprint  $table){
            $table->increments('id');
            $table->bigIncrements('brand_id');
            $table->bigIncrements('tax_class_id');
            $table->string('slug',191);
            $table->decimal('price',18,4);
            $table->dicimal('special_price',18,4);
            $table->string('special_price_type',191);
            $table->date('special_price_start');
            $table->date('special_price_end');
            $table->decimal('selling_price',18,4);
            $table->string('sku',191);
            $table->tinyInteger('manage_stock',1);
            $table->int('qty');
            $table->tinyInteger('in_stock',1);
            $table->int('viewed');
            $table->tinyInteger('is_active',1);
            $table->datetime('new_from');
            $table->dateTime('new_to');
            $table->softDeletes();
            $table->int('position');
            $table->timestamps();
        });
        Schema::create('product_variants', function(Blueprint  $table){
            $table->increments('id');
            $table->string('uid',191);
            $table->text('uids');
            $table->bigIncrements('product_id');
            $table->string('name',191);
            $table->decimal('price',18,4);
            $table->dicimal('special_price',18,4);
            $table->string('special_price_type',191);
            $table->date('special_price_start');
            $table->date('special_price_end');
            $table->decimal('selling_price',18,4);
            $table->string('sku',191);
            $table->tinyInteger('manage_stock',1);
            $table->int('qty');
            $table->tinyInteger('in_stock',1);
            $table->tinyInteger('is_default',1);
            $table->tinyInteger('is_active',1);
            $table->int('position');
            $table->softDeletes();
            $table->timestamp();
        });
        Schema::create('variations', function(Blueprint $table){
            $table->increments('id');
            $table->string('uid',191);
            $table->string('type',191);
            $table->tinyInteger('is_global',1);
            $table->int('position');
            $table->softDeletes();
            $table->timestamp();
        });
        Schema::create('variation_values', function (Blueprint $table) {
            $table->increments('id');
            $table->string('uid',191);
            $table->bigIncrements('variation_id');
            $table->string('value',191);
            $table->int('position');
            $table->timestamp();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('products_management');
    }
};
