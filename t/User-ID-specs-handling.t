use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;
use Test;

##===========================================================
## User ID specs handling
##===========================================================

plan 12;

ok ToFoodPreparationWorkflowCode('USER ID 949-444-323; I want to eat protein and fat lunch'),
        'USER ID 949-444-323; I want to eat protein and fat lunch';

ok ToFoodPreparationWorkflowCode('USER ID 949-444-323; I want to eat Greek protein and fat lunch'),
        'USER ID 949-444-323; I want to eat Greek protein and fat lunch';

ok ToFoodPreparationWorkflowCode('USER ID mamaJioe94; recommend dishes to cook'),
        'USER ID mamaJioe94; recommend dishes to cook';

like ToFoodPreparationWorkflowCode('USER ID mamaJioe94; recommend dishes to cook'), / .* 'UserID:mamaJioe94' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID NONE; recommend dishes to cook'), / .* 'UserID' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID NULL; recommend dishes to cook'), / .* 'UserID' .* /;

like ToFoodPreparationWorkflowCode('USER ID marekGram88; recommend dishes to cook', userID => 'harzaGa22' ), / .* 'UserID:marekGram88' .* /;

unlike ToFoodPreparationWorkflowCode('USER ID marekGram88; recommend dishes to cook', userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

like ToFoodPreparationWorkflowCode('USER ID NONE; recommend dishes to cook', userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

like ToFoodPreparationWorkflowCode('USER ID NULL; recommend dishes to cook', userID => 'harzaGa22' ), / .* 'UserID:harzaGa22' .* /;

done-testing;
