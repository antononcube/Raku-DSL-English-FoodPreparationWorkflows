use v6;

role DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand {

    rule recommendations-command {
        <.can-food-prep-word> <.sous-chef-spec> <.recommend-phrase> <.dishes-food-prep-word> <.with-preposition> <ingredient-spec-list> |
        <.what-food-prep-word> <.to-preposition> <.cook-phrase> |
        <.recommend-phrase> [ <a-determiner> | <the-determiner> | <several-phrase> ]? <.item-of-food-phrase> [ <.to-preposition> <cook-phrase> ]? [ <.for-preposition> <period-spec> ]?
    }

    rule recommendations-by-profile-command {
        <.can-food-prep-word> <.sous-chef-spec> <.recommend-phrase> <.a-determiner>? <food-cuisine-spec> |
        <.user-be-phrase> <.sick-food-prep-word> <.what-food-prep-word> <.do-verb> <user-spec> <.cook-phrase> |
        <.user-be-phrase> <.in-preposition> <.the-determiner> <.mood-food-prep-word> <.for-preposition> <.a-determiner> <snack-food-prep-word> |
        <user-spec> <.want-food-prep-word> [ <.to-preposition> [ <.eat-food-prep-word>  | <.try-food-prep-word> <.out-adverb>? ] ]? [
           <.a-determiner>? [ <food-cuisine-spec> | <food-quality-spec> ]  <period-meal-spec>? |
           <something-food-prep-word> <.from-preposition>? [ <food-cuisine-spec> | <food-quality-spec> ] [ [ <.for-preposition> | <.at-preposition> | <.during-preposition> ] <period-meal-spec> ]? |
           <period-meal-spec> <.from-preposition>? <food-cuisine-spec> ] |
        <.user-be-phrase> <.feeling-food-prep-word> <.sick-food-prep-word> <recommend-phrase> <.me-food-prep-word>? <.a-determiner>? <item-of-food-phrase> |
        [ <recommend-phrase> | <tell-food-prep-word>  | <show-food-prep-word> ] <.me-food-prep-word>? <.a-determiner>? <.few-food-prep-word>? [
           <item-of-food-phrase> <.from-preposition> <food-cuisine-spec> |
           [ <recipe-food-prep-word> | <item-of-food-phrase> ] [
              <.from-preposition> <food-cuisine-spec> |
              <.with-preposition> <ingredient-spec-list> ] |
           <some-food-prep-word>? [ <food-cuisine-spec> | <ingredient-spec-list> ] [ <recipe-food-prep-word> | <item-of-food-phrase> <.recommendations-phrase>? | <recommendations-phrase> ] |
           <something-food-prep-word> <.with-preposition>? <ingredient-spec-list> |
           <period-spec> <.item-of-food-phrase> |
           <new-food-prep-word> <recipe-food-prep-word> |
           <interesting-food-prep-word> <recipe-food-prep-word> |
           <ingredient-spec-list> <item-of-food-phrase> <.recommendations-phrase> |
           <non-prefix> <food-cuisine-spec> <recipe-food-prep-word> |
           <.some-food-prep-word> <interesting-food-prep-word> <food-cuisine-spec> <recipe-food-prep-word> ]
    }
}