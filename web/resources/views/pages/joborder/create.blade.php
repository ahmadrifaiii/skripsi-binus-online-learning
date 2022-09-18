@extends('layouts.main')

@section('title')
    User Management
@endsection


@section('content')
<div class="content">
<div class="intro-y flex items-center mt-8">
        <h2 class="text-lg font-medium mr-auto">Form Layout</h2>
    </div>
    <form method="POST" action="{{ route('jobs.store') }}" >
        @csrf
    <div class="grid grid-cols-12 gap-6 mt-5">
        <div class="intro-y col-span-12 lg:col-span-6">
            <!-- BEGIN: Form Layout -->
            <div class="intro-y box p-5">
                <div>
                    <label for="crud-form-1" class="form-label">Workorder Number</label>
                    <input id="crud-form-1" type="text" class="form-control w-full" name="workorder_number" placeholder="Nomor Job Order">
                    <em class="text-default sm-1"><b>Nomor Job Order</b> akan tergenerate apabila tidak diisi.</em>
                </div>

                <div>
                    <label for="crud-form-1" class="form-label">Workorder Name</label>
                    <input id="crud-form-1" type="text" name="workorder_name" class="form-control w-full" name="workorder_number" placeholder="Nomor Job Order">
                </div>
            
                <div class="mt-3">
                    <label>Description</label>
                    <div class="mt-2">
                        <div class="editor">
                            <textarea rows="5" cols="55" placeholder="Description" name="workorder_description"></textarea>
                        </div>
                    </div>
                </div>

                <div class="mt-3">
                    <label for="crud-form-2" class="form-label">Pelaksana Lapangan</label>
                    <select name="pelaksana[]" data-placeholder="Select your Pelaksana Lapangan" class="tom-select w-full" id="crud-form-2" multiple>
                        @foreach($getUser as $user)
                            <option value="{{ $user->id }}">{{ $user->name }}</option>
                        @endforeach
                    </select>
                </div>

                <div class="text-right mt-5">
                    <button type="button" class="btn btn-outline-secondary w-24 mr-1">Cancel</button>
                    <button type="submit" class="btn btn-primary w-24">Save</button>
                </div>
            </div>
            <!-- END: Form Layout -->
        </div>
        </form>


        <div class="intro-y col-span-12 lg:col-span-6">
            <!-- BEGIN: Single File Upload -->
            <div class="intro-y box p-5">
                <div>
                    <label for="crud-form-1" class="form-label">Dokument Pendukung</label>
                </div>
                <div id="single-file-upload" class="p-5">
                    <div class="preview">
                        <form data-single="true" action="/file-upload" class="dropzone">
                            <div class="fallback">
                                <input name="file" type="file" />
                            </div>
                            <div class="dz-message" data-dz-message>
                                <div class="text-lg font-medium">Drop files here or click to upload.</div>
                                <div class="text-slate-500">
                                    This is just a demo dropzone. Selected files are <span class="font-medium">not</span> actually uploaded.
                                </div>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
            <!-- END: Single File Upload -->
            
        </div>
    </div>

    
</div>
@endsection
@section('script')
    <script src="{{ asset('dist/js/ckeditor-classic.js') }}"></script>
@endsection
