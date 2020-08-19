<?php

namespace App\Repository;

use App\Entity\Picture;
use App\Entity\Property;
use App\Entity\PropertySearch;
use Doctrine\Bundle\DoctrineBundle\Repository\ServiceEntityRepository;
use Doctrine\Common\Persistence\ManagerRegistry;
use Doctrine\ORM\QueryBuilder;
use Knp\Component\Pager\Pagination\PaginationInterface;
use Knp\Component\Pager\PaginatorInterface;

/**
 * @method null|Property find(Property[]$id, $lockMode = null, $lockVersion = null)
 * @method null|Property findOneBy(array $criteria, array $orderBy = null)
 * @method Property[]    findAll()
 * @method Property[]    findBy(array $criteria, array $orderBy = null, $limit = null, $offset = null)
 */
class PropertyRepository extends ServiceEntityRepository
{
    /**
     * @var PaginatorInterface
     */
    private $paginator;

    public function __construct(ManagerRegistry $registry, PaginatorInterface $paginator)
    {
        parent::__construct($registry, Property::class);
        $this->paginator = $paginator;
    }

    public function paginateAllVisible(PropertySearch $search, int $page): PaginationInterface
    {
        $query = $this->findVisibleQuery();

        if ($search->getType()) {
            foreach ($search->getType() as $key => $value) {
                $query = $query
                    ->andWhere('p.type LIKE :type')
                    ->setParameter('type', '%'.$value.'%')
            ;
            }
        }

        if ($search->getMaxPrice()) {
            $query = $query
                ->andWhere('p.price <= :maxprice')
                ->setParameter('maxprice', $search->getMaxPrice())
            ;
        }

    

        if ($search->getLat() && $search->getLng() && $search->getDistance()) {
            $query = $query
                ->andWhere('(6353 * 2 * ASIN(SQRT( POWER(SIN((p.lat - :lat) *  pi()/180 / 2), 2) +COS(p.lat * pi()/180) * COS(:lat * pi()/180) * POWER(SIN((p.lng - :lng) * pi()/180 / 2), 2) ))) <= :distance')
                ->setParameter('lng', $search->getLng())
                ->setParameter('lat', $search->getLat())
                ->setParameter('distance', $search->getDistance())
            ;
        }

        if ($search->getOptions()->count() > 0) {
            $k = 0;
            foreach ($search->getOptions() as $option) {
                ++$k;
                $query = $query
                    ->andWhere(":option{$k} MEMBER OF p.options")
                    ->setParameter("option{$k}", $option)
                ;
            }
        }

        $properties = $this->paginator->paginate(
            $query->getQuery(),
            $page,
            12
        );

        $this->hydratePicture($properties);

        return $properties;
    }

    /**
     * @return Property[]
     */
    public function findLatest(): array
    {
        $properties = $this->findVisibleQuery()
            ->setMaxResults(4)
            ->getQuery()
            ->getResult()
        ;
        $this->hydratePicture($properties);

        return $properties;
    }

    private function findVisibleQuery(): QueryBuilder
    {
        return $this->createQueryBuilder('p')
           
        ;
    }

    private function hydratePicture($properties)
    {
        if (method_exists($properties, 'getItems')) {
            $properties = $properties->getItems();
        }
        $pictures = $this->getEntityManager()->getRepository(Picture::class)->findForProperties($properties);
        foreach ($properties as $property) {
            /** @var Property $property */
            if ($pictures->containsKey($property->getId())) {
                $property->setPicture($pictures->get($property->getId()));
            }
        }
    }
}
