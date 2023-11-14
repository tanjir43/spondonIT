@extends('layouts.app')

@section('css')
<link rel="stylesheet" media="screen" href="{{asset('home/vendor/simplebar/dist/simplebar.min.css')}}"/>
<link rel="stylesheet" media="screen" href="{{asset('home/vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.css')}}"/>
<link rel="stylesheet" media="screen" href="{{asset('home/vendor/filepond/dist/filepond.min.css')}}"/>
@endsection

@section('content')
    <!-- Page content-->
    <div class="container pt-5 pb-lg-4 mt-5 mb-sm-2">
    <!-- Page content-->
    <div class="row">
        <aside class="col-lg-4 col-md-5 pe-xl-4 mb-5">
            <div class="card card-body border-0 shadow-sm pb-1 me-lg-1" style="background-color:#ebebeb " >
                <div class="d-flex d-md-block d-lg-flex align-items-start pt-lg-2 mb-4"><img class="rounded-circle" src="{{asset('images/dafault.jpg')}}" width="48" alt="John doe">
                    <div class="pt-md-2 pt-lg-0 ps-3 ps-md-0 ps-lg-3">
                        <h2 class="fs-lg mb-0">{{ $current_user->name ?? '' }}</h2>
                        <ul class="list-unstyled fs-sm mt-3 mb-0">
                        <li><a class="nav-link fw-normal p-0" href="mailto:{{ $current_user->email ?? '' }}"><i class="fi-mail opacity-60 me-2"></i>{{ $current_user->email ?? '' }}</a></li>
                        </ul>
                    </div>
                </div>
            
                <div class="collapse d-md-block mt-3" id="account-nav">
                    <div class="card-nav">
                        <a class="card-nav-link active" href="#"><i class="fi-user opacity-60 me-2"></i>Books List</a>
                        <a class="card-nav-link" href="{{route('logout')}}"><i class="fi-logout opacity-60 me-2"></i>Sign Out</a>
                    </div>
                </div>
            </div>
        </aside>
        <!-- Content-->
        <div class="col-lg-8 col-md-7 mb-5 ">
            <div class="row d-flex">
                <div class="col-md-7">
                    <h1 class="h2 pb-3 mb-4">Books List  {{ $datas->count() }} </h1>
                </div>
                <div class="col-md-5 ">
                    <form action="{{route('books.search')}}" method="POST" class="d-flex  align-items-end" >
                        @csrf
                        <input type="text" placeholder="Seach by Book or Author name" name="search" class="form-control" style="height: 44px !important">
                        <button type="submit" class="btn btn-outline-primary" style="padding: .575rem 0.5rem !important"><i class="fi-search"></i></button>
                    </form>
                </div>
            </div>
            <div class="border rounded-3 p-3 mb-4" id="book-list">
                @include('user.render._book_list')
            </div>
        </div>

        <!-- Add this to your blade file -->
        <div class="modal fade" id="quantityModal" tabindex="-1" role="dialog" aria-labelledby="quantityModalLabel" aria-hidden="true">
            <div class="modal-dialog" role="document">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="quantityModalLabel">Enter Quantity</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
                </div>
                <div class="modal-body">
                    <input type="number" id="quantityInput" class="form-control" placeholder="Enter Quantity">
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                    <button type="button" class="btn btn-primary" id="addToCartBtn">Add to Cart</button>
                </div>
            </div>
            </div>
        </div>
 
@endsection

@section('js')
<script src="{{asset('home/vendor/simplebar/dist/simplebar.min.js')}}"></script>
<script src="{{asset('home/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond-plugin-file-validate-type/dist/filepond-plugin-file-validate-type.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond-plugin-image-preview/dist/filepond-plugin-image-preview.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond-plugin-image-crop/dist/filepond-plugin-image-crop.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond-plugin-image-resize/dist/filepond-plugin-image-resize.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond-plugin-image-transform/dist/filepond-plugin-image-transform.min.js')}}"></script>
<script src="{{asset('home/vendor/filepond/dist/filepond.min.js')}}"></script>
<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>

<script>
    // $(document).ready(function () {
    //     $('.cart-icon').on('click', function () {
    //         var bookId = $(this).data('book-id');
    //         $.ajax({
    //             url: '{{ route('borrow.request') }}',
    //             method: 'POST',
    //             data: {
    //                 _token: '{{ csrf_token() }}',
    //                 book_id: bookId
    //             },
    //             success: function (response) {
    //                 console.log(response);
    //             },
    //             error: function (xhr, status, error) {
    //                 console.error(xhr.responseText);
    //             }
    //         });
    //     });
    // });


    $('.cart-icon').on('click', function () {
   // Get the book ID
   var bookId = $(this).data('book-id');

   // Show the modal
   $('#quantityModal').modal('show');

   // Set up a click event for the "Add to Cart" button in the modal
   $('#addToCartBtn').on('click', function () {
      // Get the quantity from the input field
      var quantity = $('#quantityInput').val();

      // Perform your AJAX request here with the bookId and quantity
      $.ajax({
         url: '{{ route('borrow.request') }}',
         method: 'POST',
         data: {
            _token: '{{ csrf_token() }}',
            book_id: bookId,
            quantity: quantity
         },
         success: function (response) {
            if (response.success) {
                toastr.success(response.success);
            } else if (response.error) {
                toastr.error(response.error);
            }         },
         error: function (xhr, status, error) {
            console.error(xhr.responseText);
         }
      });

      // Hide the modal after the AJAX request is complete
      $('#quantityModal').modal('hide');
   });
});

</script>


 
@endsection