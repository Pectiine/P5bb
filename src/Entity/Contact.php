<?php

namespace App\Entity;

use Symfony\Component\Validator\Constraints as Assert;

class Contact
{
    /**
     * @var null|string
     * @Assert\NotBlank()
     * @Assert\Length(min=2, max=100)
     */
    private $firstname;
    /**
     * @var null|string
     * @Assert\NotBlank()
     * @Assert\Length(min=2, max=100)
     */
    private $lastname;

    /**
     * @var null|string
     * @Assert\NotBlank()
     * @Assert\Regex(
     * pattern="/[0-9]{10}/")
     */
    private $phone;

    /**
     * @var null|string
     * @Assert\NotBlank()
     * @Assert\Email()
     */
    private $email;

    /**
     * @var null|string
     * @Assert\NotBlank()
     * @Assert\Length(min=10)
     */
    private $message;

    /**
     * property.
     *
     * @var Property||null
     */
    private $property;

    /**
     * Get the value of message.
     *
     * @return null|string
     */
    public function getMessage()
    {
        return $this->message;
    }

    /**
     * Set the value of message.
     *
     * @param null|string $message
     *
     * @return self
     */
    public function setMessage($message)
    {
        $this->message = $message;

        return $this;
    }

    /**
     * Get the value of email.
     *
     * @return null|string
     */
    public function getEmail()
    {
        return $this->email;
    }

    /**
     * Set the value of email.
     *
     * @param null|string $email
     *
     * @return self
     */
    public function setEmail($email)
    {
        $this->email = $email;

        return $this;
    }

    /**
     * Get pattern="/[0-9]{10}").
     *
     * @return null|string
     */
    public function getPhone()
    {
        return $this->phone;
    }

    /**
     * Set pattern="/[0-9]{10}").
     *
     * @param null|string $phone pattern="/[0-9]{10}")
     *
     * @return self
     */
    public function setPhone($phone)
    {
        $this->phone = $phone;

        return $this;
    }

    /**
     * Get the value of lastname.
     *
     * @return null|string
     */
    public function getLastname()
    {
        return $this->lastname;
    }

    /**
     * Set the value of lastname.
     *
     * @param null|string $lastname
     *
     * @return self
     */
    public function setLastname($lastname)
    {
        $this->lastname = $lastname;

        return $this;
    }

    /**
     * Get the value of firstname.
     */
    public function getFirstname()
    {
        return $this->firstname;
    }

    /**
     * Set the value of firstname.
     *
     * @param mixed $firstname
     *
     * @return self
     */
    public function setFirstname($firstname)
    {
        $this->firstname = $firstname;

        return $this;
    }

    /**
     * Get property.
     *
     * @return Property||null
     */
    public function getProperty()
    {
        return $this->property;
    }

    /**
     * Set property.
     *
     * @param property||null $property property
     *
     * @return self
     */
    public function setProperty($property)
    {
        $this->property = $property;

        return $this;
    }
}
