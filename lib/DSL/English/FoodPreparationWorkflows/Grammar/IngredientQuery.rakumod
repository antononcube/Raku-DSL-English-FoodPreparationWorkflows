use v6;

use DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases;
use DSL::English::FoodPreparationWorkflows::Grammar::IngredientSpec;
use DSL::Shared::Roles::English::CommonSpeechParts;

role DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery
        does DSL::English::FoodPreparationWorkflows::Grammar::IngredientSpec {

    rule ingredient-query-command {
        <ingredient-query-which-items-query>    | <ingredient-query-how-many-items-query>
    }

    rule ingredient-query-which-items-query {
        <.which-items-phrase> <ingredient-query-body>
    }

    rule ingredient-query-how-many-items-query {
        <.how-many-items-phrase> <ingredient-query-body>
    }

    rule do-you-know-phrase {
        <do-verb> <you-food-prep-word> <know-food-prep-word>
    }

    rule have-phrase {
        <that-pronoun>? [ <have-food-prep-word> | <contain-food-prep-word> | <are-verb>? <with-preposition> ]
    }

    rule do-you-know-to-have-phrase { <do-you-know-phrase>? <to-preposition>? <have-phrase> }

    rule ingredient-query-body {
        <item-of-food-phrase>  <.have-phrase> <.the-determiner>? <.ingredients-phrase>? <ingredient-spec-list>    |
        <recipes-food-prep-word> <.do-you-know-to-have-phrase> <.the-determiner>? <.ingredients-phrase>? <ingredient-spec-list>    |
        <dishes-food-prep-word> <.do-you-know-to-have-phrase> <.the-determiner>? <.ingredients-phrase>? <ingredient-spec-list>
    }
}