<!DOCTYPE html>
<html lang="en" class="light">
    <!-- BEGIN: Head -->
      <!-- BEGIN: Head -->
      <head>
        <meta charset="utf-8">
        <link href="dist/images/logo-pln.png" rel="shortcut icon">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta name="author" content="ahmad rifai">
        <meta name="csrf-token" content="{{ csrf_token() }}">
        <title>Login | PLTU Nagan Raya</title>
        <!-- BEGIN: CSS Assets-->
        <link rel="stylesheet" href="dist/css/app.css" />
        <!-- END: CSS Assets-->
    </head>
    <!-- END: Head -->
    <!-- END: Head -->
    <body class="login">
        <div class="container sm:px-10">
            <div class="block xl:grid grid-cols-2 gap-4">
                <!-- BEGIN: Login Info -->
                <div class="hidden xl:flex flex-col min-h-screen">
                    <a href="" class="-intro-x flex items-center pt-5">
                        <img alt="Icewall Tailwind HTML Admin Template" class="w-6" src="dist/images/logo-pln.png">
                        <span class="text-white text-lg ml-3"> PLTU <span class="font-medium">Nagan Raya</span> </span>
                    </a>
                    <div class="my-auto">
                        <img alt="Icewall Tailwind HTML Admin Template" class="-intro-x w-1/2 -mt-16" src="dist/images/illustration.svg">
                        <div class="-intro-x text-white font-medium text-2xl leading-tight mt-10">
                            Work Management System
                            <br>
                            PLTU Nagan Raya
                        </div>
                        <div class="-intro-x mt-5 text-lg text-white text-opacity-70 dark:text-gray-500">PT. PLN (Persero)</div>
                    </div>
                </div>
                <!-- END: Login Info -->

                <!-- BEGIN: Login Form -->
                
                <div class="h-screen xl:h-auto flex py-5 xl:py-0 my-10 xl:my-0">
                    <div class="my-auto mx-auto xl:ml-20 bg-white dark:bg-dark-1 xl:bg-transparent px-5 sm:px-8 py-8 xl:p-0 rounded-md shadow-md xl:shadow-none w-full sm:w-3/4 lg:w-2/4 xl:w-auto">
                        <h2 class="intro-x font-bold text-2xl xl:text-3xl text-center xl:text-left">
                            Sign In
                        </h2>
                        <div class="intro-x mt-2 text-gray-500 xl:hidden text-center">PLTU Nagan Work Management System</div><br>
                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif

                        @if(session('success'))
                            <div class="alert alert-success">
                                {{ session('success') }}
                            </div>
                        @endif
                       
                        <form method="post" action="{{ route('login.auth') }}">
                        @csrf

                        <div class="intro-x mt-8">
                            <input type="text" id="email" name="email" class="intro-x login__input form-control py-3 px-4 border-gray-300 block" placeholder="Email">
                            <input type="password" id="password" name="password" class="intro-x login__input form-control py-3 px-4 border-gray-300 block mt-4" placeholder="Password">
                        </div>
                        <div class="intro-x flex text-gray-700 dark:text-gray-600 text-xs sm:text-sm mt-4">
                            <div class="flex items-center mr-auto">
                                <input id="remember-me" type="checkbox" class="form-check-input border mr-2">
                                <label class="cursor-pointer select-none" for="remember-me">Remember me</label>
                            </div>
                            <a href="">Forgot Password?</a> 
                        </div>
                        <div class="intro-x mt-5 xl:mt-8 text-center xl:text-left">
                            <button class="btn btn-primary py-3 px-4 w-full xl:w-32 xl:mr-3 align-top">Login</button>
                        </div>
                        </form>
                    </div>
                </div>
                
                <!-- END: Login Form -->

            </div>
        </div>
      
        <!-- BEGIN: JS Assets-->
        <script src="dist/js/app.js"></script>
        <script src="dist/js/custome.js"></script>
        <!-- END: JS Assets-->
    </body>
</html>