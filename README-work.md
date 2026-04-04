# Food Preparation Workflows 


[![MacOS](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/macos.yml/badge.svg)](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/macos.yml)
[![Linux](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/linux.yml/badge.svg)](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/linux.yml)
[![Win64](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/windows.yml/badge.svg)](https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows/actions/workflows/windows.yml)
[![https://raku.land/zef:antononcube/DSL::English::FoodPreparationWorkflows](https://raku.land/zef:antononcube/DSL::English::FoodPreparationWorkflows/badges/version)](https://raku.land/zef:antononcube/DSL::English::FoodPreparationWorkflows)


## In brief

This Raku Perl 6 package has grammar classes and action classes for the parsing and
interpretation of spoken commands that specify Food Preparation (FP) workflows.

It is envisioned that the interpreters (actions) are going to target different
programming languages: R, Mathematica, Python, Raku, etc.

This project is closely related to the project
[SousChefSusana](https://github.com/antononcube/ConversationalAgents/tree/master/Projects/SousChefSusana).
  
This diagram shows the conversational agent components this grammar addresses:

[![SousChefSusanaComponents](https://github.com/antononcube/ConversationalAgents/raw/master/Projects/SousChefSusana/Diagrams/Sous-Chef-Susana-design-small.jpg)](https://github.com/antononcube/ConversationalAgents/raw/master/Projects/SousChefSusana/Diagrams/Sous-Chef-Susana-design.jpg)

## Installation

### Standard/typical

From [Zef ecosystem](https://raku.land):

```
zef install DSL::English::FoodPreparationWorkflows
```

From GitHub:

```
zef install https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows.git
```

### Manual installation

The preliminary versions of this package required manual installation.
These steps might be helpful for certain development efforts.

**1.** Install Raku : https://rakudo.org/downloads . 

**2.** Make sure you have Zef Module Installer. 
 
   - Type in `zef --version` in the command line.
   - Zef Module Installer can be installed from : https://github.com/ugexe/zef .

**3.** Open a command line program. (E.g. Terminal on Mac OS X.)

**4.** Run the commands:

```
zef install https://github.com/antononcube/Raku-DSL-Shared.git
zef install https://github.com/antononcube/Raku-DSL-Entity-English-Foods.git
zef install https://github.com/antononcube/Raku-DSL-Entity-English-Geographics.git
zef install https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows.git
```

-----

## Examples

### Grammar parsing

Manual setup for parsing with the grammar provided by the package:

```raku
use DSL::English::FoodPreparationWorkflows;
use DSL::Entity::Foods;
use DSL::Entity::Geographics;

my $pCOMMAND = DSL::English::FoodPreparationWorkflows::Grammar;
$pCOMMAND.set-foods-resources(DSL::Entity::Foods::resource-access-object());
$pCOMMAND.set-geographics-resources(DSL::Entity::Geographics::resource-access-object());
$pCOMMAND.WHAT
```

Here is a "recommendation by profile" command parsing:

```raku
$pCOMMAND.parse('can you suggest a local cuisine')
```

Here is an "ingredients query" command parsing:

```raku
$pCOMMAND.parse('what number of dishes have low carbs')
```

### Interpretation

The following commands give interpretations to a Wolfram Language (WL) recommender made based on 
the WL paclet ["MonadicSparseMatrixRecommender"](https://resources.wolframcloud.com/PacletRepository/resources/AntonAntonov/MonadicSparseMatrixRecommender), [AAp4].

Here is a "recommendation by profile" command interpretation:

```raku
ToFoodPreparationWorkflowCode( 'i want to eat lunch from China', "WL-Ecosystem");
```

Another one:

```raku
ToFoodPreparationWorkflowCode( 'can you suggest dishes with protein', "WL-Ecosystem");
```

Here is the interpretation of an "introspection query":

```raku
ToFoodPreparationWorkflowCode( 'show the timeline of when I ate Greek', "WL-Ecosystem");
```

----

## TODO 

These queries are not parsed or interpreted yet, but the future versions of the package would handle them:

Query for "what to cook now":

```raku, eval=FALSE
ToFoodPreparationWorkflowCode(
    "what dish can i cook in the next two hours?;
     why did you recommend that?",
    "WL-Ecosystem");
``` 
    
Here is a more complicated, statistics pipeline specification:

```raku, eval=FALSE
ToFoodPreparationWorkflowCode(
    "how many people ate dishes with feta last month;
     what is the breakdown of calories over food groups;
     where carbs are consumed the most;
     plot the results;", "WL-Ecosystem")
```

Here is a recommendations (by collaborative filtering) specification:

```raku, eval=FALSE
ToFoodPreparationWorkflowCode(
    "what people like me ate last week;
     which of those I can cook tonight;
     show me the ingredients and tools;", "WL-Ecosystem")
```

Here is the interpretation of an "ingredients query":

```raku, eval=FALSE
ToFoodPreparationWorkflowCode( 'what number of dishes do you know to have high protein', "WL-Ecosystem");
```

## References

[AAp1] Anton Antonov,
[DSL::Shared, Raku package](https://github.com/antononcube/Raku-DSL-Shared),
(2020-2025),
[GitHub/antononcube](https://github.com/antononcube).

[AAp2] Anton Antonov,
[DSL::Entity::Foods, Raku package](https://github.com/antononcube/Raku-DSL-Entity-English-Foods),
(2021-2026),
[GitHub/antononcube](https://github.com/antononcube).

[AAp3] Anton Antonov,
[DSL::Entity::Geographics, Raku package](https://github.com/antononcube/Raku-DSL-Entity-English-Geographics),
(2021-2024),
[GitHub/antononcube](https://github.com/antononcube).

[AAp4] Anton Antonov,
[MonadicSparseMatrixRecommender, Wolfram Language paclet](https://resources.wolframcloud.com/PacletRepository/resources/AntonAntonov/MonadicSparseMatrixRecommender/),
(2024),
[Wolfram Language Paclet Repository](https://resources.wolframcloud.com/PacletRepository).

