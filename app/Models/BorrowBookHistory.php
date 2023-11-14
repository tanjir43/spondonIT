<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BorrowBookHistory extends Model
{
    use HasFactory;
    use SoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'borrow_book_id',
        'user_id',
        'prev_quantity',
        'new_quantity',
        'created_by',
        'updated_by',
        'deleted_by',
    ];

    public function borrowBook()
    {
        return $this->belongsTo(BorrowBook::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function createdby()
    {
        return $this->belongsTo(User::class,'created_by');
    }
    
    public function updatedby()
    {
        return $this->belongsTo(User::class,'updated_by');
    }
    
    public function deletedby()
    {
        return $this->belongsTo(User::class,'deleted_by');
    }


}
