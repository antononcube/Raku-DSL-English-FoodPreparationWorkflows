=begin comment
#==============================================================================
#
#   Food Preparation Workflows WL-System actions in Raku (Perl 6)
#   Copyright (C) 2021  Anton Antonov
#
#   This program is free software: you can redistribute it and/or modify
#   it under the terms of the GNU General Public License as published by
#   the Free Software Foundation, either version 3 of the License, or
#   (at your option) any later version.
#
#   This program is distributed in the hope that it will be useful,
#   but WITHOUT ANY WARRANTY; without even the implied warranty of
#   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#   GNU General Public License for more details.
#
#   You should have received a copy of the GNU General Public License
#   along with this program.  If not, see <http://www.gnu.org/licenses/>.
#
#   Written by Anton Antonov,
#   antononcube @ posteo . net,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku (Perl6) see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::English::FoodPreparationWorkflows::Grammar;
use DSL::Shared::Actions::English::WL::PipelineCommand;
use DSL::Entity::English::Foods::Grammar::EntityNames;

use DSL::English::RecommenderWorkflows::Grammar;


class DSL::English::FoodPreparationWorkflows::Actions::WL::System
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has Str $.userID;

    method makeUserIDTag() {
        $.userID.chars > 0 ?? '"UserID:' ~ $.userID ~ '"' !! '';
    }

    method TOP($/) { make $/.values[0].made; }

    #method TOP($/) { make 'Not implemented.'; }

    method data-query-command($/)  {
        make $.Str;
        # make 'SELECT Sum(Quantity) FROM inventory WHERE Name == ' ~ $<food-entity> ~ ' AND Location == ' ~ $<location-spec>;
        make 'Total[dsInvetory[Select[#Name == "' ~ $<food-entity> ~ '" && #Location == "' ~ $<location> ~'" &]][All,Quantity"]]';
    }
    method location-spec($/) { make $.Str; }

    method introspection-query-command($/) {
        die 'introspection-query-command:: Not implemented yet !!!';
    }

    method ingredient-query-command($/) {
        die 'ingredient-query-command:: Not implemented yet !!!';
    }

    method recommendations-command($/) {
        make 'smrSCS ==> SMRRecommend[' ~ self.makeUserIDTag() ~'] ==> SMRMonJoinAcross["Warning"->False] ==> SMRMonTakeValue[]';
    }

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

        if $.userID.chars > 0 {
            @resProfile = @resProfile.append(self.makeUserIDTag())
        }

        #make to_DSL_code('USE TARGET SMRMon-R; use smrSCS; recommend by profile ' ~ @resProfile.join(', ') ~ '; echo pipeline value;');
        make 'smrSCS ==> SMRMonRecommendByProfile[ {' ~ @resProfile.join(', ') ~ '} ] ==> SMRMonJoinAcross["Warning"->False] ==> SMRMonTakeValue[]';
    }

    method entity-country-adjective($/) {
        make $/.Str.lc;
    }

    method entity-country-name($/) {
        make $/.Str.lc;
    }

    method food-cuisine-spec($/) {
        make '"Cuisine:' ~ $/.values[0].made ~ '"';
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
