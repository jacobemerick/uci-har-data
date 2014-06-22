uci-har-data
============

R Script to clean up a UCI HAR data set

## Introduction

This here repo is Jacob Emerick's submission for Getting and Cleaning Data (week 3 assignment). The submission includes the original data set, a script for cleaning up the data, instructions, and the final output of the script.

## Instructions

Simply run 'run_analysis.R' in the same working directory as the UCI HAR data set. There is one dependency that the script will attempt to boot (reshape2)[http://cran.r-project.org/web/packages/reshape2/reshape2.pdf]. Upon completion the script will write to a file 'tidy-data.csv' in the same directory. More information about the format of the output can be found in 'CodeBook.md'.

## Script Description

The script is pretty simple.

1. Load in dependency, error out if not found.
2. Load in cross-used data
3. Build test and train data, binding as necessary.
4. Merge test, train, and verbose activity names. Drop variables here if they are unneeded.
5. Parse out the columns of interest.
6. Recast data set, running operations across rows as needed.
7. Write data set and drop last variable.

## Dataset Source.

Jorge L. Reyes-Ortiz, Davide Anguita, Alessandro Ghio, Luca Oneto.

Smartlab - Non Linear Complex Systems Laboratory

DITEN - UniversitÃ  degli Studi di Genova, Genoa I-16145, Italy.

activityrecognition '@' smartlab.ws

(www.smartlab.ws)[http://www.smartlab.ws]

