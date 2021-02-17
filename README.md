# Food Preparation Workflows 

## In brief

This Raku Perl 6 package has grammar classes and action classes for the parsing and
interpretation of spoken commands that specify Food Preparation (FP) workflows.

It is envisioned that the interpreters (actions) are going to target different
programming languages: R, Mathematica, Python, etc.

This project is closely related to the project
[SousChefSusana](https://github.com/sgizm/SousChefSusana).
  
## Installation

**1.** Install Raku (Perl 6) : https://raku.org/downloads . 

**2.** Make sure you have Zef Module Installer. 
 
   - Type in `zef --version` in the command line.
   - Zef Module Installer can be installed from : https://github.com/ugexe/zef .

**3.** Open a command line program. (E.g. Terminal on Mac OS X.)

**4.** Run the commands:

```
zef install https://github.com/antononcube/Raku-DSL-Shared.git
zef install https://github.com/antononcube/Raku-DSL-English-FoodPreparationWorkflows.git
```


## Examples

Open a Raku IDE or type `raku` in the command line program. Try this Raku code:

```raku
use DSL::English::FoodPreparationWorkflows;

say ToFoodPreparationWorkflowCode(
    "what dish can i cook in the next two hours?
     why did you recommend that?",
    "WL-FoodPrepMon");
``` 
    
Here is a more complicated, statistics pipeline specification:

```raku
say ToFoodPreparationWorkflowCode(
    "how many people ate dishes with feta last month;
     what is the breakdown of calories over food groups;
     where carbs are consumed the most;
     plot the results;", "WL-FoodPredMon")
```

Here is a recommendations (by collaborative filtering) specification:

```raku
say ToFoodPreparationWorkflowCode(
    "what people like me ate last week;
     which of those I can cook tonight;
     show me the ingredients and tools;", "WL-FoodPredMon")
```

The command above should print out WL code for the WL package `...`, \[AA1\]:

    TBD...

## References

TBD...
