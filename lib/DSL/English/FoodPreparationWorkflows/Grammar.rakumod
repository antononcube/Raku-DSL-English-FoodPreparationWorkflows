=begin comment
#==============================================================================
#
#   Food preparation workflows grammar in Raku
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
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::English::FoodPreparationWorkflows::Grammar::FoodEntities;

grammar DSL::English::FoodPreparationWorkflows::Grammar
        does DSL::Shared::Roles::ErrorHandling
        does DSL::English::FoodPreparationWorkflows::Grammar::FoodEntities {
    # TOP
    rule TOP {
        <pipeline-command> |
        <food-entity-command>
    }

    rule food-entity-command { 'i' [ 'want' | 'crave' ] <food-entity> }
}

