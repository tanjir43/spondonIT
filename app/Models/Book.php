<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsToMany;
use Illuminate\Database\Eloquent\SoftDeletes;

class Book extends Model
{
    use HasFactory;
    use SoftDeletes;
    protected $dates = ['deleted_at'];
   
    protected $fillable = [
        'name',
        'slug',
        'book_code',
        'publish_year',
        'language',

        'isbn',
        'description',
        'regular_price',
        'offer_price',
        'quantity',
        'media_id',
        
        'print_version',
        'cover_binding',
        'book_condition',
        'country',
        'sku',
        'edition',

        'created_by',
        'updated_by',
        'deleted_by',
    ];

    public function authors():BelongsToMany
    {
        return $this->belongsToMany(Author::class)
        ->withTimestamps();
    }

    public function media()
    {
        return $this->belongsTo(Media::class);
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
