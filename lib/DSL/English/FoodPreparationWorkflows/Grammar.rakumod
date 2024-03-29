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
#   ʇǝu˙oǝʇsod@ǝqnɔuouoʇuɐ,
#   Windermere, Florida, USA.
#
#==============================================================================
#
#   For more details about Raku see https://raku.org/ .
#
#==============================================================================
=end comment

use v6;

use DSL::Shared::Roles::English::CommonParts;
use DSL::Shared::Roles::English::TimeIntervalSpec;
use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Roles::PredicateSpecification;
use DSL::Shared::Roles::ErrorHandling;

use DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery;
use DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery;
use DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand;
use DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases;

use DSL::Entity::Foods::ResourceAccess;
use DSL::Entity::Geographics::ResourceAccess;

grammar DSL::English::FoodPreparationWorkflows::Grammar
        does DSL::Shared::Roles::English::TimeIntervalSpec
        does DSL::Shared::Roles::English::PipelineCommand
        does DSL::Shared::Roles::ErrorHandling
        does DSL::English::FoodPreparationWorkflows::Grammar::IntrospectionQuery
        does DSL::English::FoodPreparationWorkflows::Grammar::IngredientQuery
        does DSL::English::FoodPreparationWorkflows::Grammar::RecommendationsCommand
        does DSL::English::FoodPreparationWorkflows::Grammar::FoodPreparationPhrases {

    my DSL::Entity::Foods::ResourceAccess $foodsResources;
    my DSL::Entity::Geographics::ResourceAccess $geographicsResources;

    method get-foods-resources(--> DSL::Entity::Foods::ResourceAccess) { return $foodsResources; }
    method set-foods-resources(DSL::Entity::Foods::ResourceAccess $obj) { $foodsResources = $obj; }

    method get-geographics-resources(--> DSL::Entity::Geographics::ResourceAccess) { return $geographicsResources; }
    method set-geographics-resources(DSL::Entity::Geographics::ResourceAccess $obj) { $geographicsResources = $obj; }

    # TOP
    rule TOP {
        <pipeline-command> ||
        <ingredient-query-command> ||
        <introspection-query-command> ||
        <recommendations-by-profile-command> ||
        <recommendations-command> ||
        <food-entity-command>
    }

    rule love-food-entity-command { 'i' [ 'want' | 'crave' ] [ <entity-food-name> | <drink-entity> | <take-out-entity> ] }

    rule location-spec { 'fridge' | 'refrigerator' | 'pantry' }

    rule cooking-food-entity-command {
        'i' [ 'want' | 'plan' ] 'to' 'cook' <entity-food-name> |
        [ 'tell' 'me' | 'give' 'directions' ] 'how' 'to' 'cook' <entity-food-name> |
        'instruct' 'me' 'to' 'cook' <entity-food-name>
    }

    rule food-entity-command { <entity-food-name> }

}

