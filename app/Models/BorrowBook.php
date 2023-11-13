<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\SoftDeletes;

class BorrowBook extends Model
{
    use HasFactory;
    use  SoftDeletes;

    protected $dates = ['deleted_at'];

    protected $fillable = [
        'book_id',
        'user_id',
        'borrow_date',
        'quantity',
        'created_by',
        'updated_by',
        'deleted_by',
    ];

    public function book()
    {
        return $this->belongsTo(Book::class);
    }

    public function user()
    {
        return $this->belongsTo(User::class);
    }

    public function scopeSearch($query, $search)
    {
        return $query->where('book_id', 'like', '%' . $search . '%')
            ->orWhere('user_id', 'like', '%' . $search . '%')
            ->orWhere('borrow_date', 'like', '%' . $search . '%')
            ->orWhere('created_by', 'like', '%' . $search . '%')
            ->orWhere('updated_by', 'like', '%' . $search . '%')
            ->orWhere('deleted_by', 'like', '%' . $search . '%');
    }

    public function scopeSearchBook($query, $search)
    {
        return $query->where('book_id', 'like', '%' . $search . '%');
    }

    public function scopeSearchUser($query, $search)
    {
        return $query->where('user_id', 'like', '%' . $search . '%');
    }

    public function scopeSearchBorrowDate($query, $search)
    {
        return $query->where('borrow_date', 'like', '%' . $search . '%');
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
