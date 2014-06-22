# CodeBook

This code book describes the tidy data set located in [jacobemerick/uci-har-data](https://github.com/jacobemerick/uci-har-data), 'tidy-data.txt'.

## Variables

- subject: numeric vector of subject ids from study
- activity: character vector describing the activity performed
- tBodyAcc.mean...X: numeric vector of mean of body acceleration in the X direction
- tBodyAcc.mean...Y: numeric vector of mean of body acceleration in the Y direction
- tBodyAcc.mean...Z: numeric vector of mean of body acceleration in the Z direction
- tBodyAcc.std...X: numeric vector of mean of std dev of body acceleration in the Z direction
- ... etc, there are 66 total vectors of different measurements

To see a full list and description of the measurement vectors see 'features_info.txt' in the data package. This tidy data set simply summarizes certain values (mean and std dev) across the subject/activity index for each measurement.

## Non-included Data

There is a lot of other measurements that are not included in the tidy-data set, including medians, correlation, entropy, angles, and more. These variables were not part of the assignment. Also, there is no flag between test and train subjects, as that was also not part of the assignment. If that is a necessary piece it would be trivial to add it in between lines 17 and 28 of the script.

## Summary Choices

This is a decent sized data set with fairly raw data, so it makes sense that we'd want to pick and choose what to include and summarize that. By only looking at the means and deviation of the measurements it is easy to get a grasp on the data. However, performing a mean on the means does introduce a level of inaccuracy. This tidy data set is useful for scanning but probably should not be used to draw detailed conclusions from.

## Source Experiment

The original experiment has lots of helpful documentation about how they collected the data (Samsung Galayx S II accelerometers and gyroscopes), the design of the experiment (random partitioning of participants and recording of activity), and accounting for variability (gravitional force cutoffs). Information and the data can be found [on the UCI website](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones).