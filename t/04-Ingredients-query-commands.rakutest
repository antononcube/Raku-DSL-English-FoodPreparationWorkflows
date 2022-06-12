use v6.d;

use DSL::English::FoodPreparationWorkflows;
use DSL::Entity::Foods;
use DSL::Entity::Geographics;
use Test;

##===========================================================
## Ingredients commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
$pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
$pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());


plan 13;

ok $pCOMMAND.parse('what number of dishes have low carbs'),
        'what number of dishes have low carbs';

ok $pCOMMAND.parse('how many dishes have saturated fats'),
        'how many dishes have saturated fats';

ok $pCOMMAND.parse('how many dishes have saturated fats'),
        'how many dishes have saturated fats';

ok $pCOMMAND.parse('how many dishes contain protein'),
        'how many dishes contain protein';

ok $pCOMMAND.parse('how many dishes contain saturated fats'),
        'how many dishes contain saturated fats';

ok $pCOMMAND.parse('how many recipes do you know with fats'),
        'how many recipes do you know with fats';

ok $pCOMMAND.parse('what number of dishes are with fats'),
        'what number of dishes have fats';

ok $pCOMMAND.parse('what number of dishes do you know to have high protein'),
        'what number of dishes have protein';

ok $pCOMMAND.parse('what number of dishes have sugars'),
        'what number of dishes have sugars';

ok $pCOMMAND.parse('which dishes have the ingredient fats'),
        'which dishes have the ingredient fats';

ok $pCOMMAND.parse('which dishes have the ingredients low carbs'),
        'which dishes have the ingredients low carbs';

ok $pCOMMAND.parse('which dishes have the ingredients protein'),
        'which dishes have the ingredients protein';

ok $pCOMMAND.parse('which dishes have the ingredients sugars'),
        'which dishes have the ingredients sugars';

done-testing;
