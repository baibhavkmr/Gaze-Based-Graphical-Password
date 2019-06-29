img1 = imread('test_img_3.png');
right_eye =  get_right_eye(img1);

HImage=histeq(right_eye);

resized_right_eye = imresize(HImage, [40 65]);

%resized_right_eye = imresize(HImage, [224 224]);

figure, imshow(resized_right_eye);
title('processed and resized right eye');

imwrite(resized_right_eye,'F:\Test\right_eye_images\1.png','png');



%figure
%plot(net);
%title('DAG Network Architecture')