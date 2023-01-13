#!/usr/bin/env perl6
use DSL::English::FoodPreparationWorkflows;

#| Conversion of (natural) DSL commands for food preparation to (programming) code. (Or DSLs of other natural languages.)
sub MAIN(
        Str $commands,             #= natural language commands
        Str $target = 'WL-System', #= target language/system/package (defaults to 'WL-System')
        Str $userID = ''           #= user identifier (defaults to '')
         )
{
    put ToFoodPreparationWorkflowCode($commands, $target, :$userID);
}