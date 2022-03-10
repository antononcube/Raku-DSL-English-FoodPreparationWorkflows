use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;
use DSL::Shared::Entity::Grammar::EntityNames;

role DSL::English::FoodPreparationWorkflows::Grammar::IngredientSpec
        does DSL::Shared::Entity::Grammar::EntityNames
        does DSL::Shared::Roles::English::PipelineCommand {

    rule ingredient-spec-list { <ingredient-spec>+ % <.list-separator> }

    rule ingredient-spec {
        [ <low-adjective> | <lower-adjective> | <high-adjective> | <higher-adjective> ]?
        [
         <carbonhydrates-food-prep-word> |
         <carbs-food-prep-word> |
         <calorie-food-prep-word> |
         <calories-food-prep-word> |
         <carrots-food-prep-word> |
         <fat-food-prep-word> |
         <fats-food-prep-word> |
         <fatty-food-prep-word> |
         <protein-food-prep-word> |
         <proteins-food-prep-word> |
         <fats-food-prep-word> |
         <saturated-food-prep-word> <fats-food-prep-word> |
         <sugars-food-prep-word> |
         <sweet-food-prep-word> |
         <water-food-prep-word> ] }

    rule food-quality-spec {
        <ingredient-spec-list>
    }

    token carbonhydrates-food-prep-word { 'carbonhydrates' }
    token carrots-food-prep-word { 'carrots' }
    token carbs-food-prep-word { 'carbs' }
    token calorie-food-prep-word { 'calorie' }
    token calories-food-prep-word { 'calories' }
    token fat-food-prep-word { 'fat' }
    token fats-food-prep-word { 'fats' }
    token fatty-food-prep-word { 'fatty' }
    token protein-food-prep-word { 'protein' }
    token proteins-food-prep-word { 'proteins' }
    token saturated-food-prep-word { 'saturated' }
    token sugars-food-prep-word { 'sugars' }
    token sweet-food-prep-word { 'sweet' }
    token water-food-prep-word { 'water' }

    #--------------------------------------------------------
    # Entity names parsing
    #--------------------------------------------------------
    regex entity-country-adjective {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-geographics-resources().known-name('Country-Adjective', $0.Str.lc) }>
    }

    regex entity-country-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-geographics-resources().known-name('Country', $0.Str.lc) }>
    }

    regex entity-region-adjective {
        (<word-value>+ % \h+ ) <?{ self.get-geographics-resources().known-name( 'Region-Adjective', $0.Str.lc) }>
    }

    regex entity-region-name {
        ( <word-value>+ % \h+ ) <?{ self.get-geographics-resources().known-name('Region', $0.Str.lc) }>
    }

    regex entity-food-name {
        ( [ <.wbpl> <entity-name-part> <.wbpr> ]+ % \h+ ) <?{ self.get-foods-resources().known-name('food', $0.Str.lc) }>
    }
}