use DSL::Entity::Foods::Actions::WL::System;
use DSL::Entity::Geographics::Actions::WL::System;
use DSL::Shared::Actions::English::TimeIntervalSpecRefPoint;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Entity::Actions::WL::System;

class DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard
        is DSL::Shared::Actions::English::TimeIntervalSpecRefPoint
        is DSL::Shared::Entity::Actions::WL::System {

    ##=====================================================
    ## General
    ##=====================================================
    has Str $.userID is rw;

    has DSL::Entity::Foods::Actions::WL::System $.foodsActions;
    has DSL::Entity::Geographics::Actions::WL::System $.geoActions;


    method makeUserIDTag() {
        ( ! $.userID.defined or $.userID.chars == 0 or $.userID (elem) <NONE NULL>) ?? '' !! '"' ~ $.userID ~ '"';
    }

    method make-time-interval-predicate( %tiSpecArg ) {
        my %tiSpec = self.normalize-time-interval-spec(%tiSpecArg);
        'между ' ~ %tiSpec<From> ~ ' и ' ~ %tiSpec<To>;
    }

    ##=====================================================
    ## TOP
    ##=====================================================
    method TOP($/) { make $/.values[0].made; }

    ##=====================================================
    ## Introspection
    ##=====================================================
    method introspection-query-command($/) { make $/.values[0].made; }

    ##-----------------------------------------------------
    method introspection-data-retrieval ($/) {

        my $tiPred = '';
        my $pred = '';
        my $cookPred = '';

        with $<time-interval-spec> {
            my %tiSpec = $<time-interval-spec>.made;
            $tiPred = self.make-time-interval-predicate(%tiSpec);
        };

        with $<introspection-action><cook> or $<introspection-action><cooked> {
            $cookPred = 'готвени ';
        }

        with $<food-cuisine-spec> {
            $pred = self.food-cuisine-spec($<food-cuisine-spec>, :!tag).lc;
        }

        my Str $userIDPred = ($.userID.defined and $.userID.chars > 0) ?? 'за потребителя "' ~ $.userID ~ '" ' !! '';

        my Str $foods = $cookPred ~ 'храненета';

        if $tiPred.chars > 0 and $pred.chars > 0 {
            make $userIDPred ~ $foods ~ ', които са ' ~ $tiPred ~ ', и за които ' ~ $pred;
        } elsif  $tiPred.chars > 0 {
            make $userIDPred ~ $foods ~ ', които са ' ~ $tiPred;
        } elsif $pred.chars > 0 {
            make $userIDPred ~ $foods ~ ', за които ' ~ $pred;
        } else {
            make $foods ~ ' ' ~ $userIDPred;
        }
    }

    ##-----------------------------------------------------
    method introspection-counts-query($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'брой на ' ~ $res;
    }

    ##-----------------------------------------------------
    method introspection-profile-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Обобщи ' ~ $res;
    }

    ##-----------------------------------------------------
    method introspection-last-time-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Кои са последните ' ~ $res;
    }

    ##-----------------------------------------------------
    method introspection-when-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Кога ' ~ $res;
    }

    ##-----------------------------------------------------
    method introspection-timeline-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Покажи времева линия за ' ~ $res;
    }

    ##=====================================================
    ## Ingredient query
    ##=====================================================
    method ingredient-query-command($/) {
        die 'ingredient-query-command:: Не е имплементирано !!!';
    }

    ##=====================================================
    ## Recommendations
    ##=====================================================
    method recommendations-command($/) {
        with $<cook-phrase> {
            make 'Препоръчай рецепти за готвене' ~ ($.userID.chars > 0 ?? ' за потребителя ' ~ self.makeUserIDTag() !! '')
        } orwith $<recipe-phrase> {
            make 'Препоръчай рецепти' ~ ($.userID.chars > 0 ?? ' за потребителя ' ~ self.makeUserIDTag() !! '')
        } else {
            make 'Препоръчай ястия или храни' ~ ($.userID.chars > 0 ?? ' за потребителя ' ~ self.makeUserIDTag() !! '')
        }
    }

    ##=====================================================
    ## Recommendations by profile
    ##=====================================================
    method recommendations-by-profile-command($/) {
        my Str @resProfile;

        if $<food-quality-spec> {
             @resProfile.append($<food-quality-spec>.made)
        }

        if $<period-meal-spec> {
             @resProfile.append($<period-meal-spec>.made)
        }

        if $<mixed-food-spec-list> {
             @resProfile.append($<mixed-food-spec-list>.made)
        }

        if self.makeUserIDTag().chars > 0 {
            make 'За потребителя ' ~ self.makeUserIDTag() ~ ' препоръчай ястия, храни или рецепти, които изпълняват условията: ' ~ @resProfile.join(', ');
        } else {
            make 'Препоръчай ястия, храни или рецепти, които изпълняват условията: ' ~ @resProfile.join(', ');
        }
    }

    ##=====================================================
    ## Fundamental tokens / rules
    ##=====================================================
    method entity-country-adjective($/) {
        make $/.Str.lc;
    }

    method entity-country-name($/) {
        make $/.Str.lc;
    }

    method entity-region-name($/) {
        make $/.Str.lc;
    }

    method food-cuisine-spec($/) {
        make 'Кухнята е "' ~ $/.values[0].made ~ '"';
    }

    method period-meal-spec($/) {
        make 'Времето на хранене е "' ~ $/.Str.trim.lc ~ '"';
    }

    method mixed-food-spec-list($/) {
        make $/.values>>.made.flat;
    }

    method food-quality-spec($/) {
        make $/.values[0].made;
    }

    method ingredient-spec-list($/) {
        make 'Съставките включват: ' ~ $/.values>>.made.join(', ');
    }

    method ingredient-spec($/) {
        make '"' ~ $/.Str.trim.lc ~ '"';
    }
}
