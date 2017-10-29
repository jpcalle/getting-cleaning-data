# Getting and Cleaning Data Final Project

This repo contains the files needed to tidy the dataset of [Human Activity Recognition Using Smartphones](http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones) dataset.

The script run_analysis.R performs all the tidy tasks on the original datasets, given that the datasets are placed in a folder named uci_har_dataset located in the same folder of the script (not in the repo, download fron the [project page](https://www.coursera.org/learn/data-cleaning/peer/FIZtT/getting-and-cleaning-data-course-project)).

The run_analysis.R script returns a new dataset named uci_har_dataset.txt in the same folder of the script.

This should be the working directory structure:

```
project/
|   run_analysis.R
|   uci_har_dataset.txt (not in the repo, returned after running the script)
|
|___uci_har_dataset/ (this folder sold be downloaded from the project page, see link above)
    |    features.txt
    |    activity_labels.txt
    |
    |____train/
    |       X_train.txt
    |       y_train.txt
    |       subject_train.txt
    |
    |____test/
           X_test.txt
            y_test.txt
            subject_test.txt
```
