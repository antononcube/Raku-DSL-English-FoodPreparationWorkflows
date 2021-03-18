use v6;

role DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand {

    rule recommendations-command {
        <.can-food-prep-word> <.chef-spec> <.recommend-phrase> <.dishes-food-prep-word> <.with-preposition> <ingredient-phrase> |
        <.recommend-phrase> <.a-determiner>? [ <item-of-food-phrase> <.to-preposition> ] <cook-food-prep-word> |
        <.what-food-prep-word> <.to-preposition> <.cook-phrase> |
        <.recommend-phrase> [
          <.item-of-food-phrase> <.for-prepsoition> <period-spec> |
          <.several-phrase> <item-of-food-phrase> [ <.to-preposition> <.cook-phrase> ]?
        ]
    }

}