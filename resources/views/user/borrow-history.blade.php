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
                        <a class="card-nav-link {{ Route::is(['user.dashboard']) ? 'active' : '' }}" href="{{ route('user.dashboard') }}">
                            <i class="fi-user opacity-60 me-2"></i>Books List
                        </a> 
                        <a class="card-nav-link {{ Route::is(['user.borrow.history']) ? 'active' : '' }} " href="{{ route('user.borrow.history') }}"><i class="fi-user opacity-60 me-2"></i>Borrow History</a>
                        <a class="card-nav-link" href="{{route('logout')}}"><i class="fi-logout opacity-60 me-2"></i>Sign Out</a>
                    </div>
                </div>
            </div>
        </aside>
        <!-- Content-->
        <!-- Content-->
        <div class="col-lg-8 col-md-7 mb-5">
            <div class="row d-flex">
                <div class="col-md-7">
                    <h1 class="h2 pb-3 mb-4">Borrow List {{ $datas->count() }} </h1>
                </div>
            </div>
            <div class="border rounded-3 p-3 mb-4" id="book-list">
                <table class="table">
                    <thead>
                        <tr>
                            <th>#</th>
                            <th>Book Name</th>
                            <th>Author</th>
                            <th>Quantity</th>
                            <th>Borrow</th>
                            <th>Status</th>
                            <th>Return</th>
                            <th>Action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @forelse($datas as $key => $data)
                            <tr>
                                <td>{{ $loop->iteration }}</td>
                                <td>{{ $data->book->name ?? '' }}</td>
                                <td>{{ $data->book->author->name  ?? 'N/A'}}</td>
                                <td>{{ $data->quantity }}</td>
                                <td>{{ $data->borrow_date }}</td>
                                <td> 
                                    @if ($data->status == 0)
                                        <span class="badge bg-warning">Pending</span>
                                    @elseif ($data->status == 1)
                                        <span class="badge bg-success">Approved</span>
                                    @elseif ($data->status == 2)
                                        <span class="badge bg-danger">Rejected</span>
                                    @endif
                                </td>
                                <td>
                                    @if ($data->is_returned == 0)
                                        <span class="badge bg-warning">Not Returned</span>
                                    @elseif ($data->is_returned == 1)
                                        <span class="badge bg-success">Returned</span>
                                        <p>{{ $data->return_date ?? ''}}</p>
                                        
                                    @endif
                                </td>
                                <td class="d-flex">
                                    @if ($data->status == 1 && $data->is_returned == 0)
                                        <a href="{{ route('user.return.book', $data->id) }}" class="btn btn-sm btn-success" title="Return"> <i class="fi-rotate-left"></i></a>
                                    @else
                                        <a href="#" class=" btn btn-sm btn-success disabled" title="Return"> <i class="fi-check"></i></a>
                                    @endif

                                    @if ($data->status == 0) 
                                        <a href="#" class="btn btn-sm btn-primary edit-quantity-btn"
                                            data-bs-toggle="modal"
                                            data-bs-target="#editQuantityModal"
                                            data-id="{{ $data->id }}"
                                            data-book-id="{{ $data->book_id }}"
                                            data-borrow-book-id="{{ $data->id }}"
                                            data-previous-quantity="{{ $data->quantity }}">
                                            <i class="fi-edit"></i>
                                        </a>
                                 
                                    @endif
                                </td>
                            </tr>

                            @empty

                            <div class="col-md-12">
                                <div class="alert alert-danger text-center" role="alert">
                                    No Borrowed History Found!
                                </div>
                            </div>
                        @endforelse
                    </tbody>
                </table>
            </div>
        </div>

        <div class="modal fade" id="editQuantityModal" tabindex="-1" aria-labelledby="editQuantityModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="editQuantityModalLabel">Edit Quantity</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                        <!-- Your form to edit quantity goes here -->
                        <form id="editQuantityForm">
                            @csrf
                            <div class="mb-3">
                                <label for="quantity" class="form-label">Quantity</label>
                                <input type="hidden" id="borrow_book_id" name="borrow_book_id" value="">
                                <input type="hidden" id="book_id" name="book_id" value="">
                                <input type="number" class="form-control" id="quantity" name="quantity" value="{{$data->quantity ?? ''}}" required>
                            </div>
                            <button type="submit" class="btn btn-primary">Save changes</button>
                        </form>
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

{{-- <script>
    $(document).ready(function () {
        $('#editQuantityModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var requestId = button.data('id');
            var previousQuantity = button.data('previous-quantity');
            $('#quantity').val(previousQuantity);
        });

        $('#editQuantityForm').submit(function (event) {
            event.preventDefault();

            var formData = $(this).serialize();
            $.ajax({
                url: '{{ route("user.update.borrow.request") }}',
                type: 'POST',
                data: formData,
                success: function (response) {
                    $('#editQuantityModal').modal('hide');
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script> --}}

<script>
    $(document).ready(function () {
        $('#editQuantityModal').on('show.bs.modal', function (event) {
            var button = $(event.relatedTarget);
            var requestId = button.data('id');
            var bookId = button.data('book-id');
            var borrowBookId = button.data('borrow-book-id');
            var previousQuantity = button.data('previous-quantity');

            $('#quantity').val(previousQuantity);

            $('#book_id').val(bookId);
            $('#borrow_book_id').val(borrowBookId);
        });

        $('#editQuantityForm').submit(function (event) {
            event.preventDefault();

            var formData = $(this).serialize();
            $.ajax({
                url: '{{ route("user.update.borrow.request") }}',
                type: 'POST',
                data: formData,
                success: function (response) {
                    $('#editQuantityModal').modal('hide');
                    if (response.success) {
                        toastr.success(response.success);
                    } else if (response.error) {
                        toastr.error(response.error);
                    } 
                },
                error: function (error) {
                    console.log(error);
                }
            });
        });
    });
</script>



 
@endsection