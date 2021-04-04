#!/usr/bin/env perl6
use DSL::English::FoodPreparationWorkflows;

sub MAIN
#= Conversion of natural commands for food preparation to code.
(Str $commands, #= natural language commands
 Str $target = 'WL-System', #= target language/system/package (defaults to 'WL-System')
 Str $userID = '' #= user identifier (defaults to '')
 )
{
    put ToFoodPreparationWorkflowCode($commands, $target, :$userID);
}