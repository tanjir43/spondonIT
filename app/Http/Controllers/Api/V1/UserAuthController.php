<?php

namespace App\Http\Controllers\Api\V1;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use Laravel\Sanctum\HasApiTokens;

class UserAuthController extends Controller
{
    use HasApiTokens;

    public function login(Request $request)
    {
        $validator = Validator::make($request->all(), [
            'email'    => 'required',
            'password' => 'required',
        ]);

        if ($validator->fails()) {
            return response()->json(['errors' => $validator->errors()->all()], 403);
        }

        $data = [
            'email'    => $request->email,
            'password' => $request->password,
        ];

        if (auth()->attempt($data)) {
            $token = $request->user()->createToken('RestaurantCustomerAuth')->plainTextToken;
            return response()->json(['token' => $token], 200);
        } else {
            $errors = [
                ['code' => 'auth-001', 'message' => trans('custom.login_failed')],
            ];
            return response()->json(['errors' => $errors], 401);
        }
    }
}
