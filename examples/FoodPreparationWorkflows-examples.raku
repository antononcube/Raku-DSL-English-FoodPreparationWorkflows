use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;

use DSL::English::FoodPreparationWorkflows::Actions::WL::System;

say "=" x 60;

my @testCommands = (
'recommend a dish to cook',
'recommend a recipe to cook',
'i want to eat lunch from China',
'I want to eat a Chinese lunch',
'I want to eat protein and fat lunch',
'USER ID mamaJo32; I want to eat Greek protein and fat lunch',
'USER ID NONE; I want to eat Greek protein and fat lunch',
'I wants to eat food without allergic reaction',
'What do we eat for Christmas lunch',
'What did we eat in the last two weeks'
);
#
#
my @targets = ('WL-System');

for @testCommands -> $c {
    say "=" x 60;
    say $c;
    for @targets -> $t {
        say '-' x 30;
        say $t;
        say '-' x 30;
        my $start = now;
        my $res = ToFoodPreparationWorkflowCode($c, $t);
        say "time:", now - $start;
        say $res;
    }
}
