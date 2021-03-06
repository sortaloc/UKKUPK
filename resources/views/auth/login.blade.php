@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">

        <div class="col-md-12">
            <div class="card">
                <div class="card-header">{{ __('Login') }}</div>

                <div class="card-body">

                <div class="row">

                    <div class="col-md-2">
                        <center>
                        <img src="{{asset('image/smkn11.jpeg')}}" alt="logo_smkn11" height="145">
                        </center>
                    </div>
                    <div class="col-md-8 my-3">
                        <form method="POST" action="{{ route('login') }}">
                            @csrf

                            <!-- <div class="form-group row">
                                <label for="email" class="col-sm-4 col-form-label text-md-right">{{ __('E-Mail Address') }}</label>

                                <div class="col-md-6">
                                    <input id="email" type="email" class="form-control{{ $errors->has('email') ? ' is-invalid' : '' }}" name="email" value="{{ old('email') }}" required autofocus>

                                    @if ($errors->has('email'))
                                        <span class="invalid-feedback">
                                            <strong>{{ $errors->first('email') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div> -->

                            <div class="form-group row">
                                <label for="username" class="col-sm-4 col-form-label text-md-right">{{ __('Username') }}</label>

                                <div class="col-md-6">
                                    <input id="username" type="username" class="form-control{{ $errors->has('username') ? ' is-invalid' : '' }}" name="username" value="{{ old('username') }}" required autofocus>

                                    @if ($errors->has('username'))
                                        <span class="invalid-feedback">
                                            <strong>{{ $errors->first('username') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            <div class="form-group row">
                                <label for="password" class="col-md-4 col-form-label text-md-right">{{ __('Password') }}</label>

                                <div class="col-md-6">
                                    <input id="password" type="password" class="form-control{{ $errors->has('password') ? ' is-invalid' : '' }}" name="password" required>

                                    @if ($errors->has('password'))
                                        <span class="invalid-feedback">
                                            <strong>{{ $errors->first('password') }}</strong>
                                        </span>
                                    @endif
                                </div>
                            </div>

                            {{-- <div class="form-group row">
                                <div class="col-md-6 offset-md-4">
                                    <div class="checkbox">
                                        <label>
                                            <input type="checkbox" name="remember" {{ old('remember') ? 'checked' : '' }}> {{ __('Remember Me') }}
                                        </label>
                                    </div>
                                </div>
                            </div> --}}

                            <div class="form-group row mb-0">
                                <div class="col-md-8 offset-md-4">
                                    <button type="submit" class="btn btn-primary">
                                        {{ __('Login') }}
                                    </button>

                                    {{-- <a class="btn btn-link" href="{{ route('password.request') }}">
                                        {{ __('Forgot Your Password?') }}
                                    </a> --}}
                                </div>
                            </div>
                        </form>
                    </div>
                    <div class="col-md-2">
                        <center><img src="{{asset('image/jabar.png')}}" alt="logo_jabar" height="145"></center>
                    </div>

                </div>

                {{-- End row --}}

                </div>
            </div>
        </div>

        @if(App\User::first() == null)
        <div class="col-md-12 mt-3">
            <div class="card card-body">
                
                <h4>Note</h4>
                <p>Sepertinya belum ada akun administrator.</p>
                <p>Silahkan buat manual dengan password : <code>$2y$10$Uqlzr3UFIN.W5FcW7Yjc5O7wyKQE4fcXx86w1Qa05UeL9XIIXKzvK</code></p>

            </div>
        </div>
        @endif
    </div>
</div>
@endsection
