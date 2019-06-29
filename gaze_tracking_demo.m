
load cnn_model_new ;

rootFolder = 'F:\Sabha\Test\right_eye_images\';
%newImage = imread(fullfile(rootFolder, '1', '1.png'));

%newImage = imread(fullfile(rootFolder, '1', '1.png'));

newImage = imread('F:\Test\right_eye_images\1.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\2.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\3.png');
label = predict(cnn_model_new,newImage);
disp(label);



newImage = imread('F:\Test\right_eye_images\4.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\5.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\6.png');
label = predict(cnn_model_new,newImage);
disp(label);

newImage = imread('F:\Test\right_eye_images\7.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\8.png');
label = predict(cnn_model_new,newImage);
disp(label);


newImage = imread('F:\Test\right_eye_images\9.png');
label = predict(cnn_model_new,newImage);
disp(label);

