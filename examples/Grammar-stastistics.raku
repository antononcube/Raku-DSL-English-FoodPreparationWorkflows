#!/usr/bin/env perl6

use DSL::English::FoodPreparationWorkflows;
use DSL::English::FoodPreparationWorkflows::Grammar;
use DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery;
use DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery;
use DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand;
use DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases;


#say $obj.gist;
#say $obj.perl;
#say $obj.^name;               # name of the object's class
#say $obj.^attributes;         # all attributes including parent class'
#say $obj.^attributes(:local); # only in-class defined attributes
#say $obj.^methods;            # all methods including parent class'
#say $obj.^methods(:local);    # only methods defined in the class
#say $obj.^parents;            # parent class(es)

my @objs = (
DSL::English::FoodPreparationWorkflows::Grammar,
DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery,
DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery,
DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand,
DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases
);

for @objs -> $obj {

    say '=' x 100;
    say 'name : ', $obj.^name;

    say 'Total number of methods : ', $obj.^methods.elems;
    say 'Number of local methods : ', $obj.^methods(:local).elems;

    say '-' x 100;
}