use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::English::CommonSpeechParts;
use DSL::Shared::Utilities::FuzzyMatching;

use DSL::Entity::English::Foods::Grammar::FoodNames;
use DSL::Entity::English::Geographics::Grammar::CountryNames;
use DSL::Entity::English::Geographics::Grammar::CountryAdjectives;

# Food preparation specific phrases
role DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases
        does DSL::Entity::English::Foods::Grammar::FoodNames
        does DSL::Entity::English::Geographics::Grammar::CountryNames
        does DSL::Entity::English::Geographics::Grammar::CountryAdjectives
        does DSL::Shared::Roles::English::PipelineCommand {

    rule recommend-phrase {
        <recommend-food-prep-word>       | <suggest-food-prep-word>
    }

    rule recommendations-phrase {
        <recommendations-food-prep-word>       | <suggestions-food-prep-word>
    }
    ##-------------------------------------------------------
    rule item-of-food-phrase {
        <course-phrase>          | <dish-phrase>
    }

    token course-phrase {
        <course-food-prep-word> | <courses-food-prep-word>
    }
    token dish-phrase {
        <dishes-food-prep-word> | <dish-food-prep-word>
    }

    ##-------------------------------------------------------
    rule user-be-phrase {
        <user-spec> <user-be-verb>
    }
    token user-spec {
        <i-food-prep-word> | <we-food-prep-word>
    }
    token user-be-verb {
        <am-food-prep-word> | <are-food-prep-word>
    }

    ##-------------------------------------------------------
    rule sous-chef-spec {
        <chef-noun>          | <you-food-prep-word>          | <sous-chef-susana-name>
    }

    token sous-chef-susana-name {
        <sous-prefix> <chef-noun> <susana-noun> | 'scs'
    }
    token chef-noun { 'chef' }
    token sous-prefix { 'sous' }
    token susana-noun { 'susana' }

    ##-------------------------------------------------------
    rule food-cuisine-spec {
        [<country-name-known>       | <country-adjective-known>       | <local-adjective> ] [<cuisine-noun>       | <food-noun>       | <kitchen-noun> ]?
    }

    token cuisine-noun { 'cuisine' }
    token food-noun { 'food' }
    token kitchen-noun { 'kitchen' }
    token local-adjective { 'local' }

    ##-------------------------------------------------------
    rule period-spec {
        <breakfast-noun>            |
        <dinner-noun>               |
        <lunch-noun>                |
        <afternoon-noun>            |
        <evening-noun>              |
        <morning-noun>              |
        <noon-noun>                 |
        <easter-noun>               |
        <christmas-noun>
    }

    rule period-meal-spec {
        <breakfast-noun>            |
        <dinner-noun>               |
        <lunch-noun>
    }

    token afternoon-noun { 'afternoon' }
    token breakfast-noun { 'breakfast' }
    token christmas-noun { 'christmas' }
    token dinner-noun { 'dinner' }
    token easter-noun { 'easter' }
    token evening-noun { 'evening' }
    token lunch-noun { 'lunch' }
    token morning-noun { 'morning' }
    token noon-noun { 'noon' }

    token during-preposition { 'during' }

    ##-------------------------------------------------------
    ## General rules
    rule several-phrase {
        <a-determiner>? <few-food-prep-word> |
        <several-food-prep-word>
    }
    rule cook-phrase {
        <cook-food-prep-word> |
        <prepare-food-prep-word> |
        <experiment-with-phrase>
    }
    rule experiment-with-phrase {
        <experiment-food-prep-word> <with-preposition> |
        <try-food-prep-word> <out-adverb>?
    }

    rule ingredients-phrase {
        <ingredient-food-prep-word> |
        <ingredients-food-prep-word> |
        <element-food-prep-word> |
        <component-food-prep-word> <part-food-prep-word>?
    }

    rule which-items-phrase { <what-food-prep-word> | <which-determiner> }
    rule how-many-items-phrase { <what-food-prep-word> <number-food-prep-word> <of-preposition> | <how-food-prep-word> <many-food-prep-word> }

    ##-------------------------------------------------------
    ## General tokens
    token am-food-prep-word { 'am' }
    token calorie-food-prep-word { 'calorie' }
    token calories-food-prep-word { 'calories' }
    token can-food-prep-word { 'can' }
    token carrots-food-prep-word { 'carrots' }
    token component-food-prep-word { 'component' }
    token contain-food-prep-word { 'contain' }
    token cook-food-prep-word { 'cook' }
    token cooked-food-prep-word { 'cooked' }
    token course-food-prep-word { 'course' }
    token courses-food-prep-word { 'courses' }
    token dish-food-prep-word { 'dish' }
    token dishes-food-prep-word { 'dishes' }
    token do-food-prep-word { 'do' }
    token eat-food-prep-word { 'eat' }
    token element-food-prep-word { 'element' }
    token experiment-food-prep-word { 'experiment' }
    token feeling-food-prep-word { 'feeling' }
    token few-food-prep-word { 'few' }
    token had-food-prep-word { 'had' }
    token have-food-prep-word { 'have' }
    token how-food-prep-word { 'how' }
    token i-food-prep-word { 'i' }
    token im-food-prep-word { 'im' }
    token ingredient-food-prep-word { 'ingredient' }
    token ingredients-food-prep-word { 'ingredients' }
    token interesting-food-prep-word { 'interesting' }
    token kind-food-prep-word { 'kind' }
    token know-food-prep-word { 'know' }
    token last-food-prep-word { 'last' }
    token light-food-prep-word { 'light' }
    token local-food-prep-word { 'local' }
    token lowcarb-food-prep-word { 'lowcarb' }
    token lunch-food-prep-word { 'lunch' }
    token make-food-prep-word { 'make' }
    token many-food-prep-word { 'many' }
    token me-food-prep-word { 'me' }
    token mood-food-prep-word { 'mood' }
    token most-food-prep-word { 'most' }
    token new-food-prep-word { 'new' }
    token number-food-prep-word { 'number' }
    token often-food-prep-word { 'often' }
    token part-food-prep-word { 'part' }
    token prepare-food-prep-word { 'prepare' }
    token recipe-food-prep-word { 'recipe' }
    token recipes-food-prep-word { 'recipes' }
    token recommend-food-prep-word { 'recommend' }
    token recommendations-food-prep-word { 'recommendations' }
    token several-food-prep-word { 'several' }
    token show-food-prep-word { 'show' }
    token sick-food-prep-word { 'sick' }
    token snack-food-prep-word { 'snack' }
    token some-food-prep-word { 'some' }
    token something-food-prep-word { 'something' }
    token suggest-food-prep-word { 'suggest' }
    token suggestions-food-prep-word { 'suggestions' }
    token tell-food-prep-word { 'tell' }
    token time-food-prep-word { 'time' }
    token times-food-prep-word { 'times' }
    token try-food-prep-word { 'try' }
    token want-food-prep-word { 'want' }
    token was-food-prep-word { 'was' }
    token we-food-prep-word { 'we' }
    token what-food-prep-word { 'what' }
    token when-food-prep-word { 'when' }
    token with-food-prep-word { 'with' }
    token year-food-prep-word { 'year' }
    token you-food-prep-word { 'you' }
}