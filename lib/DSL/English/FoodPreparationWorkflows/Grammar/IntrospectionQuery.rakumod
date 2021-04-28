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

    rule introspection-action {
        <eat=.eat-phrase> | <cook=.cook-phrase> |
        <ate=.ate-phrase> | <cooked=.cooked-phrase> |
        <ate=.eating-phrase> | <cooked=.cooking-phrase> }

    ## Point-in-time
    rule introspection-last-time-query {
        [ <.when-pronoun> | <.what-pronoun> ] [ <.was-food-prep-word> | <.is-verb> ] <.the-determiner> <last-food-prep-word> <time-food-prep-word> <user-spec> <introspection-action> <food-cuisine-spec>? }

    ## When
    rule introspection-when-query {
        <.at-what-time-phrase> <.did-food-prep-word> <user-spec> <introspection-action> <food-cuisine-spec>?
    }
    rule at-what-time-phrase { <when-pronoun> | <at-preposition>? <what-pronoun> <time-noun> }

    ## Timeline
    rule introspection-timeline-query {
        [ <.display-timeline-phrase> | <.what-timeline-phrase> ] <.of-preposition>? [ <my-determiner> | <our-determiner> ]
            [ <food-cuisine-spec> <introspection-action> | <introspection-action> <.of-preposition>? <food-cuisine-spec>? ] |
        [ <.display-timeline-phrase> | <.what-timeline-phrase> ] <.of-preposition>? [ <.when-pronoun> | <.the-determiner> <.times-food-word-prep> ] <user-spec> <introspection-action> <food-cuisine-spec>? |
        [ <.display-timeline-phrase> | <.what-timeline-phrase> ] [ <.of-preposition> | <.for-preposition> ]? [ <.my-food-prep-word> | <.our-food-prep-word> ]? <introspection-action> [ <.of-preposition> | <.for-preposition> ]? <food-cuisine-spec>?
    }
    rule display-timeline-phrase { [ <display-directive> | <plot-directive> ] <the-determiner>? <timeline-noun> }
    rule what-timeline-phrase { <what-pronoun> <is-verb> <the-determiner>? <timeline-noun> }
}