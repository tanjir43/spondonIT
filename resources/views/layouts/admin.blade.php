<!DOCTYPE html>
<html lang="{{ app()->getLocale() }}" translate="{{ env('TRANSLATE',0) }}">
    <head>
        <meta charset="utf-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="csrf-token" content="{{ csrf_token() }}">

        <title>{{ config('app.name', 'SpondonIT') }}</title>

        {{-- Fonts --}}
        <link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap">
        {{-- Toastr --}}
        <link rel="stylesheet" href="{{ asset('toastr/toastr.min.css') }}">
        {{-- saas --}}
        <link href="{{ asset('saas/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
    
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.css">

        {{-- Styles --}}
        <link rel="stylesheet" href="{{ asset('saas/css/app.min.css') }}">

        {{-- Scripts --}}
        <script src="{{ asset('js/jquery/jquery.min.js') }}"></script>
        @yield('css')
    </head>
    <body class="show" data-layout-color="light" data-layout-mode="fluid" data-rightbar-onstart="true" data-leftbar-theme="dark">

        <noscript>
            <div Style="text-align: center;">
                <img style="width: 10rem;margin: 0 auto;" src="data:image/png;base64,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"/>
                <h1 style="font-size: 3rem;color: red;">JavaScript is disabled</h1>
                <p style="font-size: 1.5rem;">Please enable JavaScript and refresh the page.</p>
            </div>
        </noscript>

        <div class="wrapper">
            {{-- @livewire('sidebar') --}}
            @include('layouts.sidebar')

            <div class="content-page">
                <div class="content">
                    {{-- @livewire('topbar') --}}
                    @include('layouts.topbar')

                    {{-- Start Content --}}
                    <div class="container-fluid mt-2">
                        @yield('content')
                    </div>
                </div>
            </div>
        </div>  
        <script src="{{ asset('saas/js/vendor.min.js') }}"></script>
        <script src="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
        <script src="{{ asset('saas/js/app.min.js') }}"></script>

        @foreach ($errors->all() as $error)
            <x-alert type="error" :msg="$error"/>
        @endforeach

        @if(session('errors_'))
            @foreach (session('errors_') as $key => $val)
                <x-alert type="error" :msg="$val"/>
            @endforeach
        @endif
        @if(session('success'))
            <x-alert type="success" :msg="session('success')"/>
        @endif
        @yield('js')
        <script>
            const openLeft = $('#open_left');
            const topSearch = $('#top-search');
            const searchDropdown = $('#search-dropdown');

            $(document).ready(function () {
                openLeft.on('click',function () {
                    setTimeout(() => {
                        let srcwidth = topSearch.css('width');
                        searchDropdown.attr('style',`width:${srcwidth}`)
                    }, 200);
                })
            })
        </script>
    </body>
</html>