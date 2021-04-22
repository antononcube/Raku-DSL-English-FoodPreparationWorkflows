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

    token course-phrase { <course-food-prep-word> | <courses-food-prep-word> }

    token dish-phrase { <dishes-food-prep-word> | <dish-food-prep-word> }

    ##-------------------------------------------------------
    rule user-be-phrase {
        <user-spec> <user-be-verb> | <im-food-prep-word>
    }

    token user-spec { <i-food-prep-word> | <we-food-prep-word> }

    token user-be-verb { <am-food-prep-word> | <are-food-prep-word> }

    ##-------------------------------------------------------
    rule sous-chef-spec {
        <chef-noun>          | <you-food-prep-word>          | <sous-chef-susana-name>
    }

    token sous-chef-susana-name { <sous-prefix> <chef-noun> <susana-noun> | 'scs' }
    token chef-noun { :i 'chef' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'chef') }> }
    token sous-prefix { :i 'sous' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sous') }> }
    token susana-noun { :i 'susana' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'susana') }> }

    ##-------------------------------------------------------
    rule food-cuisine-spec {
        [ <entity-country-name> | <entity-country-adjective> | <entity-region-name> | <entity-region-adjective> | <local-adjective> ] [ <.cuisine-noun> | <.food-noun> | <.kitchen-noun> ]?
    }

    token cuisine-noun { :i 'cuisine' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cuisine') }> }
    token food-noun { :i 'food' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'food') }> }
    token kitchen-noun { :i 'kitchen' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'kitchen') }> }
    token local-adjective { :i 'local' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'local') }> }

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

    token afternoon-noun { :i 'afternoon' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'afternoon') }> }
    token breakfast-noun { :i 'breakfast' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'breakfast') }> }
    token christmas-noun { :i 'christmas' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'christmas') }> }
    token dinner-noun { :i 'dinner' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'dinner') }> }
    token easter-noun { :i 'easter' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'easter') }> }
    token evening-noun { :i 'evening' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'evening') }> }
    token lunch-noun { :i 'lunch' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lunch') }> }
    token morning-noun { :i 'morning' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'morning') }> }
    token noon-noun { :i 'noon' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'noon') }> }

    ##-------------------------------------------------------
    rule mixed-food-spec-list {
        <food-cuisine-spec> <ingredient-spec-list> |
        <ingredient-spec-list> <food-cuisine-spec>? |
        [ <food-cuisine-spec> | <ingredient-spec-list> ]+ % <.list-separator> }

    ##-------------------------------------------------------
    ## General rules
    rule several-phrase {
        <a-determiner>? <few-food-prep-word> |
        <several-food-prep-word> }

    rule cook-phrase {
        <cook-food-prep-word> |
        <prepare-food-prep-word> |
        <experiment-with-phrase> }

    rule cooked-phrase {
        <cooked-food-prep-word> |
        <prepared-food-prep-word> |
        <experiment-with-phrase> }

    rule experiment-with-phrase {
        <experiment-food-prep-word> <with-preposition> |
        <try-food-prep-word> <out-adverb>? }

    rule ingredients-phrase {
        <ingredient-food-prep-word> |
        <ingredients-food-prep-word> |
        <element-food-prep-word> |
        <component-food-prep-word> <part-food-prep-word>? }

    rule which-items-phrase { <what-food-prep-word> | <which-determiner> }
    rule how-many-items-phrase { <what-food-prep-word> <number-food-prep-word> <of-preposition> | <how-food-prep-word> <many-food-prep-word> }

    rule to-eat-pharse { <to-preposition> <eat-phrase> }
    rule eat-phrase { <eat-food-prep-word> | <get-verb> }

    rule ate-phrase { <ate-food-prep-word> | <got-food-prep-word> | <had-food-prep-word> }

    rule allergic-reaction-phrase { <allergic-food-prep-word> [ <reaction-food-prep-word> | <complications-food-prep-word> | <complication-food-prep-word> ] }

    ##-------------------------------------------------------
    ## General tokens
    token allergic-food-prep-word { :i 'allergic' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'allergic') }> }
    token am-food-prep-word { :i 'am' }
    token are-food-prep-word { :i 'are' }
    token ate-food-prep-word { :i 'ate' }
    token can-food-prep-word { :i 'can' }
    token complication-food-prep-word { :i 'complication' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'complication') }> }
    token complications-food-prep-word { :i 'complications' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'complications') }> }
    token component-food-prep-word { :i 'component' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'component') }> }
    token contain-food-prep-word { :i 'contain' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'contain') }> }
    token cook-food-prep-word { :i 'cook' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cook', 1) }> }
    token cooked-food-prep-word { :i 'cooked' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'cooked') }> }
    token course-food-prep-word { :i 'course' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'course') }> }
    token courses-food-prep-word { :i 'courses' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'courses') }> }
    token did-food-prep-word { :i 'did' }
    token dish-food-prep-word { :i 'dish' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'dish', 1) }> }
    token dishes-food-prep-word { :i 'dishes' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'dishes') }> }
    token do-food-prep-word { :i 'do' }
    token eat-food-prep-word { :i 'eat' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'eat', 1) }> }
    token element-food-prep-word { :i 'element' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'element') }> }
    token experiment-food-prep-word { :i 'experiment' | ([\w]+) <?{ $0.Str ne 'experimented' and is-fuzzy-match( $0.Str, 'experiment') }> }
    token experimented-food-prep-word { :i 'experimented' | ([\w]+) <?{ $0.Str ne 'experiment' and is-fuzzy-match( $0.Str, 'experimented') }> }
    token feeling-food-prep-word { :i 'feeling' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'feeling') }> }
    token few-food-prep-word { :i 'few' | ([\w]+) <?{ $0.Str ne 'new' and is-fuzzy-match( $0.Str, 'few', 1) }> }
    token food-food-prep-word { :i 'food' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'food') }> }
    token got-food-prep-word { :i 'got' }
    token had-food-prep-word { :i 'had' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'had', 1) }> }
    token have-food-prep-word { :i 'have' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'have', 1) }> }
    token how-food-prep-word { :i 'how' | ([\w]+) <?{ $0.Str ne 'show' and is-fuzzy-match( $0.Str, 'how', 1) }> }
    token i-food-prep-word { :i 'i' }
    token im-food-prep-word { :i 'im' | 'i\'m' }
    token ingredient-food-prep-word { :i 'ingredient' | ([\w]+) <?{ $0.Str ne 'ingredients' and is-fuzzy-match( $0.Str, 'ingredient') }> }
    token ingredients-food-prep-word { :i 'ingredients' | ([\w]+) <?{ $0.Str ne 'ingredient' and is-fuzzy-match( $0.Str, 'ingredients') }> }
    token interesting-food-prep-word { :i 'interesting' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'interesting') }> }
    token kind-food-prep-word { :i 'kind' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'kind', 1) }> }
    token know-food-prep-word { :i 'know' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'know', 1) }> }
    token last-food-prep-word { :i 'last' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'last', 1) }> }
    token light-food-prep-word { :i 'light' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'light') }> }
    token local-food-prep-word { :i 'local' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'local') }> }
    token lowcarb-food-prep-word { :i 'lowcarb' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lowcarb') }> }
    token lunch-food-prep-word { :i 'lunch' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'lunch') }> }
    token make-food-prep-word { :i 'make' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'make', 1) }> }
    token many-food-prep-word { :i 'many' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'many', 1) }> }
    token me-food-prep-word { :i 'me' }
    token mood-food-prep-word { :i 'mood' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'mood', 1) }> }
    token most-food-prep-word { :i 'most' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'most', 1) }> }
    token new-food-prep-word { :i 'new' | ([\w]+) <?{ $0.Str ne 'few' and is-fuzzy-match( $0.Str, 'new', 1) }> }
    token number-food-prep-word { :i 'number' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'number') }> }
    token often-food-prep-word { :i 'often' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'often') }> }
    token part-food-prep-word { :i 'part' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'part', 1) }> }
    token prepare-food-prep-word { :i 'prepare' | ([\w]+) <?{ $0.Str ne 'prepared' and is-fuzzy-match( $0.Str, 'prepare') }> }
    token prepared-food-prep-word { :i 'prepared' | ([\w]+) <?{ $0.Str ne 'prepare' and is-fuzzy-match( $0.Str, 'prepared') }> }
    token reaction-food-prep-word { :i 'reaction' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'reaction') }> }
    token recipe-food-prep-word { :i 'recipe' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recipe') }> }
    token recipes-food-prep-word { :i 'recipes' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recipes') }> }
    token recommend-food-prep-word { :i 'recommend' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recommend') }> }
    token recommendations-food-prep-word { :i 'recommendations' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'recommendations') }> }
    token several-food-prep-word { :i 'several' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'several') }> }
    token show-food-prep-word { :i 'show' | ([\w]+) <?{ $0.Str ne 'how' and is-fuzzy-match( $0.Str, 'show', 1) }> }
    token sick-food-prep-word { :i 'sick' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'sick', 1) }> }
    token snack-food-prep-word { :i 'snack' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'snack') }> }
    token some-food-prep-word { :i 'some' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'some', 1) }> }
    token something-food-prep-word { :i 'something' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'something') }> }
    token suggest-food-prep-word { :i 'suggest' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'suggest') }> }
    token suggestions-food-prep-word { :i 'suggestions' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'suggestions') }> }
    token tell-food-prep-word { :i 'tell' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'tell', 1) }> }
    token time-food-prep-word { :i 'time' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'time', 1) }> }
    token times-food-prep-word { :i 'times' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'times') }> }
    token try-food-prep-word { :i 'try' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'try', 1) }> }
    token want-food-prep-word { :i 'want' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'want', 1) }> | 'wants' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'wants') }> }
    token was-food-prep-word { :i 'was' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'was', 1) }> }
    token we-food-prep-word { :i 'we' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'we', 1) }> }
    token what-food-prep-word { :i 'what' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'what', 1) }> }
    token when-food-prep-word { :i 'when' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'when', 1) }> }
    token with-food-prep-word { :i 'with' }
    token year-food-prep-word { :i 'year' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'year', 1) }> }
    token you-food-prep-word { :i 'you' | ([\w]+) <?{ is-fuzzy-match( $0.Str, 'you', 1) }> }
}
