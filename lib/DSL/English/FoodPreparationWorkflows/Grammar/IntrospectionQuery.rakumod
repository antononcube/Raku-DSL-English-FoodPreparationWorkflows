use v6;

role DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery {

    rule introspection-query-command {
        <.how-food-prep-word> <many-food-prep-word> <times-food-prep-word> <i-food-prep-word> <.had-food-prep-word> <food-cuisine-spec> <last-food-prep-word> <year-food-prep-word>       |
        <.what-food-prep-word> <.do-verb> <.i-food-prep-word> [ <eat-food-prep-word> | <cook-food-prep-word> | <prepare-food-prep-word>] [ <.for-preposition> | <.at-preposition> | <.during-preposition>] <period-spec> |
        <.what-food-prep-word> <.kind-food-prep-word> <.of-preposition> <entity-food-name> <.i-food-prep-word> <.make-food-prep-word> <.most-food-prep-word> <.often-food-prep-word> |
        <.when-food-prep-word> <was-food-prep-word> <.the-determiner> <last-food-prep-word> <time-food-prep-word> <.i-food-prep-word> <cooked-food-prep-word> <food-cuisine-spec> }
}