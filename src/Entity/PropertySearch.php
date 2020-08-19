<?php

namespace App\Entity;

use Doctrine\Common\Collections\ArrayCollection;
use Symfony\component\Validator\Constraints as Assert;

class PropertySearch
{
 
    /**
     * maxPrice.
     *
     * @var null|int
     */
    private $maxPrice;

    /**
     * city.
     *
     * @var null|string
     */
    private $city;

    /**
     * @var null|float
     */
    private $lat;

    /**
     * @var null|float
     */
    private $lng;

    /**
     * @var null|int
     */
    private $distance;

    /**
     * @var null|string
     */
    private $address;

    /**
     * postal_code.
     *
     * @var null|string
     * @Assert\Regex("/^[0-9]{5}$/")
     */
    private $postal_code;

    /**
     * @var ArrayCollection
     */
    private $options;

    /**
     * @var array
     */
    private $type;

    /**
     * __construct.
     */
    public function __construct()
    {
        $this->options = new ArrayCollection();
    }

    /**
     * setPostalCode.
     *
     * @param mixed $postal_code
     */
    public function setPostalCode(?string $postal_code): PropertySearch
    {
        $this->postal_code = $postal_code;

        return $this;
    }

    /**
     * getPostalCode.
     *
     * @return string
     */
    public function getPostalCode(): ?string
    {
        return $this->postal_code;
    }

    /**
     * setCity.
     *
     * @param mixed $city
     */
    public function setCity(?String $city): PropertySearch
    {
        $this->city = $city;

        return $this;
    }

    /**
     * getCity.
     *
     * @return string
     */
    public function getCity(): ?string
    {
        return $this->city;
    }

    /**
     * setmaxPrice.
     *
     * @param mixed $maxPrice
     */
    public function setMaxPrice(?int $maxPrice): PropertySearch
    {
        $this->maxPrice = $maxPrice;

        return $this;
    }

    /**
     * getmaxPrice.
     *
     * @return int
     */
    public function getMaxPrice(): ?int
    {
        return $this->maxPrice;
    }

    /**
     * getOptions.
     */
    public function getOptions(): ArrayCollection
    {
        return $this->options;
    }

    /**
     * setOptions.
     *
     * @param mixed $options
     */
    public function setOptions(ArrayCollection $options): void
    {
        $this->options = $options;
    }

    /**
     * Get the value of lat.
     *
     * @return float
     */
    public function getLat()
    {
        return $this->lat;
    }

    /**
     * Set the value of lat.
     *
     * @return self
     */
    public function setLat(float $lat)
    {
        $this->lat = $lat;

        return $this;
    }

    /**
     * Get the value of lng.
     *
     * @return float
     */
    public function getLng()
    {
        return $this->lng;
    }

    /**
     * Set the value of lng.
     *
     * @return self
     */
    public function setLng(float $lng)
    {
        $this->lng = $lng;

        return $this;
    }

    /**
     * Get the value of distance.
     *
     * @return null|int
     */
    public function getDistance()
    {
        return $this->distance;
    }

    /**
     * Set the value of distance.
     *
     * @param null|int $distance
     *
     * @return self
     */
    public function setDistance($distance)
    {
        $this->distance = $distance;

        return $this;
    }

    /**
     * Get the value of address.
     *
     * @return null|string
     */
    public function getAddress()
    {
        return $this->address;
    }

    /**
     * Set the value of address.
     *
     * @param null|string $address
     *
     * @return self
     */
    public function setAddress($address)
    {
        $this->address = $address;

        return $this;
    }


    /**
     * Get the value of type.
     *
     * @return array
     */
    public function getType()
    {
        return $this->type;
    }

    /**
     * Set the value of type.
     *
     * @return self
     */
    public function setType(array $type)
    {
        $this->type = $type;

        return $this;
    }
}
