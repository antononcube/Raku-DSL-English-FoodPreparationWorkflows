use DSL::English::FoodPreparationWorkflows::Grammar;
use DSL::Shared::Actions::English::R::PipelineCommand;
use DSL::Entity::Foods::Grammar::EntityNames;
#use DSL::Entity::Finish::Foods::Grammar::FoodEntities;
#use DSL::Entity::Swedish::Foods::Grammar::FoodEntities;



class DSL::English::FoodPreparationWorkflows::Actions::R::Ecosystem
        is DSL::Shared::Actions::English::R::PipelineCommand {

    method TOP($/) { make 'Not implemented.'; }

#    method TOP($/) { make $/.values[0].made; }

#    method data-query-command($/)  {
#        make $.Str;
#        # make 'SELECT Sum(Quantity) FROM inventory WHERE Name == ' ~ $<food-entity> ~ ' AND Location == ' ~ $<location-spec>;
#        make 'Total[dsInvetory[Select[#Name == "' ~ $<food-entity> ~ '" && #Location == "' ~ $<location> ~'" &]][All,Quantity"]]';
#    }
#    method location-spec($/) { make $.Str; }
}
