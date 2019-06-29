% we can train a nn - save net, load net  and use it for prediction


%digitDatasetPath = fullfile('D:\Sabha\Test\train');

digitDatasetPath = fullfile('D:\Sabha\Test\Training_dataset_2700');
imds = imageDatastore(digitDatasetPath, ...
    'IncludeSubfolders',true,'LabelSource','foldernames');

labelCount = countEachLabel(imds);

disp(labelCount);

img = readimage(imds,1);
size(img)

numTrainFiles = 240;  % each category(or class) of training data has 240 files/samples/images
[imdsTrain,imdsValidation] = splitEachLabel(imds,numTrainFiles);


layers = [
    imageInputLayer([40 65 1])
    
    convolution2dLayer(7,32)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',1)
    
    convolution2dLayer(5,32)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',1)
    
    convolution2dLayer(3,32)
    batchNormalizationLayer
    reluLayer
    maxPooling2dLayer(2,'Stride',1)
    
    fullyConnectedLayer(576)
    reluLayer
    dropoutLayer(0.5)
    
    fullyConnectedLayer(9)
    softmaxLayer
    classificationLayer];

 disp(layers);
 
%options = trainingOptions('rmsprop', 'MaxEpochs',30, 'Verbose',true);

options = trainingOptions('rmsprop', 'ValidationData', imdsValidation, 'ValidationPatience',7, 'Plots','training-progress', 'Verbose',true);


%TrainingRMSE 

%convnet = trainNetwork(data,layers,options);

%trainedNet.performFcn = 'crossentropy';

trainedNet = trainNetwork(imds,layers,options);

YPred = classify(trainedNet,imdsValidation);
YTest = imdsValidation.Labels;
 
accuracy = sum(YPred == YTest)/numel(YTest);

disp(accuracy)

cnn_model_30jan2019_latest_to_use = trainedNet ; %trainedNet is a SeriesNetwork

%save cnn_model trainedNet ;

save cnn_model_30jan2019_latest_to_use;  %saving a SeriesNetwork

rootFolder = 'D:\Sabha\Test\right_eye_images\';
%newImage = imread(fullfile(rootFolder, '1', '1.png'));

%newImage = imread(fullfile(rootFolder, '1', '1.png'));

newImage = imread('D:\Sabha\Test\right_eye_images\1.png');

label = predict(trainedNet, newImage);  % working for this..giving probabilities


disp(label); % output was: 0.0000    0.0121    0.4369    0.0000    0.0042    0.1519    0.0003    0.0329    0.3616





 