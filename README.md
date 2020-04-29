# DSC 520 - Statistics for Data Science

## Getting Started

Start by cloning or downloading this repository to your local computer.  You can clone this repository using the [Github Desktop Client][github-desktop] or using the Git command line. 

*Clone using SSH*

``` 
git clone git@github.com:bellevue-university/dsc520.git
```

*Clone using HTTPS*

```
git clone https://github.com/bellevue-university/dsc520.git 
```

You will need access to this repository throughout the course, so place it in a reliable location. 

After you are finished cloning or downloading the repository, you will open the repository directory using RStudio.  You can do this by opening RStudio and selecting the `File -> Open Project` option and choosing the directory containing the repository. [Download RStudio][rstudio-download] if you do not already have it installed on your computer. 

## Project Structure

```
.
├── LICENSE
├── README.md           <- This file
├── assignments         <- Assignment templates
│   ├── assignment00
│   ├── assignment01    
. . .
│   └── assignment07    
├── completed           <- Contains expected output for assignments
│   ├── assignment00    <- Example of a completed assignment
│   ├── assignment01
. . .
│   └── assignment07
└── data                <- Data for assignments
    ├── nytimes
    ├── r4ds
    └── tidynomicon
```

## Sample Assignment

Your first step will be to work through a sample assignment so that you can become familiar with R and understand what a sample assignment looks like.  Start by opening up the file `assignments/assignment00/assignment00_LastnameFirstname.R`.  The file contains comments with instructions (comment lines start with one or more \# characters) and code fragments. Usually, underscore characters (`___`) are used as placeholders.    To complete the assignments, you will be expected to replace the placeholders with working code. 

When you are working on an assignment, you should make a copy of any template files to the corresponding assignment folder in the `completed` directory.  Change the name of the file to include your first and last name instead of `_LastnameFirstname.R`.  `completed/assignment00/assignment00_DoeJohn.R` provides a completed example of the sample assignment for student John Doe.  

## Expected Outcome Files

Some assignments contain expected outcome file(s) in the `completed` directory. When present, use these files to check to make sure the output of your assignment matches the expected outcome found in the `completed` directory for that assignment.  

## Data Sources

This repository contains data from multiple sources.  These sources released made this data available under permissive licenses including the [Creative Commons][cc-licenses].  This data is used for educational purposes only. 

* [538][fivethirtyeight-repo]
* [The New York Times][nytimes-covid]
* [R for Data Science][r4ds-repo]
* [Tidynomicon][tidynomicon-repo]


[cc-licenses]: https://creativecommons.org/licenses/by/4.0/legalcode
[dsc520-repo]: https://github.com/bellevue-university/dsc520
[fivethirtyeight-repo]: https://github.com/fivethirtyeight/data/
[github-desktop]: https://desktop.github.com/
[nytimes-covid]: https://github.com/nytimes/covid-19-data
[r4ds]: https://r4ds.had.co.nz/
[r4ds-repo]: https://github.com/hadley/r4ds
[rstudio-download]: https://rstudio.com/products/rstudio/download/
[tidynomicon]: http://tidynomicon.tech/
[tidynomicon-repo]: https://github.com/gvwilson/tidynomicon
