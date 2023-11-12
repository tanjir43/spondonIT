@extends('layouts.admin')
@section('css')
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css">
    <link rel="stylesheet" href="{{asset('dropify-master/dist/css/dropify.min.css')}}">
@endsection

<?php 
    $author_list[] = __('msg.select').' '.__('msg.author');
    foreach($authors as $author){
        $author_list[$author->id] = ConvertToLang($author);
    }
?>

@section('content')
    <div class="row">
        <div class="col-sm-12 col-md-8">
            <x-card variant="primary" outline="true" title="{!! __('msg.book').' '.__('msg.list') !!}">
                <x-slot name="body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="book_table" style="width: 100%">
                            <thead>
                                <tr>
                                    <th style="width: 15%">{{ __('msg.image') }}</th>
                                    <th style="width: 15%">{{ __('msg.name') }}</th>
                                    <th class="text-center" style="width: 30%">{{ __('msg.information') }}</th>
                                    <th class="text-center" style="width:10%">{{ __('msg.status') }}</th>
                                    <th class="text-center" style="width: 15%">{{ __('msg.created_at') }}</th>
                                    <th style="text-align: right;width: 15%">{{ __('msg.action') }}</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </x-slot>
            </x-card>
        </div>
   
        <div class="col-sm-12 col-md-4">
            <x-form route="books.save" :update="$record->id ?? null" upload="true">
                <x-slot name="body">
                    <x-card variant="primary"  title="{{__('msg.book').' '.__('msg.information')}}">
                        <x-slot name="body">
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'name',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('name', __('msg.name')) !!}
                                        {!! Form::text('name',$record->name ?? old('name'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('publish_year',__('msg.publish_year')) !!}<span class="text-danger">*</span>
                                        <?php
                                            $attr = [
                                                'class'         =>  'form-control',
                                                'readonly'      =>  'readonly',
                                                'id'            =>  'publish_year',
                                            ];
                                        ?>
                                        {!! Form::text('publish_year',$record->publish_year ?? old('publish_year'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'language',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('language', __('msg.language')) !!}
                                        {!! Form::text('language',$record->language ?? old('language'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'isbn',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('isbn', __('msg.isbn')) !!}
                                        {!! Form::text('isbn',$record->isbn ?? old('isbn'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'regular_price',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('regular_price', __('msg.regular_price')) !!}
                                        {!! Form::text('regular_price',$record->regular_price ?? old('regular_price'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'offer_price',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('offer_price', __('msg.offer_price')) !!}
                                        {!! Form::text('offer_price',$record->offer_price ?? old('offer_price'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'quantity',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('quantity', __('msg.quantity')) !!}
                                        {!! Form::text('quantity',$record->quantity ?? old('quantity'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'print_version',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('print_version', __('msg.print_version')) !!}
                                        {!! Form::text('print_version',$record->print_version ?? old('print_version'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'cover_binding',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('cover_binding', __('msg.cover_binding')) !!}
                                        {!! Form::text('cover_binding',$record->cover_binding ?? old('cover_binding'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'book_condition',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('book_condition', __('msg.book_condition')) !!}
                                        {!! Form::text('book_condition',$record->book_condition ?? old('book_condition'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'country',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('country', __('msg.country')) !!}
                                        {!! Form::text('country',$record->country ?? old('country'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'sku',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('sku', __('msg.sku')) !!}
                                        {!! Form::text('sku',$record->sku ?? old('sku'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'edition',
                                                'class'     => 'form-control',
                                                'required'  => 'required',
                                            ];
                                        ?>
                                        {!! Form::label('edition', __('msg.edition')) !!}
                                        {!! Form::text('edition',$record->edition ?? old('edition'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'class'         =>  'form-control',
                                                'id'            =>  'author',
                                                'required'      =>  'required',
                                            ];
                                        ?>
                                        {!! Form::label('author', __('msg.author')) !!} <span class="text-danger">*</span>
                                        {!! Form::select('author',$author_list,$record->author_id ?? old('author_id'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <?php
                                    $attr = [
                                        'id'            =>  'description',
                                    ];
                                ?>
                                {!! Form::label('description', __('msg.description')) !!}
                                {!! Form::textarea('description',$record->description ?? old('description'),$attr) !!}
                            </div>

                            
                            <div class="form-group">
                                {!! Form::label('image', __('msg.image')) !!}
                              
                                <?php
                                    $attr = [
                                        'id'    => 'image',
                                        'class' => 'form-control dropify',
                                        'data-default-file' => !empty($record->media) ? asset($record->media->attachment) : null,
                                    ];
                                ?>
                                {!! Form::file('image', $attr) !!}
                            </div>
                        
                            <x-slot name="footer">
                                {!! Form::submit(__('msg.save'),["class"=>"btn btn-success float-right"]) !!}
                            </x-slot>
                        </x-slot>
                    </x-card>
                </x-slot>
            </x-form>
        </div>
    </div>
@endsection


@section('js')
 <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
 <script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js"></script>
 <script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="{{asset('dropify-master/dropify.min.js')}}"></script>
<script>
    const address = $('#description');
    address.summernote({
        height     : 120,
        placeholder:'Description',
        toolbar: [
            ['style', ['bold']],
            ['font', [ 'fontname','fontsize']],
        ]
    });
</script>

<script>
    $(function() {
        window.LaravelDataTables=window.LaravelDataTables||{};
        window.LaravelDataTables["dataTableBuilder"]=$("#book_table").DataTable({
            "serverSide":true,
            "processing":true,
            "ajax":{
                "url" : '{{route('books.datatable')}}',
                "type": "GET"
            },
            "columns":[
                {data: 'image',"orderable":false,"searchable":false},
                {data: 'name',"orderable":true,"searchable":true},
                {data: 'information',"orderable":false,"searchable":false},
                {data: 'deleted_at',"orderable":false,"searchable":false},
                {data: 'created_at',"orderable":false,"searchable":false},
                {data: 'action', name: 'action', orderable: false, searchable: false},
            ]
        });
    });
</script>

<script>
    $(document).ready(function(){
        $('#publish_year').flatpickr({
            enableTime: false
        });
        $('.dropify').dropify({
            messages: {
                default: 'Drop Image',
            } 
        });
    })
</script>
@endsection