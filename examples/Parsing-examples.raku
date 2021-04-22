use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;

use DSL::English::FoodPreparationWorkflows::Actions::WL::System;

#-----------------------------------------------------------
my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

sub fpw-parse( Str:D $command, Str:D :$rule = 'TOP' ) {
        $pCOMMAND.parse($command, :$rule);
}

sub fpw-interpret( Str:D $command, Str:D :$rule = 'TOP' ) {
        $pCOMMAND.parse(
                $command,
                :$rule,
                actions => DSL::English::FoodPreparationWorkflows::Actions::WL::System.new ).made;
}
#----------------------------------------------------------

say "=" x 60;
my $cmd = 'how many times I ate Chinese food in the last two months';

say fpw-parse( $cmd );

say '-' x 60;

say fpw-interpret( $cmd );

say "=" x 60;

#----------------------------------------------------------

my @testCommands = (
'how many times I ate Indian food in the last three months',
'how many times I cooked Chinese last year',
'what did we eat between march and april',
'what did I cook from jan to april',
'what did I eat from jan to may',
'what did I cook in the last two weeks',
'what did I cook last year'
);

my @targets = ('WL-System');

#for @testCommands -> $c {
#    say "=" x 60;
#    say $c;
#    for @targets -> $t {
#        say '-' x 30;
#        say $t;
#        say '-' x 30;
#        my $start = now;
#        my $res = fpw-interpret($c);
#        say "time:", now - $start;
#        say $res;
#    }
#}

#----------------------------------------------------------

#use Grammar::Tracer;
#
#say $pCOMMAND.parse('i want chicken and mushroom pies', rule => 'love-food-entity-command');
#
#say $pCOMMAND.parse('i want arizona iced tea', rule => 'love-food-entity-command');
#
#say $pCOMMAND.parse('i want mac \' n cheese', rule => 'love-food-entity-command');
#
#say $pCOMMAND.parse('i want black - eyed peas', rule => 'love-food-entity-command');

#say $pCOMMAND.subparse('What do I eat for breakfast thai food');

#say $pCOMMAND.subparse('how many arizona iced teas are in the fridge');

#say $pCOMMAND.subparse('how many arizona iced teas i have');

#say $pCOMMAND.subparse('how many arizona iced tea');

#say $pCOMMAND.subparse('what number of dishes have low carbs');
#
#say $pCOMMAND.subparse('how many dishes have saturated fats');
#
#say $pCOMMAND.parse('what do i eat for lunch');
#
#say $pCOMMAND.parse('what do i cook during easter');
#
#say $pCOMMAND.parse('recommend dishes to cook');
#
#say $pCOMMAND.parse('recommend a few courses');
#
#say $pCOMMAND.parse('recommend a few courses to experiment with');
#
#say $pCOMMAND.parse('recommend a few courses from china');
#
#say $pCOMMAND.subparse('suggest a recipe with low carbs');

#say $pCOMMAND.subparse('Chinese'.lc, rule => 'food-cuisine-spec');

#say $pCOMMAND.subparse('i want to eat Chinese'.lc, rule => 'recommendations-by-profile-command');

#say $pCOMMAND.parse('i want to eat something from China' );
#
#say $pCOMMAND.parse('recommend a Chinese recipe' );
#
#say $pCOMMAND.parse('recommend a recipe from China' );
#

#say $pCOMMAND.parse('recommend a dish to cook' );
#
#say $pCOMMAND.parse('i want to eat protein, carbs, and fat lunch' );
#
#say $pCOMMAND.subparse('tell me some low calorie dish suggestions' );
#
#say $pCOMMAND.parse('what do we eat for christmas lunch' );
#
#say $pCOMMAND.subparse('we want to eat without allergic complications' );
#
#say $pCOMMAND.subparse('i wants to eat food without allergic reaction' );
#
#say $pCOMMAND.subparse('I want to eat a protein and fat Chinese lunch' );
#
#say $pCOMMAND.subparse('what did we eat in may', rule => 'introspection-query-command');
#
#say $pCOMMAND.subparse('what did we eat in may two thousand twenty', rule => 'introspection-query-command');


#say "=" x 60;
#
#say $pCOMMAND.subparse('what did we eat during lunch', rule => 'introspection-query-command');

#$pCOMMAND.parse(
#                'what did we eat between january and march',
#                rule => 'introspection-query-command',
#                actions => DSL::English::FoodPreparationWorkflows::Actions::WL::System.new ).made;

