use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

#use Grammar::Tracer;

say $pCOMMAND.parse( 'i want chicken fried rices', rule => 'food-entity-command');

#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 0.7 resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 70 % resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.subparse( 'split data with ratio 0.8 and with label proportional method');

#
#say "=" x 60;
#
#
#my @testCommands = (
#''
#);
#
#
#my @targets = ('Bulgarian', 'WL-System');
#
#for @testCommands -> $c {
#    say "=" x 30;
#    say $c;
#    for @targets -> $t {
#        say '-' x 30;
#        say $t;
#        say '-' x 30;
#        my $start = now;
#        my $res = ToFoodPreparationWorkflowCode($c, $t);
#        say "time:", now - $start;
#        say $res;
#    }
#}
