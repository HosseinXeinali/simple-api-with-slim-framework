<?php

namespace App\Validator;

use App\Validator\Constraints\ContainsAlphanumeric;
use App\Validator\Constraints\IntOrDecimal;
use Symfony\Component\Validator\Validation;
use Symfony\Component\Validator\Constraints as Assert;

class ProductValidator
{
    protected $validator;
    protected $constraints;
    protected $violations;
    protected $input;

    public function __construct($input)
    {
        $this->validator = Validation::createValidator();
        $this->input = $input;
        $this->constraint = new Assert\Collection(array(
            'name' => [new ContainsAlphanumeric(), new Assert\NotNull(), new Assert\NotBlank()],
            'price' => [new IntOrDecimal(),new Assert\NotNull(), new Assert\NotBlank()],
        ));
    }

    public function validate()
    {
        $this->violations = $this->validator->validate(['name' => $this->input['name'], 'price' => $this->input['price']], $this->constraint);
        return (empty($this->violations) || sizeof($this->violations) == 0);
    }

    public function getMessages() {
        return $this->violations;
    }

}