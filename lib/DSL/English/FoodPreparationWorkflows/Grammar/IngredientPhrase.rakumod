use v6;

use DSL::Shared::Roles::English::PipelineCommand;
use DSL::Shared::Utilities::FuzzyMatching;

role DSL::English::FoodPreparationWorkflows::Grammar::IngredientPhrase
        does DSL::Shared::Roles::English::PipelineCommand {

    rule ingredient-phrase {
        <carbonhydrates-food-prep-word> |
        <carbs-food-prep-word>    |
        <low-food-prep-word> [ <carbs-food-prep-word> | <proteins-food-prep-word> | <sugars-food-prep-word> ] |
        <high-food-prep-word> [ <carbs-food-prep-word> | <proteins-food-prep-word> | <sugars-food-prep-word> ] |
        <fats-food-prep-word> |
        <proteins-food-prep-word> |
        <saturated-food-prep-word> <fats-food-prep-word> |
        <sugars-food-prep-word> |
        <water-food-prep-word> }

    token carbonhydrates-food-prep-word { 'carbonhydrates' }
    token carbs-food-prep-word { 'carbs' }
    token fats-food-prep-word { 'fats' }
    token high-food-prep-word { 'high' }
    token low-food-prep-word { 'low' }
    token proteins-food-prep-word { 'proteins' }
    token saturated-food-prep-word { 'saturated' }
    token sugars-food-prep-word { 'sugars' }
    token water-food-prep-word { 'water' }
}