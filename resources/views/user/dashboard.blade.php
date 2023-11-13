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
        <div class="col-lg-8 col-md-7 mb-5">
            <h1 class="h2 pb-3 mb-4">Books List</h1>
       
        <div class="border rounded-3 p-3 mb-4" id="personal-info">
            <!-- Name-->
            <div class="border-bottom pb-3 mb-3">
                <div class="d-flex align-items-center justify-content-between">
                    <div class="pe-2">
                    <label class="form-label fw-bold">Full name</label>
                    <div id="name-value">{{$current_user->name}}</div>
                    </div>
                    <div class="me-n3" data-bs-toggle="tooltip" title="Edit"><a class="nav-link py-0" href="#name-collapse" data-bs-toggle="collapse"><i class="fi-edit"></i></a></div>
                </div>
                <div class="collapse" id="name-collapse" data-bs-parent="#personal-info">
                    <input class="form-control mt-3" name="name" type="text" data-bs-binded-element="#name-value" placeholder="{{$current_user->name}}" data-bs-unset-value="Not specified" value="{{old($current_user->name)}}">
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
@endsection