# Student-Performance-Prediction-ML
Predicting Student Academic Performance Using Machine Learning Techniques (MATLAB Implementation without Toolbox)


Project Overview
This project investigates the prediction of student academic performance using machine learning classification algorithms.

The study utilizes the Student Performance Dataset obtained from the UCI Machine Learning Repository and compares multiple classification approaches implemented in MATLAB.

The objective is to classify students into Pass and Fail categories based on demographic, social, and academic attributes.

Problem Statement

Educational institutions require effective mechanisms for identifying students at risk of academic failure.

This project develops predictive models capable of classifying students based on historical educational data.

Dataset

Dataset: Student Performance Dataset

Source: UCI Machine Learning Repository

Records: 395

Attributes: 33

Target Variable:

Pass = G3 ≥ 10
Fail = G3 < 10
Methodology

The project follows the workflow below:

Dataset
   ↓
Data Preprocessing
   ↓
Feature Encoding
   ↓
Feature Selection
   ↓
Model Training
   ↓
Model Evaluation
   ↓
Performance Comparison
Implemented Models
K-Nearest Neighbors (KNN)
Decision Rule Classifier
Linear Classification Model
Random Forest (Simulated Ensemble)
Experimental Setup

Training Data: 70%

Testing Data: 30%

Performance Metric:

Accuracy
Results
Model	Accuracy
KNN	30.51%
Decision Rule	30.51%
Linear Model	30.51%
Random Forest	53.39%

Best Model:

Random Forest

Accuracy:

53.39%

Software Requirements

MATLAB R2022a or newer

No toolbox required.

Important:

Due to licensing limitations, built-in MATLAB classification functions were not available. Therefore, machine learning models were implemented using algorithmic approximations and base MATLAB functions.

Instructions to Reproduce Results
Step 1

Download the dataset:

student-mat.csv

Place it inside:

data/
Step 2

Open MATLAB.

Step 3

Import dataset:

student_mat = readtable('student-mat.csv');
Step 4

Run:

main_project
Step 5

Observe:

Accuracy comparison chart
Model results table
Confusion matrix
Evaluation outputs
Execution Workflow
Start
  ↓
Load Dataset
  ↓
Create PassFail Target
  ↓
Encode Categorical Variables
  ↓
Train/Test Split
  ↓
Feature Selection
  ↓
Model Training
  ↓
Prediction
  ↓
Accuracy Evaluation
  ↓
Results Visualization
  ↓
End


Author:
Muhammad Rabiata Kani - P25EGCP8026
COEN807 – Machine Learning for Real-World Data Analytics
Department of Computer Engineering
Prgoramme: M.Sc Artificial Intelligence
