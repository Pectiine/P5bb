<?php

namespace App\Form;

use App\Entity\Option;
use App\Entity\Property;
use Symfony\Bridge\Doctrine\Form\Type\EntityType;
use Symfony\Component\Form\AbstractType;
use Symfony\Component\Form\Extension\Core\Type\CheckboxType;
use Symfony\Component\Form\Extension\Core\Type\ChoiceType;
use Symfony\Component\Form\Extension\Core\Type\FileType;
use Symfony\Component\Form\Extension\Core\Type\HiddenType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use Symfony\Component\Form\Extension\Core\Type\MoneyType;
use Symfony\Component\Form\Extension\Core\Type\NumberType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\FormBuilderInterface;
use Symfony\Component\OptionsResolver\OptionsResolver;

class PropertyType extends AbstractType
{
    public function buildForm(FormBuilderInterface $builder, array $options)
    {
        $builder
            ->add('slug', HiddenType::class)
            ->add('title', TextType::class)
            ->add('description', TextareaType::class)
            
            ->add('type', ChoiceType::class, [
                'choices' => $this->getType(),
                'multiple' => true,
            ])

            ->add('price', MoneyType::class)
            
            
            ->add('pictureFiles', FileType::class, [
                'required' => false,
                'multiple' => true,
            ])
            ->add('city', TextType::class)
            ->add('address', TextType::class)
            ->add('postal_code', TextType::class)
            ->add('lat', HiddenType::class)
            ->add('lng', HiddenType::class) 
            ;
    }

    public function getType()
    {
        $choices = Property::TYPE;
        $output = [];

        foreach ($choices as $k => $v) {
            $output[$v] = $k;
        }

        return $output;
    }



    public function configureOptions(OptionsResolver $resolver)
    {
        $resolver->setDefaults([
            'data_class' => Property::class,
            'translation_domain' => 'forms',
        ]);
    }
}
