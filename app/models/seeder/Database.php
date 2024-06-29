<?php

namespace app\models\seeder;

class Database
{
    public static function getSeeders()
    {
        return [
            StatusSeeder::class,
            EstadoSeeder::class,
        ];
    }
}