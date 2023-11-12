<?php

use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Schema;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Database\Migrations\Migration;

return new class extends Migration
{
    private $data = [
        [
            'id'        => 3,
            'parent'    => null,
            'name'      => 'Save / Update',
            'name_l'    => 'সেভ / আপডেট',
            'web'       => '',
            'app'       => '',
            'web_icon'  => '',
            'app_icon'  => '',
            'note'      => '',
            'note_l'    => '',
        ],
        [
            'id'        => 4,
            'parent'    => null,
            'name'      => 'Block / Unblock',
            'name_l'    => 'ব্লক / আনব্লক',
            'web'       => '',
            'app'       => '',
            'web_icon'  => '',
            'app_icon'  => '',
            'note'      => '',
            'note_l'    => '',
        ],
        [
            'id'        => 5,
            'parent'    => null,
            'name'      => 'Delete',
            'name_l'    => 'ডিলিট',
            'web'       => '',
            'app'       => '',
            'web_icon'  => '',
            'app_icon'  => '',
            'note'      => '',
            'note_l'    => '',
        ],
        [
            'id'        => 6,
            'parent'    => null,
            'name'      => 'Dashboard',
            'name_l'    => 'ড্যাশবোর্ড',
            'web'       => 'dashboard',
            ''       => '',
            'web_icon'  => 'uil uil-home-alt',
            'app_icon'  => '',
            'note'      => '',
            'note_l'    => '',
        ],


        #Book & Employee
        [
            'id'        =>  70,
            'parent'    =>  null,
            'name'      =>  'List',
            'name_l'    =>  'তালিকা',
            'web'       =>  'users',
            'app'       =>  '',
            'web_icon'  =>  'uil uil-users-alt',
            'app_icon'  =>  '',
            'note'      =>  '',
            'note_l'    =>  '',
        ],
        [
            'id'        =>  71,
            'parent'    =>  70,
            'name'      =>  'Book',
            'name_l'    =>  'বই',
            'web'       =>  'books',
            'app'       =>  '',
            'web_icon'  =>  '',
            'app_icon'  =>  '',
            'note'      =>  '',
            'note_l'    =>  '',
        ],
        [
            'id'        =>  72,
            'parent'    =>  70,
            'name'      =>  'Author',
            'name_l'    =>  'লেখক',
            'web'       =>  'authors',
            'app'       =>  '',
            'web_icon'  =>  '',
            'app_icon'  =>  '',
            'note'      =>  '',
            'note_l'    =>  '',
        ],

        #Request new employee
        [
            'id'        => 200,
            'parent'    => null,
            'name'      => 'Requested User ',
            'name_l'    => 'আবেদক কর্মচারী ',
            'web'       => 'requested.user',
            'app'       => '',
            'web_icon'  => 'uil uil-user',
            'app_icon'  => '',
            'note'      => '',
            'note_l'    => '',
        ],      
    ];

    public function up(): void
    {
        Schema::create('menus', function (Blueprint $table) {
            $table->id();
            $table->integer('parent')->nullable();
            $table->string('name')->collation('utf16_general_ci');
            $table->string('name_l')->collation('utf16_general_ci');

            $table->string('web')->nullable();
            $table->string('web_icon')->nullable();
            
            $table->string('app')->nullable();
            $table->string('app_icon')->nullable();

            $table->string('note')->nullable();
            $table->string('note_l')->nullable();
            $table->timestamps();
        });
        DB::table('menus')->insert($this->data);
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('menus');
    }
};
