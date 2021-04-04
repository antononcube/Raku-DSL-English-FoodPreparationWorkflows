=begin comment
#==============================================================================
#
#   Food Preparation Workflows Bulgarian DSL actions in Raku (Perl 6)
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


class DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard
        is DSL::Shared::Actions::English::WL::PipelineCommand {

    has Str $.userID;

    method makeUserIDTag() {
        ($.userID.chars == 0 or $.userID (elem) <NONE NULL>) ?? '' !! '"' ~ $.userID ~ '"';
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
        die 'introspection-query-command:: Не е имплементирано !!!';
    }

    method ingredient-query-command($/) {
        die 'ingredient-query-command:: Не е имплементирано !!!';
    }

    method recommendations-command($/) {
        make 'Препоръчай ястия, храни или рецепти' ~ ($.userID.chars > 0 ?? ' за потребителя ' ~ self.makeUserIDTag() !! '');
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

        if self.makeUserIDTag().chars > 0 {
            make 'За потребителя ' ~ self.makeUserIDTag() ~ ' препоръчай ястия, храни или рецепти, които изпълняват условията: ' ~ @resProfile.join(', ');
        } else {
            make 'Препоръчай ястия, храни или рецепти, които изпълняват условията: ' ~ @resProfile.join(', ');
        }
    }

    method entity-country-adjective($/) {
        make $/.Str.lc;
    }

    method entity-country-name($/) {
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
