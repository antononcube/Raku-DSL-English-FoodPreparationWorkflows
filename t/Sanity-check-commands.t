use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;
use Test;

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

plan 9;

ok $pCOMMAND.parse('what number of dishes have low carbs'),
        'what number of dishes have low carbs';

ok $pCOMMAND.parse('how many dishes have saturated fats'),
        'how many dishes have saturated fats';

ok $pCOMMAND.parse('what do i eat for lunch'),
        'what do i eat for lunch';

ok $pCOMMAND.parse('what do i cook during easter'),
        'what do i cook during easter';

ok $pCOMMAND.parse('recommend dishes to cook'),
        'recommend dishes to cook';

ok $pCOMMAND.parse('recommend a few courses'),
        'recommend a few courses';

ok $pCOMMAND.parse('recommend a few courses to experiment with'),
        'recommend a few courses to experiment with';

ok $pCOMMAND.parse('recommend a few courses from china'),
        'recommend a few courses from china';

ok $pCOMMAND.parse('suggest a recipe with low carbs'),
        'suggest a recipe with low carbs';

done-testing;
