use DSL::Entity::Foods::Actions::WL::System;
use DSL::Entity::Geographics::Actions::WL::System;
use DSL::Shared::Actions::English::TimeIntervalSpecRefPoint;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Shared::Entity::Actions::WL::System;

class DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem
        is DSL::Shared::Actions::English::TimeIntervalSpecRefPoint
        is DSL::Shared::Entity::Actions::WL::System {

    ##=====================================================
    ## General
    ##=====================================================
    has Str $.userID is rw;

    has DSL::Entity::Foods::Actions::WL::System $.foodsActions;
    has DSL::Entity::Geographics::Actions::WL::System $.geoActions;

    method makeUserIDTag() {
        ( ! $.userID.defined or $.userID.chars == 0 or $.userID (elem) <NONE NULL>) ?? '' !! '"UserID:' ~ $.userID ~ '"';
    }

    method make-time-interval-predicate( %tiSpecArg ) {
        my %tiSpec = self.normalize-time-interval-spec(%tiSpecArg);
        'AbsoluteTime[DateObject["' ~ %tiSpec<From> ~ '"]] <= AbsoluteTime[#Timestamp] <= AbsoluteTime[DateObject["' ~ %tiSpec<To> ~ '"]]'
    }

    # Separator
    method separator() { " \\[DoubleLongRightArrow]\n" }

    ##=====================================================
    ## TOP
    ##=====================================================
    method TOP($/) { make $/.values[0].made; }

    ##=====================================================
    ## Data query
    ##=====================================================
    method data-query-command($/)  {
        make $.Str;
        # make 'SELECT Sum(Quantity) FROM inventory WHERE Name == ' ~ $<food-entity> ~ ' AND Location == ' ~ $<location-spec>;
        make 'Total[dsInventory[Select[#Name == "' ~ $<food-entity> ~ '" && #Location == "' ~ $<location> ~'" &]][All,Quantity"]]';
    }
    method location-spec($/) { make $.Str; }

    ##=====================================================
    ## Introspection
    ##=====================================================
    method introspection-query-command($/) { make $/.values[0].made; }

    ##-----------------------------------------------------
    method introspection-data-retrieval ($/) {

        my $tiPred ='';

        with $<time-interval-spec> {
            my %tiSpec = $<time-interval-spec>.made;
            $tiPred = self.make-time-interval-predicate(%tiSpec);
        };

        if $<introspection-action><cook> or $<introspection-action><cooked> {
            $tiPred ~= ( $tiPred.chars > 0 ?? ' && ' !! ' ') ~ '#Action == "Cook"'
        }

        with $<food-cuisine-spec> {
            $tiPred ~= ( $tiPred.chars > 0 ?? ' && ' !! ' ') ~ 'ToLowerCase[#Cuisine] == "' ~ self.food-cuisine-spec($<food-cuisine-spec>, :!tag).lc ~ '"'
        }

        if $.userID.defined and $.userID.chars > 0 {
            my $userIDPred = '#UserID == "' ~ $.userID ~ '"';
            make 'dsSCSMeals[Select[' ~ $tiPred ~ ' && '~ $userIDPred ~ '&]]'
        } else {
            make $tiPred.chars > 0 ?? 'dsSCSMeals[Select[' ~ $tiPred ~ '&]]' !! 'dsSCSMeals'
        }
    }

    ##-----------------------------------------------------
    method introspection-counts-query($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Length[' ~ $res ~']'
    }

    ##-----------------------------------------------------
    method introspection-profile-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'ResourceFunction["RecordsSummary"][' ~ $res ~']'
    }

    ##-----------------------------------------------------
    method introspection-last-time-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make $res ~'[SortBy[-AbsoluteTime[#Timestamp]&]][1 ;; UpTo[3]]'
    }

    ##-----------------------------------------------------
    method introspection-when-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'SortBy[' ~ $res ~', #Timestamp&]'
    }

    ##-----------------------------------------------------
    method introspection-timeline-query ($/) {
        my $res = self.introspection-data-retrieval($/);
        make 'Block[{dsMeals=' ~ $res ~ '}, GroupBy[Normal@dsMeals, #UserID &, TimelinePlot[#Timestamp -> #PeriodMeal & /@ #, AspectRatio -> 1/4, ImageSize -> Large] &]]'
    }

    ##=====================================================
    ## Ingredient query
    ##=====================================================
    method ingredient-query-command($/) {
        die 'ingredient-query-command:: Not implemented yet !!!';
    }

    ##=====================================================
    ## Recommendations
    ##=====================================================
    method recommendations-command($/) {
        make 'smrSCS' ~ self.separator ~ 'SMRRecommend[' ~ self.makeUserIDTag() ~']' ~ self.separator ~ 'SMRMonJoinAcross["Warning"->False]' ~ self.separator ~ 'SMRMonTakeValue[]';
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
            @resProfile = @resProfile.append(self.makeUserIDTag())
        }

        #make to_DSL_code('USE TARGET SMRMon-R; use smrSCS; recommend by profile ' ~ @resProfile.join(', ') ~ '; echo pipeline value;');
        make 'smrSCS' ~ self.separator ~ 'SMRMonRecommendByProfile[ {' ~ @resProfile.join(', ') ~ '} ]' ~ self.separator ~ 'SMRMonJoinAcross["Warning"->False]' ~ self.separator ~ 'SMRMonTakeValue[]';
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

    method food-cuisine-spec($/, :$tag = True) {
        make $tag ?? '"Cuisine:' ~ $/.values[0].made ~ '"' !! $/.values[0].made;
    }

    method period-meal-spec($/) {
        make '"PeriodMeal:' ~ $/.Str.trim.lc ~ '"';
    }

    method mixed-food-spec-list($/) {
        make $/.values>>.made.flat;
    }

    method food-quality-spec($/) {
        make $/.values[0].made;
    }

    method ingredient-spec-list($/) {
        make $/.values>>.made;
    }

    method ingredient-spec($/) {
        make '"Ingredient:' ~ $/.Str.trim.lc ~ '"';
    }
}
