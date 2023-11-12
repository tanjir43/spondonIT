<?php
namespace App\Repositories;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;

class ValidationRepository
{

    public function isValidFile(Request $request, $fileName = null)
    {
        if(!empty($fileName))  {
            return $request->validate([
                $fileName   => 'required|image|max:2048|mimes:jpg,jpeg,png,pdf,docx,doc,xlsx,xlx,pptx,ppt'
            ]);
        }
        return $request->validate([
            'image'      => 'required|image|max:2048|mimes:jpg,jpeg,png,pdf,docx,doc,xlsx,xlx,pptx,ppt'
        ]);
    }

    public function isValidUserForm(Request $request)
    {
        return $request->validate([
            'name'          => 'required|max:190',
            'email'         => 'required|email|unique:users,email|unique:temp_users,email',
            'password'      => 'required|min:8|max:190|confirmed',
            'phone'         => 'min:9|max:18|unique:temp_users,phone|unique:temp_users,phone',
        ]);
    }

    public function isValidAuthor(Request $request, $id)
    {
        if(!empty($id)) {
            return Validator::make($request->all(), [
                'name'              => 'required|max:190',
                'name_l'            => 'nullable|max:190',
                'address'           => 'nullable|max:3000',
                'email'             => 'nullable|max:150|unique:authors,email,'.$id,
                'date_of_birth'     => 'nullable',
            ]);
        }
        return Validator::make($request->all(), [
            'name'              => 'required|max:190',
            'name_l'            => 'nullable|max:190',
            'address'           => 'nullable|max:3000',
            'email'             => 'nullable|max:150|unique:authors,email',
            'date_of_birth'     => 'nullable',
        ]);
    }

    public function isValidBook(Request $request){
        $id = $request->id;
        if ($id != 0) {
            return Validator::make($request->all(), [
                'name'                  => 'required|max:250|unique:books,name,' . $id,
                'publish_year'          => 'nullable',
                'book_code'             => 'nullable|max:190|unique:books,book_code,' . $id,
                'language'              => 'nullable|max:190',
                'isbn'                  => 'nullable|max:190|unique:books,isbn,' . $id,
                'description'           => 'nullable|max:65500',
                'regular_price'         => 'nullable|numeric|between:1,999999999.99',
                'offer_price'           => 'nullable|numeric|between:1,999999999.99',
                'quantity'              => 'nullable|numeric|between:1,999999999.99',
                'print_version'         => 'nullable|max:190',
                'cover_binding'         => 'nullable|max:190',
                'book_condition'        => 'nullable|max:190',
                'country'               => 'nullable|max:190',
                'sku'                   => 'nullable|max:190|unique:books,sku,' . $id,
                'edition'               => 'nullable|max:190',


            ]);
        }
        return Validator::make($request->all(), [
            'name'          => 'required|max:250|unique:departments,name',
            'name_l'        => 'nullable|max:250|unique:departments,name_l'
        ]);
    }

    public function isValidDesignation(Request $request){
        $id = $request->id;
        if ($id != 0) {
            return Validator::make($request->all(), [
                'name'          => 'required|max:250|unique:designations,name,' . $id,
                'name_l'        => 'nullable|max:250|unique:designations,name_l,' . $id
            ]);
        }
        return Validator::make($request->all(), [
            'name'          => 'required|max:250|unique:designations,name',
            'name_l'        => 'nullable|max:250|unique:designations,name_l'
        ]);
    }

    public function isValidAuto(Request $request, $id)
    {
        if(!empty($id)) {
            return Validator::make($request->all(), [
                'name'              => 'required|max:250',
                'name_l'            => 'nullable|max:250',
                #'date_of_birth'     => 'required',
                'id_card'           => 'nullable|max:190|unique:employees,id_card,'.$id,
                'nid'               => 'required|unique:employees,nid|unique:employees,nid'.$id,

                'employee_id'       => 'required|max:190|unique:employees,employee_id,'.$id,
                'joining_date'      => 'required',
                'department'        => 'required|exists:departments,id',
                'designation'       => 'required|exists:designations,id',

                'basic_salary'      =>  'required|numeric|between:1,999999999.99',
                'opening_balance'   =>  'required|numeric|between:-999999999.99,999999999.99',

                'phone'             => 'nullable|max:190|unique:employees,phone,'.$id,
                'phone_alt'         => 'nullable|max:190',
                'email'             => 'nullable|max:190|email|unique:employees,email,'.$id,
                'email_office'      => 'nullable|max:190',
                'address'           => 'nullable|max:65500',
            ]);
        }
        return Validator::make($request->all(), [
            'name'              => 'required|max:250',
            'name_l'            => 'nullable|max:250',
            #'date_of_birth'     => 'required',
            'id_card'           => 'nullable|max:190|unique:employees,id_card',
            'nid'               => 'required|unique:employees,nid|unique:employees,nid',

            'employee_id'       => 'required|max:190|unique:employees,employee_id',
            'joining_date'      => 'required',
            'department'        => 'required|exists:departments,id',
            'designation'       => 'required|exists:designations,id',

            'basic_salary'      =>  'required|numeric|between:1,999999999.99',

            'opening_balance'   =>  'required|numeric|between:-999999999.99,999999999.99',

            'phone'             => 'required|max:190|unique:employees,phone',
            'phone_alt'         => 'nullable|max:190',
            'email'             => 'nullable|max:190|email|unique:employees,email',
            'email_office'      => 'nullable|max:190',
            'address'           => 'nullable|max:65500',
        ]);
    }

    public function isValidEmployeeHistory(Request $request)
    {
        return Validator::make($request->all(), [
            'employee_id'       =>  'required|max:190|exists:employees,id',

            'is_fired'          =>  'required|in:0,1',
            'is_resigned'       =>  'required|in:0,1',
            'is_promoted'       =>  'required|in:0,1',
            
            'department'        => (!$request->is_fired && !$request->is_resigned) ? 'required|exists:departments,id' : 'nullable',
            'designation'       => (!$request->is_fired && !$request->is_resigned) ? 'required|exists:designations,id' : 'nullable',

            'basic_salary'      =>  ((!$request->is_fired && !$request->is_resigned) &&
                                    ($request->is_promoted)) 
                                    ? 'required|numeric|between:1,999999999.99' : 'nullable',

            'joining_date'      => ((!$request->is_fired && !$request->is_resigned) &&
                                    ($request->is_promoted)) 
                                    ? 'required' : 'nullable' ,
            'last_working_date' => 'required',
            'comment'           => 'nullable|max:65500',
        ]);
    }
}