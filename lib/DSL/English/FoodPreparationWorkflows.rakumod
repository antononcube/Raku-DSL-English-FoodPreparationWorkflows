
=begin pod

=head1 DSL::English::FoodPreparationWorkflows

C<DSL::English::FoodPreparationWorkflows> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify data acquisition workflows.

=head1 Synopsis

    use DSL::English::FoodPreparationWorkflows;
    my $rcode = ToFoodPreparationWorkflowCode('i want to work with large time series data');

=end pod

unit module DSL::English::FoodPreparationWorkflows;

use DSL::Shared::Utilities::CommandProcessing;

use DSL::Entity::Foods;
use DSL::Entity::Geographics;

use DSL::English::FoodPreparationWorkflows::Grammar;
use DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard;
use DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem;

#-----------------------------------------------------------
my %targetToAction{Str} =
        "Bulgarian"         => DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard,
        "Mathematica"       => DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem,
#        "Python"            => DSL::English::FoodPreparationWorkflows::Actions::Python::Ecosystem,
#        "Python-Ecosystem"  => DSL::English::FoodPreparationWorkflows::Actions::Python::Ecosystem,
#        "R"                 => DSL::English::FoodPreparationWorkflows::Actions::R::Ecosystem,
#        "R-Ecosystem"       => DSL::English::FoodPreparationWorkflows::Actions::R::Ecosystem,
#        "Raku"              => DSL::English::FoodPreparationWorkflows::Actions::Raku::Ecosystem,
#        "Raku-Ecosystem"    => DSL::English::FoodPreparationWorkflows::Actions::Raku::Ecosystem,
        "WL"                => DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem,
        "WL-System"         => DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem,
        "WL-Ecosystem"      => DSL::English::FoodPreparationWorkflows::Actions::WL::Ecosystem;

my %targetToAction2{Str} = %targetToAction.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::') => $_.value }).Hash;
%targetToAction = |%targetToAction , |%targetToAction2;


my %targetToSeparator{Str} =
        "Bulgarian"        => "\n",
        "Mathematica"      => "\n",
        "Python"           => "\n",
        "Python-Ecosystem" => "\n",
        "R"                => " ;\n",
        "R-Ecosystem"      => " ;\n",
        "Raku"             => " ;\n",
        "Raku-Ecosystem"   => " ;\n",
        "WL"               => ";\n",
        "WL-Ecosystem"     => ";\n",
        "WL-System"        => ";\n";

my Str %targetToSeparator2{Str} = %targetToSeparator.grep({ $_.key.contains('-') }).map({ $_.key.subst('-', '::') => $_.value }).Hash;
%targetToSeparator = |%targetToSeparator , |%targetToSeparator2;


#-----------------------------------------------------------
my DSL::Entity::Foods::Actions::WL::System       $foodsActions .= new( resources => DSL::Entity::Foods::resource-access-object() );
my DSL::Entity::Geographics::Actions::WL::System $geoActions   .= new( resources => DSL::Entity::Geographics::resource-access-object()  );

#-----------------------------------------------------------
sub FoodPreparationWorkflowsGrammar() is export {
    my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
    $pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
    $pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());
    return $pCOMMAND;
}

#-----------------------------------------------------------
proto ToFoodPreparationWorkflowCode(Str $command, Str $target = 'WL-Ecosystem', | ) is export {*}

multi ToFoodPreparationWorkflowCode ( Str $command, Str $target = 'WL-Ecosystem', *%args ) {

    my $pCOMMAND = FoodPreparationWorkflowsGrammar();

    my $ACTOBJ = %targetToAction{$target}.new(:$foodsActions, :$geoActions);

    DSL::Shared::Utilities::CommandProcessing::ToWorkflowCode($command,
                                                              grammar => $pCOMMAND,
                                                              targetToAction => %($target => $ACTOBJ),
                                                              :%targetToSeparator,
                                                              :$target,
                                                              |%args )
}
