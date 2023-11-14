@extends('layouts.app')

@section('content')
    <!-- Hero-->
    <section class="pb-4 pt-5">
    <div class="container">
        <div class="row align-items-center mt-2 mt-md-0 pt-md-4 pt-lg-5 pb-5">
        <div class="col-md-5 order-md-2 mb-5 mb-md-0">
            <div class="parallax mx-auto" style="max-width: 526px;">
            <div class="parallax-layer position-relative" data-depth="0.1"><img src="{{asset('images/book_reader.png')}}" alt="illustration"></div>
            </div>
        </div>
        <div class="col-md-7 order-md-1">
            <h2 class="text-dark pb-2 mb-2" style="max-width: 31.5rem;">"The only thing you absolutely have to know is the location of the library."</h2>
            <div class="d-flex flex-wrap">- Albert Einstein</div>
        </div>
        </div>
    </div>
    </section>

    <section class="container mb-5">
        <h6 class="h6 text-center text-sm-start mb-sm-4 pt-4" style="font-size:20px">Book List</span></h6>
        <div class="tns-carousel-wrapper tns-nav-outside tns-nav-outside-flush">
            <div class="row">
                @forelse ($datas as $data)
                <div class="col-md-3">
                    <div class="card border-0 shadow-sm pb-1 me-lg-1" style="background-color: #ebebeb; position: relative; cursor: pointer;">
                        <div data-book-id="{{ $data->id }}" class="cart-icon" style="position: absolute; top: 0; left: 0; padding: 8px; font-size: 20px; border: 2px solid rgb(189, 90, 9); border-radius: 25%;" class="text-primary">
                            <i class="fi-cart"></i>
                         </div>
                        
                        <img class="" style="object-fit: cover; height: 200px" src="{{ $data->media->attachment }}" alt="Book Image">
                
                        <div class="card-body">
                            <h5 class="card-title">{{ $data->name ?? '' }}</h5>
                            <p class="card-text"><strong>ISBN:</strong> {{ $data->isbn ?? '' }}</p>
                            <p class="card-text"><strong>Authors:</strong>
                                @foreach($data->authors as $author)
                                    {{ $author['name'] ?? 'N/A' }}
                                    @if(!$loop->last), @endif
                                @endforeach
                            </p>
                
                            <p class="card-text"><strong>Published Date:</strong> {{ $data->publish_year ?? '' }}</p>
                        </div>
                    </div>
                </div>
                @empty
                    <div class="col-md-12">
                        <div class="alert alert-danger text-center" role="alert">
                            No Books Found!
                        </div>
                    </div>
                @endforelse
            </div>
        </div>
        </section>
@endsection