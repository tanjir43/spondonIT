@extends('layouts.admin')
@section('css')
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.3.0/css/all.min.css">
<link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
<link rel="stylesheet" href="https://cdn.datatables.net/1.13.4/css/jquery.dataTables.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.css">
@endsection

@section('content')
    <div class="row">
        <div class="col-sm-12 col-md-8">
            <x-card variant="primary" outline="true" title="{!! __('msg.author').' '.__('msg.list') !!}">
                <x-slot name="body">
                    <div class="table-responsive">
                        <table class="table table-bordered" id="employee_table" style="width: 100%">
                            <thead>
                                <tr>
                                    <th style="width: 15%">{{ __('msg.name') }}</th>
                                    <th class="text-center" style="width: 35%">{{ __('msg.information') }}</th>
                                    <th class="text-center" style="width:10%">{{ __('msg.status') }}</th>
                                    <th class="text-center" style="width: 20%">{{ __('msg.created_at') }}</th>
                                    <th style="text-align: right;width: 20%">{{ __('msg.action') }}</th>
                                </tr>
                            </thead>
                        </table>
                    </div>
                </x-slot>
            </x-card>
        </div>
   
        <div class="col-sm-12 col-md-4">
            <x-form route="author.save" :update="$record->id ?? null">
                <x-slot name="body">
                    <x-card variant="primary"  title="{{__('msg.employee').' '.__('msg.information')}}">
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
                                        {!! Form::label('name', __('msg.name')) !!} <span class="text-danger">*</span>
                                        {!! Form::text('name',$record->name ?? old('name'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php
                                            $attr = [
                                                'id'        => 'name_l',
                                                'class'     => 'form-control',
                                            ];
                                        ?>
                                        {!! Form::label('name_l', __('msg.name_l')) !!} <span class="text-danger">*</span>
                                        {!! Form::text('name_l',$record->name ?? old('name_l'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <?php 
                                            $attr = [
                                                'id'            => 'email',
                                                'placeholder'   => 'johndoe@gmail.com',
                                                'class'         => 'form-control',
                                            ];
                                        ?>
                                        {!! Form::label('email', __('msg.email')) !!}
                                        {!! Form::email('email',$record->email ?? old('email'),$attr) !!}
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        {!! Form::label('date_of_birth',__('msg.dob')) !!}<span class="text-danger">*</span>
                                        <?php
                                            $attr = [
                                                'class'         =>  'form-control',
                                                'readonly'      =>  'readonly',
                                                'id'            =>  'date_of_birth',
                                            ];
                                        ?>
                                        {!! Form::text('date_of_birth',$record->date_of_birth ?? old('date_of_birth'),$attr) !!}
                                    </div>
                                </div>
                            </div>

                            <div class="form-group">
                                <?php
                                    $attr = [
                                        'id'            =>  'address',
                                    ];
                                ?>
                                {!! Form::label('address', __('msg.address')) !!}
                                {!! Form::textarea('address',$record->address ?? old('address'),$attr) !!}
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
<script src="https://cdn.datatables.net/1.13.4/js/jquery.dataTables.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/flatpickr/4.6.13/flatpickr.min.js"></script>
<script>
    const address = $('#address');
    address.summernote({
        height     : 120,
        placeholder:'Dhaka,Bangladesh',
        toolbar: [
            ['style', ['bold']],
            ['font', [ 'fontname','fontsize']],
        ]
    });
</script>

<script>
    $(function() {
        window.LaravelDataTables=window.LaravelDataTables||{};
        window.LaravelDataTables["dataTableBuilder"]=$("#employee_table").DataTable({
            "serverSide":true,
            "processing":true,
            "ajax":{
                "url" : '{{route('author.datatable')}}',
                "type": "GET"
            },
            "columns":[
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
        $('#date_of_birth').flatpickr({
            enableTime: false
        });
    })
</script>
@endsection