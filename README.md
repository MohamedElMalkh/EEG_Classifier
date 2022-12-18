# EEG_Classifier
classification technique for the EEG records depending on the spectogram of the edf data using STFT from matlab.


The project is done over 3 steps mainly:
1- constructing the stft spectogram pictures from edf data and make analysis to construct the data sets
2- data set construction based on many combination as illustrated below.
3- training the model and get the accuracies on the different parameters.


////////////////////////////////////////////////////
/////////////Illustrating the result:///////////////
////////////////////////////////////////////////////

This model is done to work over small segments to detect if this segment contain seizure or not

The data set is done on ch12_29,27,09,10 and for testing ch02_16


Changing the parameters that make the dataset is done to make the classification
For about 29 channels without nulls.

Changing the window type
1- Rect : accuracy 0.9582          
2- Tri : accuracy 0.9656
3- Ham : accuracy 0.9861

Changing the window length
1- 256 : accuracy 0.9826
2- 512: accuracy 0.9708

Changing the fft size
1- 256: accuracy 0.9839
2- 512: accuracy 0.9777

Overlap and without Overlap
	1- Overlap: accuracy 0.9801
	2-NoOverlap: accuracy 0.9727

Changing the number of channels by choosing random 3 sequence channels and taking the average of them, also with all the previous combinations.
Best accuracy : 0.9963


Comments:

It is recognized that hamming gives better accuracy for the validation data and however increasing the number of sean frequencies reduces the ability of the model to recognize the specific frequencies of the Seizures and Free data. In addition, overlapping which gives more resolution in time,increases the accuracy.
Important point, averaging three channels gives better accuracy than depending on each one channel in the dataset. 


The above accuracy is considered as a validation result as it is a data from different records to the same patient.However when trying the data on another patient it gives about the same accuracy as shown in the above figure.

