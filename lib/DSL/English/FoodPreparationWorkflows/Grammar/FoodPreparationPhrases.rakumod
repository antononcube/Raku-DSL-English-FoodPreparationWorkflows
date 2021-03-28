use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::English::CommonSpeechParts;
use DSL::Shared::Utilities::FuzzyMatching;

use DSL::Entity::English::Foods::Grammar::EntityNames;
use DSL::Entity::English::Geographics::Grammar::EntityNames;
use DSL::Entity::English::Geographics::Grammar::EntityAdjectives;

# Food preparation specific phrases
role DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases
        does DSL::Entity::English::Foods::Grammar::EntityNames
        does DSL::Entity::English::Geographics::Grammar::EntityNames
        does DSL::Entity::English::Geographics::Grammar::EntityAdjectives
        does DSL::Shared::Roles::English::PipelineCommand {

    rule recommend-phrase {
        [ <recommend-food-prep-word> | <suggest-food-prep-word> | <tell-food-prep-word> ] <to-preposition>? <me-food-prep-word>?
    }

    rule recommendations-phrase {
        <recommendations-food-prep-word>       | <suggestions-food-prep-word>
    }

    ##-------------------------------------------------------
    rule recipe-phrase {
        <recipe-food-prep-word> | <recipes-food-prep-word>
    }

    ##-------------------------------------------------------
    rule item-of-food-phrase {
        <course-phrase> | <dish-phrase>
    }

    token course-phrase {
        <course-food-prep-word> | <courses-food-prep-word>
    }
    token dish-phrase {
        <dishes-food-prep-word> | <dish-food-prep-word>
    }

    ##-------------------------------------------------------
    rule user-be-phrase {
        <user-spec> <user-be-verb> | <im-food-prep-word>
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
        [ <entity-country-name> | <entity-country-adjective> | <entity-region-name> | <entity-region-adjective> | <local-adjective> ] [ <.cuisine-noun> | <.food-noun> | <.kitchen-noun> ]?
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
        <breakfast-noun> |
        <dinner-noun> |
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

    ##-------------------------------------------------------
    rule mixed-food-spec-list {
        <food-cuisine-spec> <ingredient-spec-list> |
        <ingredient-spec-list> <food-cuisine-spec> |
        [ <food-cuisine-spec> | <ingredient-spec-list> ]+ % <.list-separator> }

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

    rule to-eat-pharse { <to-preposition> <eat-food-prep-word> | <to-preposition> <get-verb> }

    rule allergic-reaction-phrase { <allergic-food-prep-word> [ <reaction-food-prep-word> | <complications-food-prep-word> | <complication-food-prep-word> ] }

    ##-------------------------------------------------------
    ## General tokens
    token allergic-food-prep-word { :i 'allergic' }
    token am-food-prep-word { :i 'am' }
    token are-food-prep-word { :i 'are' }
    token can-food-prep-word { :i 'can' }
    token complication-food-prep-word { :i 'complication' }
    token complications-food-prep-word { :i 'complications' }
    token component-food-prep-word { :i 'component' }
    token contain-food-prep-word { :i 'contain' }
    token cook-food-prep-word { :i 'cook' }
    token cooked-food-prep-word { :i 'cooked' }
    token course-food-prep-word { :i 'course' }
    token courses-food-prep-word { :i 'courses' }
    token dish-food-prep-word { :i 'dish' }
    token dishes-food-prep-word { :i 'dishes' }
    token do-food-prep-word { :i 'do' }
    token eat-food-prep-word { :i 'eat' }
    token element-food-prep-word { :i 'element' }
    token experiment-food-prep-word { :i 'experiment' }
    token feeling-food-prep-word { :i 'feeling' }
    token few-food-prep-word { :i 'few' }
    token food-food-prep-word { :i 'food' }
    token had-food-prep-word { :i 'had' }
    token have-food-prep-word { :i 'have' }
    token how-food-prep-word { :i 'how' }
    token i-food-prep-word { :i 'i' }
    token im-food-prep-word { :i 'im' }
    token ingredient-food-prep-word { :i 'ingredient' }
    token ingredients-food-prep-word { :i 'ingredients' }
    token interesting-food-prep-word { :i 'interesting' }
    token kind-food-prep-word { :i 'kind' }
    token know-food-prep-word { :i 'know' }
    token last-food-prep-word { :i 'last' }
    token light-food-prep-word { :i 'light' }
    token local-food-prep-word { :i 'local' }
    token lowcarb-food-prep-word { :i 'lowcarb' }
    token lunch-food-prep-word { :i 'lunch' }
    token make-food-prep-word { :i 'make' }
    token many-food-prep-word { :i 'many' }
    token me-food-prep-word { :i 'me' }
    token mood-food-prep-word { :i 'mood' }
    token most-food-prep-word { :i 'most' }
    token new-food-prep-word { :i 'new' }
    token number-food-prep-word { :i 'number' }
    token often-food-prep-word { :i 'often' }
    token part-food-prep-word { :i 'part' }
    token prepare-food-prep-word { :i 'prepare' }
    token reaction-food-prep-word { :i 'reaction' }
    token recipe-food-prep-word { :i 'recipe' }
    token recipes-food-prep-word { :i 'recipes' }
    token recommend-food-prep-word { :i 'recommend' }
    token recommendations-food-prep-word { :i 'recommendations' }
    token several-food-prep-word { :i 'several' }
    token show-food-prep-word { :i 'show' }
    token sick-food-prep-word { :i 'sick' }
    token snack-food-prep-word { :i 'snack' }
    token some-food-prep-word { :i 'some' }
    token something-food-prep-word { :i 'something' }
    token suggest-food-prep-word { :i 'suggest' }
    token suggestions-food-prep-word { :i 'suggestions' }
    token tell-food-prep-word { :i 'tell' }
    token time-food-prep-word { :i 'time' }
    token times-food-prep-word { :i 'times' }
    token try-food-prep-word { :i 'try' }
    token want-food-prep-word { :i 'want' | 'wants' }
    token was-food-prep-word { :i 'was' }
    token we-food-prep-word { :i 'we' }
    token what-food-prep-word { :i 'what' }
    token when-food-prep-word { :i 'when' }
    token with-food-prep-word { :i 'with' }
    token year-food-prep-word { :i 'year' }
    token you-food-prep-word { :i 'you' }
}