<?php

use Illuminate\Database\Seeder;
use App\Models\UserModel;
use Ramsey\Uuid\Uuid;
use Faker\Factory as Faker;

class UserModelSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $faker = Faker::create('id_ID');
        for ($i = 0; $i < 25; $i++) {
            UserModel::create([
                'id' => Uuid::uuid4()->toString(),
                'name' => $faker->Name,
                'email' => $faker->Email,
                'password' => Hash::make('SalahPassword'),
                'created_by' => 'faker@mailinator.com',
                'updated_by' => 'faker@mailinator.com',
            ]);
        }
    }
}
