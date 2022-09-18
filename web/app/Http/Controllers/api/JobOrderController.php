<?php

namespace App\Http\Controllers\api;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use Faker\Factory as Faker;
use Ramsey\Uuid\Uuid;
use App\Models\JobModel;
use Illuminate\Support\Facades\DB;

class JobOrderController extends Controller
{
    public function list(Request $request){
        $response['status'] = 'success';
        $limit = $request->limit?$request->limit:10;
        try {

            $keyword = $request->keyword?$request->keyword:'';

            $data = JobModel::where('deleted_at', null);
            if( $keyword!=''){
                $data = $data->where(function($query) use ($keyword){
                    $query->where('workorder_number', 'like', '%'.$keyword.'%')
                    ->orWhere('workorder_name', 'like', '%'.$keyword.'%')
                    ->orWhere('workorder_description', 'like', '%'.$keyword.'%');
                });
            }

            if($request->status){
                $data = $data->where('status', $request->status);
            }

            if($request->sort){
                $data = $data->orderBy($request->sort, $request->sort_type);
            }else{
                $data = $data->orderBy('updated_at', 'desc');
                
            }

            $data = $data->orderBy('workorder_number', 'asc')->paginate($limit);

            foreach($data->getCollection() as $dt){
                $dt['info'] = [$dt->status];
                $response['data'][] = $dt;
            }

            $response['pagination'] = [
                'total' => $data->total(),
                'current_page' => $data->currentPage(),
                'per_page' => $data->perPage(),
                'last_page' => $data->lastPage(),
                'from' => $data->firstItem(),
                'to' => $data->lastItem()
            ];

            return response()->json($response, 200);

        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'error',
                'message' => $th->getMessage(),
            ], 401);
        }
    }

    public function recent(Request $request){
        $response['status'] = 'success';
        try {
            $data = JobModel::where('deleted_at', null)
            ->whereNotIn('status',['onprogress','open'])
            ->orderBy('updated_at', 'desc')
            ->limit(10)
            ->get();

            $response['data'] = $data;

            return response()->json($response, 200);
            
        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'error',
                'message' => $th->getMessage(),
            ], 401);
        }
    }

    public function current(Request $request){
        $response['status'] = 'success';
        try {
            $data = JobModel::where('deleted_at', null)
            ->whereIn('status',['onprogress','onhold'])
            ->orderBy('updated_at', 'desc')
            ->get();

            $response['data'] = $data;

            return response()->json($response, 200);
            
        } catch (\Throwable $th) {
            return response()->json([
                'status' => 'error',
                'message' => $th->getMessage(),
            ], 401);
        }
        
    }

    public function detail($id){
        $response = [
            'status' => 'success',
        ];
        $faker = Faker::create('id_ID');
        $info = [];
        for ($i=0; $i < 2; $i++) { 
            $info[] = $faker->randomElement(['maintenance','perbaikan','pemeliharaan', 'pemasangan']);
        }
        $executor = [];
        for($i=0; $i<5; $i++){
            $executor[] = [
                'photo' => 'https://cdn-icons-png.flaticon.com/512/3135/3135715.png',
                'name' => $faker->name,
            ];
        }

        $response['data'] = [
            'id' => $id,
            'workorder_name' => 'Work Order '.$id,
            'workorder_number' => 'JO-001',
            'workorder_description' => $faker->text(200),
            'info' => $info,
            'workorder_executor' => $executor,
            'status' => $faker->randomElement(['done','cancel']),
        ];
        

        return response()->json($response, 200);
    }

    public function updateStatus($id, $status){
       
        $job = JobModel::find($id);
            if($job){
                $job->status = $status;
                $job->save();
                return response()->json([
                    'status' => 'success',
                    'message' => 'Status berhasil diubah',
                ], 200);
            }

    }

    public function tabulator(Request $request){
        $response = [
            'status' => 'success',
            'last_page' => 1,
        ];

        $jobs = JobModel::where('deleted_at', null)
        ->orderBy('updated_at', 'desc')
        ->paginate($request->size);

        foreach($jobs->getCollection() as $dt){
            $response['data'][] = $dt;
        }


        $response['last_page'] = $jobs->lastPage();
        $response['total'] = $jobs->total();
        $response['current_page'] = $jobs->currentPage();
        $response['per_page'] = $jobs->perPage();
        $response['from'] = $jobs->firstItem();
        $response['to'] = $jobs->lastItem();

        return response()->json($response, 200);
    }
}
