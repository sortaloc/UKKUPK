@extends('layouts.app')

@section('content')
<form action="{{route('admin.kelas.store')}}" method="POST">
@csrf

<div class="container-fluid">

<div class="row justify-content-center">
        <div class="col-md-9">
            <div class="card card-body">
                <h3 class="card-title">Kelas</h3>
                <span class="card-subtitle">Tambah baru</span>
                <hr>

                <div class="form-group">
                    <label for="nama_kelas">Nama kelas</label>
                    <input type="text" name="nama_kelas" class="form-control">
                </div>

                <div class="form-group">
                    <label for="id_jurusan">Jurusan</label>
                    <select class="form-control" name="id_jurusan">
                        @foreach($jurusan as $jurusanKelas)
                        <option value="{{$jurusanKelas->id_jurusan}}">{{ $jurusanKelas->nama_jurusan }}</option>
                        @endforeach
                    </select>

                </div>

                <button class="btn btn-primary">Save</button>

                <br>

                <a href="{{ url()->previous() }}"><span class="fa fa-arrow-left"></span> Kembali</a>
            </div>
        </div>
    </div>

</div>

</form>
@endsection
