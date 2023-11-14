<?php

namespace App\Listeners;

use App\Events\BorrowRequestStatusChanged;
use Illuminate\Contracts\Queue\ShouldQueue;
use Illuminate\Queue\InteractsWithQueue;
use Illuminate\Support\Facades\Mail;
use App\Mail\BorrowRequestStatusChanged as BorrowRequestStatusChangedMail;


class SendBorrowRequestStatusEmail
{
    use InteractsWithQueue;
    /**
     * Create the event listener.
     */
    public function __construct()
    {
        //
    }

    /**
     * Handle the event.
     */
    public function handle(BorrowRequestStatusChanged $event): void
    {
        $borrowBook = $event->borrowBook;
        $user       = $borrowBook->user;

        $statusText = $borrowBook->status == 1 ? 'Approved' : 'Rejected'; 
        
        Mail::to($user->email)->send(new BorrowRequestStatusChangedMail($user, $statusText));

    }
}
