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
        does DSL::Entity::English::Geographics::Grammar::CountryAdjectives
        does DSL::Shared::Roles::English::PipelineCommand {

    rule recommend-phrase {
        <recommend-food-prep-word>          | <suggest-food-prep-word>
    }

    ##-------------------------------------------------------
    rule item-of-food-phrase { <course-phrase> | <dish-phrase> }

    token course-phrase { <course-food-prep-word> | <courses-food-prep-word> }
    token dish-phrase { <dishes-food-prep-word> | <dish-food-prep-word> }

    ##-------------------------------------------------------
    rule chef-spec {
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
        <country-adjective> [<cuisine-noun>                | <food-noun>                | <kitchen-noun> ]?
    }

    token cuisine-noun { 'cuisine' }
    token food-noun { 'food' }
    token kitchen-noun { 'kitchen' }

    ##-------------------------------------------------------
    rule period-spec {
        <breakfast-noun>   |
        <dinner-noun>      |
        <lunch-noun>       |
        <afternoon-noun>   |
        <evening-noun>     |
        <morning-noun>     |
        <noon-noun>        |
        <easter-noun>      |
        <christmas-noun>
    }

    token afernoon-noun { 'afternoon' }
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
    rule several-phrase { <a-determiner>? <few-food-prep-word> | <several-food-prep-word> }
    rule cook-phrase { <cook-food-prep-word> | <prepare-food-prep-word> | <experiment-with-phrase> }
    rule experiment-with-phrase { <experiment-food-prep-word> <with-preposition> | <try-food-prep-word> <out-adverb>? }

    ##-------------------------------------------------------
    ## General tokens
    token can-food-prep-word { 'can' }
    token contain-food-prep-word { 'contain' }
    token cook-food-prep-word { 'cook' }
    token cooked-food-prep-word { 'cooked' }
    token course-food-prep-word { 'course' }
    token courses-food-prep-word { 'courses' }
    token experiment-food-prep-word { 'experiment' }
    token dish-food-prep-word { 'dish' }
    token dishes-food-prep-word { 'dishes' }
    token eat-food-prep-word { 'eat' }
    token few-food-prep-word { 'few' }
    token had-food-prep-word { 'had' }
    token have-food-prep-word { 'have' }
    token how-food-prep-word { 'how' }
    token i-food-prep-word { 'i' }
    token ingredient-food-prep-word { 'ingredient' }
    token ingredients-food-prep-word { 'ingredients' }
    token kind-food-prep-word { 'kind' }
    token know-food-prep-word { 'know' }
    token last-food-prep-word { 'last' }
    token make-food-prep-word { 'make' }
    token many-food-prep-word { 'many' }
    token most-food-prep-word { 'most' }
    token number-food-prep-word { 'number' }
    token often-food-prep-word { 'often' }
    token prepare-food-prep-word { 'prepare' }
    token recipes-food-prep-word { 'recipes' }
    token recommend-food-prep-word { 'recommend' }
    token several-food-prep-word { 'several' }
    token suggest-food-prep-word { 'suggest' }
    token time-food-prep-word { 'time' }
    token times-food-prep-word { 'times' }
    token was-food-prep-word { 'was' }
    token what-food-prep-word { 'what' }
    token when-food-prep-word { 'when' }
    token year-food-prep-word { 'year' }
    token you-food-prep-word { 'you' }
}