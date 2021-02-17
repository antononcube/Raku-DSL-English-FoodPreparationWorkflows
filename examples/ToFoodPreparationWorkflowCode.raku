#!/usr/bin/env perl6
use DSL::English::FoodPreparationWorkflows;

sub MAIN(Str $commands, Str $target = 'WL-ClCon' ) {
    put ToFoodPreparationWorkflowCode($commands, $target);
}