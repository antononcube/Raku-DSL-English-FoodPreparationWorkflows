use v6.d;

use DSL::Shared::Utilities::CommandProcessing;
use DSL::English::FoodPreparationWorkflows;
use DSL::Entity::Foods;
use DSL::Entity::Geographics;
use Test;

##===========================================================
## User ID specs handling
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
$pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
$pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());

my Str $target = 'WL-Ecosystem';

plan 13;

unlike ToFoodPreparationWorkflowCode('recommend dishes to cook'), / .* 'UserID' .* /;

like ToFoodPreparationWorkflowCode('recommend dishes to cook', userID => '787-89-jjd'), / .* 'UserID:787-89-jjd' .* /;

like ToFoodPreparationWorkflowCode('recommend dishes to cook', $target, userID => '787_89.jjd-88'), / .* 'UserID:787_89.jjd-88' .* /;

ok ToFoodPreparationWorkflowCode('USER ID 949-444-323; I want to eat protein and fat lunch'),
        'USER ID 949-444-323; I want to eat protein and fat lunch';

ok ToFoodPreparationWorkflowCode('USER ID 787_89.jjd-88; I want to eat Greek protein and fat lunch'),
        'USER ID 787_89.jjd-88; I want to eat Greek protein and fat lunch';

ok ToFoodPreparationWorkflowCode('USER ID mamaJioe94; recommend dishes to cook'),
        'USER ID mamaJioe94; recommend dishes to cook';

like ToFoodPreparationWorkflowCode('USER ID mamaJioe94; recommend dishes to cook'), / .* 'UserID:mamaJioe94' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID NONE; recommend dishes to cook'), / .* 'UserID' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID NULL; recommend dishes to cook'), / .* 'UserID' .* /;

like ToFoodPreparationWorkflowCode('USER ID marekGram88; recommend dishes to cook', $target, userID => 'harzaGa22' ), / .* 'UserID:marekGram88' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID marekGram88; recommend dishes to cook', $target, userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

like ToFoodPreparationWorkflowCode('USER ID NONE; recommend dishes to cook', $target, userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

like ToFoodPreparationWorkflowCode('USER ID NULL; recommend dishes to cook', $target, userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

done-testing;
