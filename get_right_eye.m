function result = get_right_eye(image)
%faceDetector = vision.CascadeObjectDetector;
FDetect = vision.CascadeObjectDetector;
%img = imread(filename);
img=rgb2gray(image);
%I = IMAGE;
BB = step(FDetect,img);
%figure,
%imshow(img)
%hold on
%for i = 1:size(BB,1)
%   rectangle('Position',BB(i,:),'LineWidth',2,'LineStyle','-','EdgeColor','b');
%end  % BB for face only
if BB>0
    f=imcrop(img,BB); %face detected
    disp('face BB is:');
    disp(BB);
    %figure,
    %imshow(f);
    %fc = f;
    %title('Face Detection');
end
%hold off;

%To detect both eyes, we use the detected face
EyeDetect = vision.CascadeObjectDetector('EyePairBig'); %in the captured image,Left and Right get flipped
%Read the face
BB_eyes=step(EyeDetect,f); %specify face here

if BB_eyes>0
    disp('BB_eyes is:');
    disp(BB_eyes);
    botheyes=imcrop(f,BB_eyes); % both eyes detected, captured
    %figure,
    %imshow(botheyes);
    %title('both eyes Detection, Capture');
end
%result = botheyes;

% To get left, right eyes separately divide/split vertically into 2 parts

  %To detect the right eye - get the left part, because the image captured by webcam is flipped
  
  %right_eye = botheyes(:, 1 : floor(end/2), :); %exactly half of the 2 eyes 
  
  %right_eye = botheyes(:, 1 : floor(end/2 - end*0.2/2) , :);   %further cropping RHS by 20%
  
  right_eye = botheyes(:, 1 : floor(end/2 - end*0.18/2) , :);   %further cropping RHS by 18%
 
  %figure,imshow(right_eye);
  %title('Right eye');
  %To detect the left eye
  %left_eye = botheyes(:, ceil(end/2) : end, :);
  %figure,imshow(left_eye);
  %title('Left eye');
  
   result = right_eye;
end