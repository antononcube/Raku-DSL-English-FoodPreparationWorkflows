use v6.d;

use DSL::English::FoodPreparationWorkflows;
use DSL::Entity::Foods;
use DSL::Entity::Geographics;
use Test;


##===========================================================
## Recommendations commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
$pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
$pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());


plan 17;

## 1
ok $pCOMMAND.parse('can you suggest dishes with fats'.lc),
        'can you suggest dishes with fats';

## 2
ok $pCOMMAND.parse('can you suggest dishes with low carbs'.lc),
        'can you suggest dishes with low carbs';

## 3
ok $pCOMMAND.parse('can you suggest dishes with protein'.lc),
        'can you suggest dishes with protein';

## 4
ok $pCOMMAND.parse('can you suggest dishes with sugars'.lc),
        'can you suggest dishes with sugars';

## 5
ok $pCOMMAND.parse('recommend a course'.lc),
        'recommend a course';

## 6
ok $pCOMMAND.parse('recommend a dish'.lc),
        'recommend a dish';

## 7
ok $pCOMMAND.parse('recommend a dish to cook'.lc),
        'recommend a dish to cook';

## 8
ok $pCOMMAND.parse('recommend a few dishes'.lc),
        'recommend a few dishes';

## 9
ok $pCOMMAND.parse('recommend courses for easter'.lc),
        'recommend courses for easter';

## 10
ok $pCOMMAND.parse('recommend courses for lunch'.lc),
        'recommend courses for lunch';

## 11
ok $pCOMMAND.parse('recommend dishes'.lc),
        'recommend dishes';

## 12
ok $pCOMMAND.parse('recommend dishes for dinner'.lc),
        'recommend dishes for dinner';

## 13
ok $pCOMMAND.parse('recommend dishes for easter'.lc),
        'recommend dishes for easter';

## 14
ok $pCOMMAND.parse('suggest a dish to cook'.lc),
        'suggest a dish to cook';

## 15
ok $pCOMMAND.parse('suggest me courses'.lc),
        'suggest me courses';

## 16
ok $pCOMMAND.parse('tell me a few courses'.lc),
        'tell me a few courses';

## 17
ok $pCOMMAND.parse('what to cook'.lc),
        'what to cook';

done-testing;
