<?php

use Illuminate\Database\Seeder;
use Ramsey\Uuid\Uuid;
use Faker\Factory as Faker;
use App\Models\JobModel;

class JobWorkOrderSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        //
        $faker = Faker::create('id_ID');
        for($i=0; $i<50; $i++){
            JobModel::create([
                'id' => Uuid::uuid4()->toString(),
                'workorder_number' => sprintf('WO-%06d', $faker->unique()->randomNumber(6, true)),
                'workorder_name' => sprintf('Work Order %s %s', sprintf('WO-%06d', $faker->unique()->randomNumber(6, true)), $faker->randomElement(['perbaikan','pemeliharaan','penggantian', 'perawatan'])),
                'workorder_description' => $faker->text,
                'status' => $faker->randomElement(['done','cancel','onhold', 'open', 'onprogress']),
                'created_by' => 'faker@mailinator.com',
                'updated_by' => 'faker@mailinator.com',
            ]);
        }
    }
}
