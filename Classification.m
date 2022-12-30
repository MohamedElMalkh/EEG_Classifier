rootFolder = fullfile('rect');
categories = {'Seziure','Free'};
imds = imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');
tbl = countEachLabel(imds);
minSetCount = min(tbl{:,2});


imds = splitEachLabel(imds, minSetCount,'randomized');
countEachLabel(imds);

seziures = find(imds.Labels == 'Seziure',1);
free = find(imds.Labels == 'Free',1);


net = resnet50();

[trainingSet , testSet] = splitEachLabel(imds, 0.3,'randomized');
imageSize = net.Layers(1).InputSize;

augmentedtrainingSet = augmentedImageDatastore(imageSize,trainingSet);
augmentedtestSet = augmentedImageDatastore(imageSize,testSet);

featureLayer = 'fc1000';
trainingFeatures = activations(net,augmentedtrainingSet,featureLayer,'MiniBatchSize',32,'OutputAs','columns');

trainingLabels = trainingSet.Labels;

classifier = fitcecoc(trainingFeatures,trainingLabels,'Learners','linear',...
    'Coding','onevsall','ObservationsIn','columns');

testFeatures = activations(net,augmentedtestSet,featureLayer,'MiniBatchSize',32,'OutputAs','columns');


predictedLabels = predict(classifier,testFeatures,'ObservationsIn','columns');

testLabels = testSet.Labels;
confMat = confusionmat(testLabels,predictedLabels);
confMat = bsxfun(@rdivide, confMat, sum(confMat,2));
mean(diag(confMat))


rootFolders = fullfile('Test');
categories = {'Seziure','Free'};
im = imageDatastore(fullfile(rootFolder,categories),'LabelSource','foldernames');
seziure = find(im.Labels == 'Seziure',1);
fre = find(im.Labels == 'Free',1);

augmentedtestSets = augmentedImageDatastore(imageSize,im);

featureLayers = 'fc1000';
testFeaturess = activations(net,augmentedtestSets,featureLayers,'MiniBatchSize',32,'OutputAs','columns');
predictedLabelss = predict(classifier,testFeaturess,'ObservationsIn','columns');

testLabelss = im.Labels;
confMats = confusionmat(testLabelss,predictedLabelss);
confMats = bsxfun(@rdivide, confMats, sum(confMats,2));
mean(diag(confMats))

spr