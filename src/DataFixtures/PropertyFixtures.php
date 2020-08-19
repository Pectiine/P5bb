<?php

namespace App\DataFixtures;

use App\Entity\Property;
use Doctrine\Bundle\FixturesBundle\Fixture;
use Doctrine\Persistence\ObjectManager;
use Faker\Factory;

class PropertyFixtures extends Fixture
{
    public function load(ObjectManager $manager)
    {
        $faker = Factory::create('fr_FR');

        for ($i = 0; $i < 100; ++$i) {
            $property = new Property();
            $property->setTitle($faker->words(3, true))
                ->setDescription($faker->sentences(3, true))
                
                ->setType([0])
                ->setPrice($faker->numberBetween(100000, 1000000))
                ->setCity($faker->city)
                ->setAddress($faker->address)
                ->setPostalCode($faker->postcode)
                ->setLat(50.7206504)
                ->setLng(2.5315257)
                
                ->setUpdatedAt($faker->dateTime())
            ;

            $manager->persist($property);
        }

        $manager->flush();
    }
}
