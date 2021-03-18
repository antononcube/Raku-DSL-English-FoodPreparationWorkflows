use v6;

role DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand {

    rule recommendations-command {
        <.can-food-prep-word> <.sous-chef-spec> <.recommend-phrase> <.dishes-food-prep-word> <.with-preposition> <ingredient-phrase> |
        <.recommend-phrase> <.a-determiner>? [ <item-of-food-phrase> <.to-preposition> ] <cook-food-prep-word> |
        <.what-food-prep-word> <.to-preposition> <.cook-phrase> |
        <.recommend-phrase> [
          <.item-of-food-phrase> <.for-prepsoition> <period-spec> |
          <.several-phrase> <item-of-food-phrase> [ <.to-preposition> <.cook-phrase> ]?
        ]
    }

    rule recommendations-by-profile-command {
        <.can-food-prep-word> <.sous-chef-spec> <.recommend-phrase> <.a-determiner>? <food-cuisine-spec> |
        <.user-be-phrase> <.sick-food-prep-word> <.what-food-prep-word> <.do-verb> <user-spec> <.cook-phrase> |
        <.user-be-phrase> <.in-preposition> <.the-determiner> <.mood-food-prep-word> <.for-preposition> <.a-determiner> <snack-food-prep-word> |
        <user-spec> <.want-food-prep-word> [
           <food-cuisine-spec> |
           <.to-preposition> [ <.eat-food-prep-word> [ <something-food-prep-word> <.from-preposition> <food-cuisine-spec> | <.a-determinera>? <food-cuisine-spec> <period-meal-spec> ] |
                               <.try-food-prep-word> <food-cuisine-spec> ] ] |
        <.user-be-phrase> <.feeling-food-prep-word> <.sick-food-prep-word> <recommend-phrase> <.me-food-prep-word>? <.a-determiner>? <item-of-food-phrase> |
        [ <recommend-phrase> | <tell-food-prep-word>  | <show-food-prep-word> ] <.me-food-prep-word>? <.a-determiner>? <.few-food-prep-word>? [
           <item-of-food-phrase> <.from-preposition> <food-cuisine-spec> |
           [ <recipe-food-prep-word> | <item-of-food-phrase> ] [
              <.from-preposition> <food-cuisine-spec> |
              <.with-preposition> <ingredient-phrase> ] |
           <some-food-prep-word> <food-cuisine-spec> <.item-of-food-prese>?
           <something-food-prep-word> [ <.with-preposition> <light-food-prep-word> <calories-food-prep-word> | <low-food-prep-word> <calorie-food-prep-word> ] |
           <period-spec> <item-of-food-phrase> |
           <new-food-prep-word> <recipe-food-prep-word> |
           <interesting-food-prep-word> <recipe-food-prep-word> |
           <ingredient-phrase> <item-of-food-phrase> <.suggestions-phrase> |
           <non-prefix> <cusine-spec> <recipe-food-prep-word> |
           <.some-food-prep-word> <interesting-food-prep-word> <cuisine-spec> <recipe-food-prep-word> ]
    }
}