use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;
use Test;

##===========================================================
## Introspection commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

plan 7;

ok $pCOMMAND.parse('what did we eat between march and april'),
        'what did we eat between march and april';

ok $pCOMMAND.parse('what did I cook from jan to april'),
        'what did I cook from jan to april';

ok $pCOMMAND.parse('what did I eat from jan to may'),
        'what did I eat from jan to may';

ok $pCOMMAND.parse('what did I cook in the last two weeks'),
        'what did I cook in the last two weeks';

ok $pCOMMAND.parse('what did I cook last year'),
        'what did I cook last year';

ok $pCOMMAND.parse('how many times I cooked Chinese last year'),
        'How many times I cooked Chinese last year';

ok $pCOMMAND.parse('how many times I ate Greek food last year'),
        'How many times I ate Greek food last year';

done-testing;
