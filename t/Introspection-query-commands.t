use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;
use Test;

##===========================================================
## Introspection commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

plan 14;

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

ok $pCOMMAND.parse('when is the last time I ate Asian food'),
        'when is the last time I ate Asian food';

ok $pCOMMAND.parse('when is the last time I ate Greek'),
        'when is the last time I ate Greek';

ok $pCOMMAND.parse('when is the last time I ate'),
        'when is the last time I ate';

ok $pCOMMAND.parse('when is the last time I cooked'),
        'when is the last time I cooked';

ok $pCOMMAND.parse('show timeline of when I cooked'),
        'show timeline of when I cooked';

ok $pCOMMAND.parse('show the timeline of when I ate Chinese'),
        'show the timeline of when I ate Chinese';

ok $pCOMMAND.parse('what is the timeline for eating Thai food'),
        'what is the timeline for eating Thai food';

done-testing;
