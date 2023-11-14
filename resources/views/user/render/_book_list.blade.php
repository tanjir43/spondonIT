<div class="row">
    @forelse ($datas as $data)
    <div class="col-md-4">
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