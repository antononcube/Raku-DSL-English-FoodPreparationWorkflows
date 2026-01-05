# use lib <. lib>;
use DSL::English::FoodPreparationWorkflows;

use DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem;

my @testCommands = (
#'recommend something to eat',
#'recommend a dish to cook',
#'recommend a recipe to cook',
'i want to eat lunch from China',
'I want to eat a Chinese lunch',
'I want to eat Greek breakfast',
'I want to eat protein and fat lunch',
#'USER ID mamaJo32; I want to eat Greek protein and fat lunch',
#'USER ID NONE; I want to eat Greek protein and fat lunch',
#'I wants to eat food without allergic reaction',
#'display the timeline between jan and apr',
#'USER ID kkio; what did I eat between 20 may and 30 june',
#'when did I eat Greek food in the last two weeks',
'what do we eat for Christmas lunch',
'what did we eat in the last two weeks',
'USER ID kkio; when is the last time I cooked Greek food',
'show timeline of when I cooked',
'what did we cook last year',
'plot the timeline of my Greek cooking'
);

my @targets = ('WL-Ecosystem');

for @testCommands -> $c {
    say "=" x 60;
    say "command :\t", $c;
    for @targets -> $t {
        my $start = now;
        my $res = ToFoodPreparationWorkflowCode($c, $t);
        say "interp. :\t", $res;
        say $t, "\ttime: ", round(now - $start,0.0001);
    }
}
