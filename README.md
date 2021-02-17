# Food Preparation Workflows

Raku package for facilitating food preparation workflows by using natural language commands (in English.)

Closely related to the work in the repository 
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

say ToFoodPreparationWorkflowCode("i want to cook chicken fried rice", "WL");
``` 
    
