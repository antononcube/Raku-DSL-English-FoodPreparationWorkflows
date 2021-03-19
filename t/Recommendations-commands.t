use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;
use Test;

##===========================================================
## Recommendations commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

plan 17;

ok $pCOMMAND.parse('can you suggest dishes with fats'),
        'can you suggest dishes with fats';

ok $pCOMMAND.parse('can you suggest dishes with low carbs'),
        'can you suggest dishes with low carbs';

ok $pCOMMAND.parse('can you suggest dishes with protein'),
        'can you suggest dishes with protein';

ok $pCOMMAND.parse('can you suggest dishes with sugars'),
        'can you suggest dishes with sugars';

ok $pCOMMAND.parse('recommend a course'),
        'recommend a course';

ok $pCOMMAND.parse('recommend a dish'),
        'recommend a dish';

ok $pCOMMAND.parse('recommend a dish to cook'),
        'recommend a dish to cook';

ok $pCOMMAND.parse('recommend a few dishes'),
        'recommend a few dishes';

ok $pCOMMAND.parse('recommend courses for dinner'),
        'recommend courses for dinner';

ok $pCOMMAND.parse('recommend courses for easter'),
        'recommend courses for easter';

ok $pCOMMAND.parse('recommend courses for lunch'),
        'recommend courses for lunch';

ok $pCOMMAND.parse('recommend dishes'),
        'recommend dishes';

ok $pCOMMAND.parse('recommend dishes for dinner'),
        'recommend dishes for dinner';

ok $pCOMMAND.parse('suggest a dish to cook'),
        'suggest a dish to cook';

ok $pCOMMAND.parse('suggest me courses'),
        'suggest me courses';

ok $pCOMMAND.parse('tell me a few courses'),
        'tell me a few courses';

ok $pCOMMAND.parse('what to cook'),
        'what to cook';

done-testing;
