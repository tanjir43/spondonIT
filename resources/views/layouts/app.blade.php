<!DOCTYPE html>
<html lang="en">
  
<meta http-equiv="content-type" content="text/html;charset=utf-8" />
<head>
    <meta charset="utf-8">
    <title>SPONDON IT </title>
    <!-- SEO Meta Tags-->
    <meta name="description" content="SPONDON IT">
    <meta name="keywords" content="software, business, company, bd-top-software-company, e-commerce,pos,govt website,career,retina,SPONDON IT,soft retina">
    <meta name="author" content="SPONDON IT">
    <!-- Viewport-->
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Favicon and Touch Icons-->
    <link rel="apple-touch-icon" sizes="180x180" href="apple-touch-icon.png">
    <link rel="icon" type="image/png" sizes="32x32" href="{{asset('images/spondon-favicon.png')}}">
    <link rel="icon" type="image/png" sizes="16x16" href="{{asset('images/spondon-favicon.png')}}">
    <link rel="manifest" href="site.webmanifest">
    <link rel="mask-icon" color="#5bbad5" href="safari-pinned-tab.svg">
    <meta name="msapplication-TileColor" content="#766df4">
    <meta name="theme-color" content="#ffffff">
    <!-- Page loading styles-->
    <style>
      .page-loading {
        position: fixed;
        top: 0;
        right: 0;
        bottom: 0;
        left: 0;
        width: 100%;
        height: 100%;
        -webkit-transition: all .4s .2s ease-in-out;
        transition: all .4s .2s ease-in-out;
        background-color: #fff;
        opacity: 0;
        visibility: hidden;
        z-index: 9999;
      }
      .page-loading.active {
        opacity: 1;
        visibility: visible;
      }
      .page-loading-inner {
        position: absolute;
        top: 50%;
        left: 0;
        width: 100%;
        text-align: center;
        -webkit-transform: translateY(-50%);
        transform: translateY(-50%);
        -webkit-transition: opacity .2s ease-in-out;
        transition: opacity .2s ease-in-out;
        opacity: 0;
      }
      .page-loading.active > .page-loading-inner {
        opacity: 1;
      }
      .page-loading-inner > span {
        display: block;
        font-size: 1rem;
        font-weight: normal;
        color: #666276;;
      }
      .page-spinner {
        display: inline-block;
        width: 2.75rem;
        height: 2.75rem;
        margin-bottom: .75rem;
        vertical-align: text-bottom;
        border: .15em solid #bbb7c5;
        border-right-color: transparent;
        border-radius: 50%;
        -webkit-animation: spinner .75s linear infinite;
        animation: spinner .75s linear infinite;
      }
      @-webkit-keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      @keyframes spinner {
        100% {
          -webkit-transform: rotate(360deg);
          transform: rotate(360deg);
        }
      }
      
    </style>
    <!-- Page loading scripts-->
    <script>
      (function () {
        window.onload = function () {
          var preloader = document.querySelector('.page-loading');
          preloader.classList.remove('active');
          setTimeout(function () {
            preloader.remove();
          }, 2000);
        };
      })();
      
    </script>
    @yield('css')
    <!-- Vendor Styles-->
    <link rel="stylesheet" media="screen" href="{{ asset('home/vendor/simplebar/dist/simplebar.min.css') }}"/>
    <link rel="stylesheet" media="screen" href="{{asset('home/vendor/tiny-slider/dist/tiny-slider.css')}}"/>
    <link rel="stylesheet" media="screen" href="{{ asset('home/vendor/nouislider/dist/nouislider.min.css') }}"/>
    <!-- Main Theme Styles + Bootstrap-->
    <link rel="stylesheet" media="screen" href="{{asset('home/css/theme.min.css')}}">
    <!-- Google Tag Manager-->
    <script>
      (function(w,d,s,l,i){w[l]=w[l]||[];w[l].push({'gtm.start':
      new Date().getTime(),event:'gtm.js'});var f=d.getElementsByTagName(s)[0],
      j=d.createElement(s),dl=l!='dataLayer'?'&l='+l:'';j.async=true;j.src=
      '../www.googletagmanager.com/gtm5445.html?id='+i+dl;f.parentNode.insertBefore(j,f);
      })(window,document,'script','dataLayer','GTM-WKV3GT5');
    </script>
  </head>
  <!-- Body-->
  <body>
    {{-- demo --}}
    <!-- Page loading spinner-->
    <div class="page-loading active">
      <div class="page-loading-inner">
        <div class="page-spinner"></div><span>Loading...</span>
      </div>
    </div>
    <main class="page-wrapper">
      <!-- Navbar-->
      <header class="navbar navbar-expand-lg fixed-top" style="background-color:#211E3B " data-scroll-header>
        <div class="container"><a class="navbar-brand me-0 me-xl-4" href="job-board-home-v1.html"><img class="d-block" src="{{asset('images/spondon-logo.png')}}"  alt="SPONDON IT" style="width: 200px"></a>
          @auth
          <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <a class="btn btn-link btn-dark text-white btn-sm d-none d-lg-block order-lg-3 pe-0 ms-2" href="{{route('user.dashboard')}}">My Profile<i class="fi-arrow-long-right ms-2"></i></a>
          @else
          <button class="navbar-toggler ms-auto" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation"><span class="navbar-toggler-icon"></span></button>
          <a class="btn btn-link btn-dark btn-sm d-none d-lg-block order-lg-3" href="{{route('login')}}"><i class="fi-user me-2"></i>Sign in</a>

          @endauth
        </div>
      </header>
      <!-- Page content-->
      @yield('content')
    </main>
    <!-- Footer-->
    <footer class="footer pt-5" style="background-color:#211E3B ">
      <div class="container pb-2">
        <div class="row align-items-center pb-4">
          <div class="col-md-6 col-xl-5">
            <!-- Links-->
            <div class="row">
              <div class="col-sm-6 mb-6">
                <h3 class="h6 mb-2 pb-1 fs-base text-white">SPONDON IT</h3>
                <p class="text-justify" style="color:azure; text-align: justify;text-justify: inter-word;">We specialize in converting your Vision about your website into Reality. Welcome to <span class="text-primary">SPONDON IT</span>, a specialist web design and development agency based in Bangladesh.</p>
              </div>
            
            </div>
            <!-- Socials-->
            <div class="text-nowrap border-top border-white py-4"><a class="btn btn-icon btn-translucent-white btn-xs rounded-circle me-2 text-white" href="#"><i class="fi-facebook"></i></a><a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2 text-white" href="#"><i class="fi-twitter"></i></a><a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2 text-white" href="#"><i class="fi-messenger"></i></a><a class="text-white btn btn-icon btn-translucent-dark btn-xs rounded-circle me-2" href="#"><i class="fi-telegram"></i></a><a class="btn btn-icon btn-translucent-dark btn-xs rounded-circle text-white" href="#"><i class="fi-whatsapp"></i></a></div>
          </div>
          <!-- Mobile app-->
          <div class="col-md-6 offset-xl-1">
            <div class="d-flex align-items-center">
              <div class="card card-light card-body p-4 p-xl-5 my-2 my-md-0" style="max-width: 526px;">
                <div style="max-width: 380px;">
                  <h3 class="h4 text-white">Download Our App</h3>
                  <p class="fs-sm text-white opacity-70 mb-2 mb-lg-3">Now finding the new job just got even easier with our new app!</p>
                  <div class="d-flex flex-column flex-sm-row"><a class="btn-market me-sm-3 mt-3" href="#" role="button"><svg xmlns='http://www.w3.org/2000/svg' width='132' height='34' fill='#fff'><path d='M20.047 15.814c-.031-3.755 3.054-5.581 3.189-5.665-1.751-2.56-4.461-2.916-5.41-2.948-2.272-.241-4.482 1.374-5.639 1.374-1.178 0-2.971-1.343-4.889-1.311-2.47.042-4.795 1.479-6.056 3.724-2.616 4.563-.667 11.277 1.845 14.969 1.261 1.804 2.72 3.829 4.649 3.755 1.876-.073 2.585-1.206 4.847-1.206 2.251 0 2.908 1.206 4.868 1.164 2.022-.032 3.283-1.815 4.503-3.64 1.449-2.067 2.033-4.112 2.053-4.217-.052-.021-3.919-1.511-3.961-6zM16.346 4.779c1.011-1.269 1.699-3 1.511-4.763-1.459.063-3.294 1.018-4.347 2.266-.928 1.101-1.762 2.895-1.553 4.584 1.647.126 3.335-.839 4.388-2.088zm35.509 24.673h-2.627l-1.438-4.553h-5.003l-1.366 4.553h-2.554l4.951-15.494h3.064l4.972 15.494zm-4.492-6.462l-1.303-4.039c-.136-.42-.396-1.385-.771-2.916h-.052l-.73 2.916-1.282 4.039h4.138zm17.219.745c0 1.899-.511 3.399-1.543 4.5-.917.986-2.064 1.469-3.419 1.469-1.47 0-2.522-.524-3.169-1.584v5.864h-2.47V21.951l-.094-3.672h2.168l.136 1.773h.042c.823-1.332 2.074-2.004 3.742-2.004 1.313 0 2.397.524 3.273 1.563.897 1.049 1.334 2.413 1.334 4.123zm-2.512.084c0-1.091-.24-1.983-.73-2.686a2.52 2.52 0 0 0-2.147-1.101c-.605 0-1.157.21-1.657.608a2.81 2.81 0 0 0-.969 1.595c-.073.304-.115.556-.115.755v1.867c0 .808.25 1.5.74 2.056s1.136.839 1.928.839c.928 0 1.647-.367 2.168-1.08.521-.724.782-1.668.782-2.853zm15.27-.084c0 1.899-.511 3.399-1.543 4.5-.917.986-2.064 1.469-3.419 1.469-1.47 0-2.522-.524-3.169-1.584v5.864h-2.47V21.951l-.094-3.672h2.168l.136 1.773h.042c.823-1.332 2.074-2.004 3.742-2.004 1.313 0 2.397.524 3.273 1.563.896 1.049 1.334 2.413 1.334 4.123zm-2.512.084c0-1.091-.24-1.983-.73-2.686a2.52 2.52 0 0 0-2.147-1.101c-.605 0-1.157.21-1.657.608-.49.409-.813.934-.969 1.595-.073.304-.115.556-.115.755v1.867c0 .808.25 1.5.74 2.056s1.136.839 1.928.839c.928 0 1.657-.367 2.168-1.08.532-.724.782-1.668.782-2.853zm16.792 1.29c0 1.322-.459 2.392-1.365 3.221-1.001.902-2.397 1.353-4.19 1.353-1.657 0-2.981-.325-3.982-.965l.573-2.067a6.89 6.89 0 0 0 3.565.965c.928 0 1.657-.21 2.168-.629.521-.42.782-.986.782-1.689a2.19 2.19 0 0 0-.636-1.584c-.427-.43-1.136-.829-2.126-1.196-2.721-1.018-4.065-2.497-4.065-4.437 0-1.269.48-2.308 1.428-3.126.948-.808 2.21-1.217 3.784-1.217 1.397 0 2.564.241 3.492.734l-.625 2.014c-.876-.472-1.855-.713-2.96-.713-.865 0-1.553.22-2.043.64-.406.388-.615.85-.615 1.406a1.89 1.89 0 0 0 .709 1.511c.407.367 1.157.766 2.241 1.196 1.324.535 2.293 1.164 2.919 1.888.636.724.948 1.626.948 2.696zm8.172-4.962h-2.721v5.423c0 1.374.48 2.067 1.438 2.067.438 0 .803-.042 1.094-.115l.073 1.888c-.49.178-1.126.273-1.918.273-.98 0-1.73-.304-2.283-.902s-.823-1.605-.823-3.011v-5.633h-1.616V18.28h1.616v-2.046l2.418-.734v2.78h2.721v1.867zm12.237 3.63c0 1.72-.49 3.126-1.459 4.228-1.021 1.133-2.377 1.699-4.065 1.699-1.626 0-2.929-.546-3.898-1.626s-1.449-2.455-1.449-4.112c0-1.731.5-3.147 1.49-4.248 1.001-1.101 2.346-1.657 4.034-1.657 1.626 0 2.939.546 3.93 1.636.948 1.049 1.417 2.413 1.417 4.081zm-2.553.052c0-1.028-.219-1.899-.657-2.633-.521-.892-1.261-1.332-2.22-1.332-.991 0-1.751.441-2.262 1.332-.448.734-.657 1.626-.657 2.685 0 1.028.219 1.909.657 2.633.531.892 1.282 1.332 2.241 1.332.938 0 1.678-.451 2.22-1.353.448-.755.678-1.637.678-2.665zm10.579-3.367c-.24-.042-.5-.063-.782-.063-.865 0-1.542.325-2.011.986-.407.577-.615 1.322-.615 2.203v5.864h-2.471v-7.658l-.072-3.514h2.147l.094 2.14h.072c.261-.734.668-1.332 1.23-1.773.553-.399 1.147-.598 1.783-.598.229 0 .438.021.615.042l.01 2.371zm11.028 2.874c0 .441-.031.818-.094 1.122h-7.4c.031 1.101.385 1.951 1.073 2.528.626.514 1.428.776 2.419.776 1.094 0 2.095-.178 2.991-.524l.386 1.72c-1.053.462-2.293.692-3.721.692-1.72 0-3.075-.514-4.055-1.532s-1.47-2.392-1.47-4.102c0-1.678.459-3.084 1.376-4.207.959-1.196 2.251-1.794 3.878-1.794 1.594 0 2.814.598 3.627 1.794.657.965.99 2.13.99 3.525zm-2.356-.64c.021-.734-.146-1.374-.479-1.909-.427-.692-1.084-1.038-1.96-1.038-.802 0-1.459.336-1.959 1.007-.407.535-.657 1.185-.73 1.93l5.128.011zM46.175 8.419h-1.293l-.709-2.234h-2.46l-.678 2.234h-1.251l2.43-7.616h1.501l2.46 7.616zm-2.22-3.179l-.636-1.993-.386-1.437h-.021l-.365 1.437-.625 1.993h2.033zm8.307-2.318l-2.064 5.497H49.02l-2.001-5.497h1.303l.928 2.906.396 1.385h.031l.396-1.385.917-2.906h1.272zm4.399 5.497l-.094-.629h-.031c-.375.504-.907.755-1.595.755-.98 0-1.668-.692-1.668-1.615 0-1.353 1.167-2.056 3.189-2.056v-.105c0-.724-.386-1.08-1.136-1.08-.542 0-1.011.136-1.428.409l-.25-.797c.5-.315 1.136-.472 1.876-.472 1.428 0 2.147.755 2.147 2.276V7.13c0 .556.021.986.083 1.311L56.66 8.42zm-.167-2.738c-1.345 0-2.022.325-2.022 1.112 0 .577.344.86.834.86.615 0 1.188-.472 1.188-1.122v-.85zm3.878-3.661c-.407 0-.72-.315-.72-.734s.323-.724.741-.724.751.304.74.724c0 .441-.313.734-.761.734zm-.584.902h1.21v5.486h-1.21V2.922zM63.155.404h1.209v8.004h-1.209V.404zm6.358 8.015l-.094-.629h-.031c-.375.504-.907.755-1.595.755-.98 0-1.668-.692-1.668-1.615 0-1.353 1.167-2.056 3.19-2.056v-.105c0-.724-.386-1.08-1.136-1.08-.542 0-1.011.136-1.428.409l-.25-.808c.5-.315 1.136-.472 1.876-.472 1.428 0 2.147.755 2.147 2.276v2.025c0 .556.021.986.073 1.311h-1.084v-.01zm-.167-2.738c-1.345 0-2.022.325-2.022 1.112 0 .577.344.86.834.86.615 0 1.188-.472 1.188-1.122v-.85zm6.098 2.864a1.85 1.85 0 0 1-1.72-.976h-.021l-.073.85h-1.032l.042-1.479V.404h1.22V3.73h.021c.365-.608.938-.913 1.741-.913 1.313 0 2.231 1.133 2.231 2.78 0 1.699-1.022 2.948-2.408 2.948zm-.25-4.773c-.698 0-1.334.608-1.334 1.458v.965c0 .755.573 1.374 1.313 1.374.907 0 1.449-.745 1.449-1.93 0-1.112-.563-1.867-1.428-1.867zm4.45-3.368h1.209v8.004h-1.209V.404zm7.807 5.56h-3.638c.021 1.039.709 1.626 1.72 1.626.542 0 1.032-.094 1.47-.262l.188.85c-.511.231-1.115.336-1.824.336-1.709 0-2.721-1.08-2.721-2.769 0-1.678 1.032-2.948 2.585-2.948 1.386 0 2.272 1.039 2.272 2.612 0 .22-.01.409-.052.556zm-1.105-.871c0-.85-.427-1.448-1.199-1.448-.698 0-1.24.608-1.324 1.448h2.522zM94.8 8.545c-1.595 0-2.627-1.196-2.627-2.822 0-1.699 1.053-2.906 2.721-2.906 1.574 0 2.627 1.143 2.627 2.811 0 1.71-1.084 2.916-2.721 2.916zm.052-4.836c-.876 0-1.438.829-1.438 1.972 0 1.133.573 1.951 1.428 1.951s1.428-.881 1.428-1.983c-.01-1.112-.563-1.941-1.418-1.941zm9.183 4.709h-1.209V5.261c0-.976-.375-1.458-1.105-1.458-.719 0-1.209.619-1.209 1.343v3.262h-1.209V4.495l-.042-1.574h1.063l.052.85h.032c.323-.587.99-.965 1.73-.965 1.146 0 1.897.881 1.897 2.318v3.294zm7.932-4.573h-1.334V6.51c0 .682.24 1.018.709 1.018a2.64 2.64 0 0 0 .542-.052l.031.923c-.24.094-.552.136-.938.136-.959 0-1.522-.535-1.522-1.92v-2.77h-.792v-.913h.792V1.925l1.188-.367v1.364h1.334v.923m6.411 4.574h-1.209V5.282c0-.986-.376-1.479-1.105-1.479-.626 0-1.209.43-1.209 1.301v3.304h-1.209V.404h1.209v3.294h.02a1.83 1.83 0 0 1 1.637-.892c1.157 0 1.866.902 1.866 2.339v3.273zm6.191-2.455h-3.638c.021 1.039.709 1.626 1.72 1.626a4.08 4.08 0 0 0 1.47-.262l.188.85c-.511.231-1.116.336-1.825.336-1.709 0-2.72-1.08-2.72-2.769 0-1.678 1.032-2.948 2.585-2.948 1.386 0 2.272 1.039 2.272 2.612 0 .22-.01.409-.052.556zm-1.105-.871c0-.85-.427-1.448-1.198-1.448-.699 0-1.251.608-1.324 1.448h2.522z'/></svg></a><a class="btn-market mt-3" href="#" role="button"><svg xmlns='http://www.w3.org/2000/svg' xmlns:xlink='http://www.w3.org/1999/xlink' width='140' height='34' fill='none'><g fill='#fff'>
                    <path d='M45.373 4.152c0 1.003-.241 1.88-.843 2.507a3.47 3.47 0 0 1-2.649 1.128 3.47 3.47 0 0 1-2.649-1.128c-.723-.752-1.084-1.629-1.084-2.757s.361-2.005 1.084-2.757A3.47 3.47 0 0 1 41.881.016c.482 0 .963.125 1.445.376s.843.501 1.084.877l-.602.627c-.482-.627-1.084-.877-1.927-.877-.723 0-1.445.251-1.927.877-.602.501-.843 1.253-.843 2.131s.241 1.629.843 2.131 1.204.877 1.927.877c.843 0 1.445-.251 2.047-.877.361-.376.602-.877.602-1.504h-2.649V3.651h3.492v.501zm5.54-3.134h-3.252V3.4h3.011v.877h-3.011v2.381h3.252v1.003h-4.215V.141h4.215v.877zm3.974 6.643h-.963V1.019h-2.047V.141h5.058v.877h-2.047v6.643zm5.54 0V.141h.963v7.52h-.963zm5.058 0h-.964V1.019h-2.047V.141h4.938v.877h-2.047v6.643h.121zm11.441-1.003a3.47 3.47 0 0 1-2.649 1.128 3.47 3.47 0 0 1-2.649-1.128c-.723-.752-1.084-1.629-1.084-2.757s.361-2.005 1.084-2.757A3.47 3.47 0 0 1 74.275.016a3.47 3.47 0 0 1 2.649 1.128c.722.752 1.084 1.629 1.084 2.757s-.361 2.005-1.084 2.757zm-4.576-.627c.482.501 1.204.877 1.927.877s1.445-.251 1.927-.877c.482-.501.843-1.253.843-2.131s-.241-1.629-.843-2.131C75.722 1.268 75 .892 74.277.892s-1.445.251-1.927.877c-.482.501-.843 1.253-.843 2.131s.241 1.629.843 2.131zm6.985 1.629V.141h1.084l3.492 5.891V.141h.963v7.52h-.963L80.176 1.52v6.142h-.843zm-9.034 11.032c-2.89 0-5.178 2.256-5.178 5.39 0 3.008 2.288 5.39 5.178 5.39s5.178-2.256 5.178-5.39c0-3.259-2.288-5.39-5.178-5.39zm0 8.523c-1.565 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.89 1.253 2.89 3.259c0 1.88-1.325 3.259-2.89 3.259zm-11.2-8.523c-2.89 0-5.178 2.256-5.178 5.39 0 3.008 2.288 5.39 5.178 5.39s5.178-2.256 5.178-5.39c0-3.259-2.288-5.39-5.178-5.39zm0 8.523c-1.566 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.89 1.253 2.89 3.259c0 1.88-1.325 3.259-2.89 3.259zm-13.367-6.894v2.256h5.178c-.12 1.253-.602 2.256-1.204 2.883-.723.752-1.927 1.629-3.974 1.629-3.251 0-5.66-2.632-5.66-6.016s2.529-6.016 5.66-6.016c1.686 0 3.011.752 3.974 1.629l1.566-1.629c-1.325-1.253-3.011-2.256-5.419-2.256-4.335 0-8.069 3.76-8.069 8.272s3.733 8.273 8.069 8.273c2.408 0 4.094-.752 5.54-2.381 1.445-1.504 1.927-3.635 1.927-5.264 0-.501 0-1.003-.12-1.379h-7.466zm54.674 1.755c-.482-1.253-1.686-3.384-4.336-3.384s-4.817 2.131-4.817 5.39c0 3.008 2.168 5.39 5.058 5.39 2.288 0 3.733-1.504 4.215-2.381l-1.686-1.253c-.602.877-1.325 1.504-2.529 1.504s-1.927-.501-2.529-1.63l6.865-3.008-.241-.627zm-6.985 1.755c0-2.005 1.566-3.133 2.649-3.133.843 0 1.686.501 1.927 1.128l-4.576 2.005zm-5.66 5.139h2.288V13.303h-2.288V28.97zm-3.613-9.15c-.602-.627-1.566-1.253-2.77-1.253-2.529 0-4.937 2.381-4.937 5.39s2.288 5.264 4.938 5.264c1.204 0 2.168-.627 2.649-1.253h.12v.752c0 2.006-1.084 3.134-2.77 3.134-1.325 0-2.288-1.003-2.529-1.88l-1.927.877c.602 1.379 2.047 3.134 4.576 3.134 2.649 0 4.817-1.629 4.817-5.515v-9.526H84.15v.877zm-2.649 7.395c-1.565 0-2.89-1.379-2.89-3.259s1.325-3.259 2.89-3.259 2.77 1.379 2.77 3.259-1.204 3.259-2.77 3.259zm29.384-13.913h-5.419V28.97h2.288v-5.891h3.131c2.529 0 4.937-1.88 4.937-4.888s-2.408-4.888-4.937-4.888zm.12 7.521h-3.251v-5.39h3.251c1.686 0 2.65 1.504 2.65 2.632-.121 1.379-1.084 2.758-2.65 2.758zm13.849-2.256c-1.686 0-3.372.752-3.974 2.381l2.047.877c.482-.877 1.205-1.128 2.048-1.128 1.204 0 2.288.752 2.408 2.005v.125c-.361-.251-1.325-.627-2.288-.627-2.168 0-4.335 1.253-4.335 3.51 0 2.131 1.806 3.51 3.733 3.51 1.565 0 2.288-.752 2.89-1.504h.121v1.253h2.167v-6.016c-.241-2.757-2.288-4.387-4.817-4.387zm-.241 8.648c-.722 0-1.806-.376-1.806-1.379 0-1.253 1.325-1.629 2.409-1.629.963 0 1.445.251 2.047.501-.241 1.504-1.445 2.507-2.65 2.507zm12.645-8.272l-2.529 6.768h-.12l-2.65-6.768h-2.408l3.974 9.526-2.288 5.264h2.288l6.142-14.79h-2.409zM117.027 28.97h2.288V13.303h-2.288V28.97z'/><path d='M.583 3.637c0-.542.072-.961.234-1.249l14.121 14.18L1.021 30.742c-.255-.301-.438-.786-.438-1.386V3.637zm19.186 8.376l5.576 3.245c.754.439 1.076.98 1.076 1.471s-.321 1.031-1.073 1.47l-5.544 3.049-4.48-4.563v-.145l4.446-4.528zM1.156 31.086l13.917-14.174 4.396 4.477-16.394 9.607c-.49.22-.903.32-1.247.307-.254-.009-.476-.079-.672-.217zm1.91-28.86l16.402 9.497-4.395 4.477L1.155 2.138a1.27 1.27 0 0 1 .683-.257c.337-.024.744.072 1.229.346z' stroke='#454056' stroke-width='.5'/></g><g opacity='.2'><mask id='A' fill='#fff'><use xlink:href='#E'/></mask><use xlink:href='#E' fill='#fff'/><path d='M19.758 21.326l.254.431-.504-.864.25.433zM3.19 30.869l-.25-.433-.01.005-.009.006.268.422zm-2.285 0l.316-.388-.353-.288-.319.325.357.35zm-.114.116l-.357-.35-.344.35.344.35.357-.35zm.114.116l-.357.35.019.02.022.018.316-.388zm2.285 0l-.254-.431-.007.004-.007.005.268.422zm16.318-10.208L2.941 30.435l.499.867 16.568-9.543-.499-.866zM2.922 30.447c-.388.247-.717.325-.984.315a1.19 1.19 0 0 1-.717-.281l-.632.775a2.19 2.19 0 0 0 1.311.505c.505.019 1.032-.136 1.559-.471l-.537-.844zm-2.374.072l-.114.116.714.701.114-.116-.714-.701zm-.114.817l.114.116.714-.701-.114-.116-.714.701zm.155.154a2.19 2.19 0 0 0 1.311.505c.505.019 1.032-.136 1.559-.471l-.537-.844c-.388.247-.717.325-.984.315a1.19 1.19 0 0 1-.717-.281l-.632.775zm2.855.043l16.568-9.775-.508-.861-16.568 9.775.508.861z' fill='#454056' mask='url(#A)'/></g><g opacity='.2'><mask id='B' fill='#fff'><use xlink:href='#F'/></mask><use xlink:href='#F' fill='#fff'/><path d='M.79 30.869l-.357.35.147.15h.21v-.5zm.114.116l-.357.35.857.873v-1.223h-.5zm0-.116h.5v-.5h-.5v.5zm18.853-9.542l-.248-.434-.564.322.455.463.357-.35zm.114.116l-.357.35.272.277.336-.195-.252-.432zm5.599-3.258l-.252-.432.252.432zM1.147 30.518c-.194-.198-.314-.599-.314-1.279h-1c0 .716.109 1.479.6 1.98l.714-.701zm-1.314-1.279v.116h1v-.116h-1zm0 .116c0 .798.26 1.517.715 1.98l.714-.701c-.231-.236-.428-.681-.428-1.279h-1zm1.571 1.629v-.116h-1v.116h1zm-.5-.616H.79v1h.114v-1zm24.319-12.735l-5.713 3.258.495.869 5.713-3.258-.495-.869zm-5.822 4.043l.114.116.713-.701-.114-.116-.714.701zm.723.198l5.599-3.259-.503-.864-5.599 3.258.503.864zm5.599-3.259c.905-.526 1.391-1.251 1.391-2.061h-1c0 .354-.199.793-.894 1.197l.503.864zm.391-2.061c0 .298-.233.631-.923 1.099l.562.827c.681-.463 1.362-1.061 1.362-1.927h-1z' fill='#454056' mask='url(#B)'/></g><g opacity='.2'><mask id='C' fill='#fff'><use xlink:href='#G'/></mask><use xlink:href='#G' fill='#fff'/><path d='M3.19 2.125l-.252.432h.001l.251-.433zm22.281 12.917l.281-.414-.015-.01-.015-.009-.251.432zm0-.116l.252-.432h-.001l-.251.433zM3.19 2.008l-.252.432h.001l.251-.433zm-.251.549L25.22 15.475l.502-.865L3.441 1.692l-.502.865zM25.19 15.456c.69.468.923.801.923 1.099h1c0-.866-.68-1.464-1.362-1.927l-.562.827zm1.923 1.099c0-.81-.486-1.535-1.391-2.061l-.503.864c.695.405.894.844.894 1.197h1zm-1.392-2.062L3.441 1.576l-.502.865L25.22 15.358l.502-.865zM3.441 1.576C2.56 1.063 1.645.928.915 1.34S-.167 2.61-.167 3.637h1c0-.834.278-1.259.575-1.427s.812-.188 1.53.23l.503-.864zM-.167 3.637v.116h1v-.116h-1zm1 .116c0-.764.272-1.203.584-1.388.306-.182.818-.218 1.521.191l.503-.864c-.897-.522-1.813-.616-2.535-.187C.19 1.931-.167 2.772-.167 3.754h1z' fill='#454056' mask='url(#C)'/></g><defs ><path id='E' d='M19.758 21.326L3.19 30.869c-.914.582-1.714.465-2.285 0l-.114.116.114.116c.571.465 1.371.582 2.285 0l16.568-9.775z'/><path id='F' d='M.79 30.869c-.343-.349-.457-.931-.457-1.629v.116c0 .698.229 1.28.571 1.629v-.116H.79zm24.681-12.801l-5.713 3.259.114.116 5.599-3.258c.8-.466 1.143-1.047 1.143-1.629 0 .582-.457 1.047-1.143 1.513z'/><path id='G' d='M3.19 2.125l22.281 12.917c.686.466 1.143.931 1.143 1.513 0-.582-.343-1.164-1.143-1.629L3.19 2.008C1.59 1.077.333 1.775.333 3.637v.116c0-1.746 1.257-2.56 2.857-1.629z'/></defs>
                    </svg></a></div>
                </div>
              </div><img class="d-none d-xl-block ms-n4" src="{{asset('home/img/job-board/footer-mobile.svg')}}" width="116" alt="Mobile app">
            </div>
          </div>
        </div>
        <!-- Copyright-->
        <p class="fs-sm text-center text-sm-start mb-4"><span class="text-white opacity-50">&copy; All rights reserved. Made by </span><a class="nav-link-dark fw-bold" href="https://www.spondonit.com.bd/" target="_blank" rel="noopener">SPONDON IT</a></p>
      </div>
    </footer>
    <!-- Back to top button--><a class="btn-scroll-top" href="#top" data-scroll><span class="btn-scroll-top-tooltip text-muted fs-sm me-2">Top</span><i class="btn-scroll-top-icon fi-chevron-up">   </i></a>
    <script src="{{asset('home/vendor/bootstrap/dist/js/bootstrap.bundle.min.js')}}"></script>
    <script src="{{asset('home/vendor/simplebar/dist/simplebar.min.js')}}"></script>
    <script src="{{asset('home/vendor/smooth-scroll/dist/smooth-scroll.polyfills.min.js') }}"></script>
    <script src="{{asset('home/vendor/tiny-slider/dist/min/tiny-slider.js') }}"></script>
    <script src="{{asset('home/vendor/parallax-js/dist/parallax.min.js')}}"></script>
    <script src="{{asset('home/vendor/nouislider/dist/nouislider.min.css')}}"></script>
    <!-- Main theme script-->
    @yield('js')
    <script src="{{ asset('home/js/theme.min.js') }}"></script>
  </body>
</html>