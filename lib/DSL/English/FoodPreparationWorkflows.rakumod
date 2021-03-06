
=begin pod

=head1 DSL::English::FoodPreparationWorkflows

C<DSL::English::FoodPreparationWorkflows> package has grammar and action classes for the parsing and
interpretation of natural language commands that specify classification workflows.

=head1 Synopsis

    use DSL::English::FoodPreparationWorkflows;
    my $rcode = ToFoodPreparationWorkflowCode('i want to eat Chinese food');

=end pod

unit module DSL::English::FoodPreparationWorkflows;

use DSL::Shared::Utilities::MetaSpecsProcessing;

use DSL::English::FoodPreparationWorkflows::Grammar;
use DSL::English::FoodPreparationWorkflows::Actions::WL::System;

use DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard;

#-----------------------------------------------------------
my %targetToAction =
    "Mathematica"      => DSL::English::FoodPreparationWorkflows::Actions::WL::System,
    "WL"               => DSL::English::FoodPreparationWorkflows::Actions::WL::System,
    "WL-System"        => DSL::English::FoodPreparationWorkflows::Actions::WL::System,
    "Bulgarian"        => DSL::English::FoodPreparationWorkflows::Actions::Bulgarian::Standard;

my %targetToSeparator{Str} =
    "Julia"            => "\n",
    "Julia-DataFrames" => "\n",
    "R"                => " ;\n",
    "Mathematica"      => "\n",
    "WL"               => ";\n",
    "WL-ClCon"         => " ==>\n",
    "WL-System"        => ";\n",
    "Bulgarian"        => "\n";


#-----------------------------------------------------------
sub has-semicolon (Str $word) {
    return defined index $word, ';';
}

#-----------------------------------------------------------
proto ToFoodPreparationWorkflowCode(Str $command, Str $target = 'WL-System', Str :$userID = '' ) is export {*}

multi ToFoodPreparationWorkflowCode ( Str $command where not has-semicolon($command), Str $target = 'WL-System', Str :$userID = '' ) {

    die 'Unknown target.' unless %targetToAction{$target}:exists;

    my $action = %targetToAction{$target}.new(:$userID);

    my $match = DSL::English::FoodPreparationWorkflows::Grammar.parse($command.trim, actions => $action );
    die 'Cannot parse the given command.' unless $match;
    return $match.made;
}

multi ToFoodPreparationWorkflowCode ( Str $command where has-semicolon($command), Str $target = 'WL-System', Str :$userID = '' ) {

    my $specTarget = get-dsl-spec( $command, 'target');
    my $specUserID = get-user-spec( $command, 'user-id');

    $specTarget = $specTarget ?? $specTarget<DSLTARGET> !! $target;
    $specUserID = ($specUserID and $specUserID<USERID> !(elem) <NONE NULL>) ?? $specUserID<USERID> !! $userID;

    die 'Unknown target.' unless %targetToAction{$specTarget}:exists;

    my @commandLines = $command.trim.split(/ ';' \s* /);

    @commandLines = grep { $_.Str.chars > 0 }, @commandLines;

    my @cmdLines = map { ToFoodPreparationWorkflowCode($_, $specTarget, userID => $specUserID) }, @commandLines;

    @cmdLines = grep { $_.^name eq 'Str' }, @cmdLines;

    return @cmdLines.join( %targetToSeparator{$specTarget} ).trim;
}
