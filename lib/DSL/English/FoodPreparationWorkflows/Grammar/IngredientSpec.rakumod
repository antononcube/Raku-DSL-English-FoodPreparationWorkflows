use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

role DSL::English::FoodPreparationWorkflows::Grammar::IngredientSpec
        does DSL::Shared::Roles::English::PipelineCommand {

    rule ingredient-spec {
        [ <low-food-prep-word> | <high-food-prep-word> ]?
        [
         <carbonhydrates-food-prep-word> |
         <carbs-food-prep-word> |
         <fats-food-prep-word> |
         <protein-food-prep-word> |
         <proteins-food-prep-word> |
         <fats-food-prep-word> |
         <saturated-food-prep-word> <fats-food-prep-word> |
         <sugars-food-prep-word> |
         <water-food-prep-word> ] }

    token carbonhydrates-food-prep-word { 'carbonhydrates' }
    token carbs-food-prep-word { 'carbs' }
    token fats-food-prep-word { 'fats' }
    token high-food-prep-word { 'high' }
    token low-food-prep-word { 'low' }
    token protein-food-prep-word { 'protein' }
    token proteins-food-prep-word { 'proteins' }
    token saturated-food-prep-word { 'saturated' }
    token sugars-food-prep-word { 'sugars' }
    token water-food-prep-word { 'water' }
}