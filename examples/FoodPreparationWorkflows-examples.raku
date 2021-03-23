use lib './lib';
use lib '.';
use DSL::English::FoodPreparationWorkflows;

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;

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

say $pCOMMAND.parse('recommend a dish to cook' );

say $pCOMMAND.parse('i want to eat protein and fat lunch' );

say $pCOMMAND.subparse('tell me some low calorie dish suggestions' );

say $pCOMMAND.subparse('i want to eat Greek food' );

#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 0.7 resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.parse( 'create classifier ensemble with 5 of RandomForest classifiers using 70 % resampling', rule => 'classifier-ensemble-creation-command');
#say $pCOMMAND.subparse( 'split data with ratio 0.8 and with label proportional method');

#
say "=" x 60;


my @testCommands = (
'recommend a dish to cook',
'i want to eat lunch from China',
'i want to eat Chinese lunch',
'i want to eat Greek food',
'i want to eat protein and fat lunch'
);


my @targets = ('WL-System');

for @testCommands -> $c {
    say "=" x 30;
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
