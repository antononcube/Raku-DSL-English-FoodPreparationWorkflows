use v6;

use DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases;
use DSL::English::FoodPreparationWorkflows::Grammar::IngredientPhrase;
use DSL::Shared::Roles::English::CommonSpeechParts;

role DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery
        does DSL::English::FoodPreparationWorkflows::Grammar::IngredientPhrase {

    rule ingredient-query-command {
        <.what-food-prep-word> [ <.dishes-food-prep-word> [ <.have-food-prep-word> | <.contain-food-prep-word> ] <ingredient-phrase> | <.number-food-prep-word> <.of-preposition> <dishes-food-prep-word> [ <.have-food-prep-word> | <.contain-food-prep-word> ] <ingredient-phrase> ] |
        <.how-food-prep-word> <.many-food-prep-word> [ <dishes-food-prep-word> <.have-food-prep-word> | <recipes-food-prep-word> <.do-verb> <.you-food-prep-word> <know-food-prep-word> <.with-preposition> ] <ingredient-phrase> |
        <.which-determiner> [<recipes-food-prep-word> <.have-food-prep-word> <.the-determiner>? [<.ingredients-food-prep-word> <ingredient-phrase> | <.ingredient-food-prep-word> <ingredient-phrase> ] | <dishes-food-prep-word> <.have-food-prep-word> <.the-determiner>? [<.ingredients-food-prep-word> <ingredient-phrase>    | <.ingredient-food-prep-word> <ingredient-phrase> ]]
    }


}