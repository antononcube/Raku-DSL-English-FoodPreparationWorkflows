use v6;

role DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery {

    rule introspection-query-command {
        <introspection-counts-query> |
        <introspection-profile-query> |
        <introspection-last-time-query> |
        <introspection-when-query> |
        <introspection-timeline-query>
    }

    ## Counts
    rule introspection-counts-query {
        <.how-many-times-phrase> <user-spec> [ <ate-phrase> | <cooked-phrase> ] <food-cuisine-spec> <time-interval-spec>
    }
    rule how-many-times-phrase {
        [ <.what-pronoun> <.number-noun> <.of-preposition> | <.how-adverb> <.many-food-prep-word> ] <.times-noun>
    }

    ## Kind of food
    rule introspection-profile-query {
        <.what-food-prep-word> [ <.do-verb> | <.did-food-prep-word> ] <user-spec> <introspection-action>
           [ [ <.for-preposition> | <.at-preposition> | <.during-preposition> | <.in-preposition> ] <period-spec> <period-meal-spec>? | <time-interval-spec> ] |
        <.what-food-prep-word> <.kind-food-prep-word> <.of-preposition> <entity-food-name> <user-spec> <.make-food-prep-word> <.most-food-prep-word> <.often-food-prep-word>
    }

    rule introspection-action { <eat=.eat-phrase> | <cook=.cook-phrase> | <ate=.ate-phrase> | <cooked=.cooked-phrase> }

    ## Point-in-time
    rule introspection-last-time-query {
        <.when-food-prep-word> <.was-food-prep-word> <.the-determiner> <last-food-prep-word> <time-food-prep-word> <user-spec> [ <cooked-phrase> | <eat-phrase> ] <food-cuisine-spec> }

    ## When
    rule introspection-when-query {
        <.at-what-time-phrase> <.did-food-prep-word> <user-spec> [ <cooked-phrase> | <eat-phrase> ] <food-cuisine-spec>
    }
    rule at-what-time-phrase { <when-pronoun> | <at-preposition>? <what-pronoun> <time-noun> }

    ## Timeline
    rule introspection-timeline-query { <what-timeline-phrase> <user-spec> [ <cooked-phrase> | <eat-phrase> ] <food-cuisine-spec> }
    rule what-timeline-phrase { <what-pronoun> <is-verb> <the-determiner>? <timeline-noun> }
}