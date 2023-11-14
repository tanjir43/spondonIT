<div class="row">
    <div class="col-md-12">
        <table class="table">
            <thead>
                <tr>
                    <th>#</th>
                    <th>Book Name</th>
                    <th>Previus Quantity</th>
                    <th>New Quantity</th>
                    <th>Borrow Date</th>
                    
                </tr>
            </thead>
            <tbody>
                @forelse($historyData as $key => $data)
                    <tr>
                        <td>{{ $loop->iteration }}</td>
                        <td>{{ $data->borrow_book->book->name ?? '' }}</td>
                        <td>{{ $data->prev_quantity  ?? 'N/A'}}</td>
                        <td>{{ $data->new_quantity }}</td>
                        <td>{{ $data->created_at }}</td>
                    </tr>

                    @empty
                    <tr class="text-center">
                        <td colspan="5">
                            <div class="alert alert-danger" role="alert">
                                No Book Borrowed History Found!
                            </div>
                        </td>
                    </tr>
                @endforelse
            </tbody>
        </table>
    </div>
</div>