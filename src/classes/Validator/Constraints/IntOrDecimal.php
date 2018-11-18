<?php

namespace App\Validator\Constraints;

use Symfony\Component\Validator\Constraint;

class IntOrDecimal extends Constraint {
    public $message = 'The price should be a positive int or decimal.';

}