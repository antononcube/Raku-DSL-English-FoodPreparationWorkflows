use v6.d;

use DSL::English::FoodPreparationWorkflows;
use DSL::Entity::Foods;
use DSL::Entity::Geographics;
use Test;


##===========================================================
## Recommendations by profile commands
##===========================================================

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
$pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
$pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());


plan 26;

## 1
ok $pCOMMAND.parse('can you suggest a local cuisine'.lc),
        'can you suggest a local cuisine';

## 2
ok $pCOMMAND.parse('i am in the mood for a snack'.lc),
        'i am in the mood for a snack';

## 3
ok $pCOMMAND.parse('i am sick what do i cook'.lc),
        'i am sick what do i cook';

## 4
ok $pCOMMAND.parse('im feeling sick suggest me a dish'.lc),
        'im feeling sick suggest me a dish';

## 5
ok $pCOMMAND.parse('i want to eat a China lunch'.lc),
        'i want to eat a China lunch';

## 6
ok $pCOMMAND.parse('i want to eat a Germany lunch'.lc),
        'i want to eat a Germany lunch';

## 7
ok $pCOMMAND.parse('i want to eat something from Asia'.lc),
        'i want to eat something from Asia';

## 8
ok $pCOMMAND.parse('show me some Germany dishes'.lc),
        'show me some Germany dishes';

## 9
ok $pCOMMAND.parse('show me some Italy dishes'.lc),
        'show me some Italy dishes';

## 10
ok $pCOMMAND.parse('suggest a dish from Turkey'.lc),
        'suggest a dish from Turkey';

## 11
ok $pCOMMAND.parse('suggest a recipe from Asia'.lc),
        'suggest a recipe from Asia';

## 12
ok $pCOMMAND.parse('suggest recipe from Asia'.lc),
        'suggest recipe from Asia';

## 13
ok $pCOMMAND.parse('suggest recipe from Turkey'.lc),
        'suggest recipe from Turkey';

## 14
ok $pCOMMAND.parse('suggest something low calorie'.lc),
        'suggest something low calorie';

## 15
ok $pCOMMAND.parse('suggest something sweet'.lc),
        'suggest something sweet';

## 16
ok $pCOMMAND.parse('suggest something with fats'.lc),
        'suggest something with fats';

## 17
ok $pCOMMAND.parse('suggest something with protein'.lc),
        'suggest something with protein';

## 18
ok $pCOMMAND.parse('tell me a interesting recipe'.lc),
        'tell me a interesting recipe';

## 19
ok $pCOMMAND.parse('tell me Christmas dishes'.lc),
        'tell me Christmas dishes';

## 20
ok $pCOMMAND.parse('tell me Easter dishes'.lc),
        'tell me Easter dishes';

## 21
ok $pCOMMAND.parse('tell me fatty dish suggestions'.lc),
        'tell me fatty dish suggestions';

## 22
ok $pCOMMAND.parse('tell me low calorie dish suggestions'.lc),
        'tell me low calorie dish suggestions';

## 23
ok $pCOMMAND.parse('tell me non Asia recipe'.lc),
        'tell me non Asia recipe';

## 24
ok $pCOMMAND.parse('tell me non Greece recipe'.lc),
        'tell me non Greece recipe';

## 25
ok $pCOMMAND.parse('tell me non Turkey recipe'.lc),
        'tell me non Turkey recipe';

## 26
ok $pCOMMAND.parse('tell me some interesting Germany recipe'.lc),
        'tell me some interesting Germany recipe';

done-testing;