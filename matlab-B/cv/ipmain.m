clear all; close all; clc

%% image loading
rgbimg = imread("mandrill.png");
%% display image
figure(1);
imshow(rgbimg);
% display image
title('Mandrill Image');
% getting dimensions for image
[r,c]=size(rgbimg,[1,2]);

%% Histogram equalization
figure(2);
grayimg = imread('pout.tif');
subplot(1,2,1);
imshow(grayimg);
title('original');
subplot(1,2,2);
imhist(grayimg);
title('histeq');

enhanced = histeq(grayimg);

figure(3);
subplot(1,2,1);
imshow(enhanced); 
title('enhanced');
subplot(1,2,2);
imhist(enhanced);
title('histeq');

%% Convolution
gray = rgb2gray(rgbimg);
H = [-1 0 1;
     -1 0 1;
     -1 0 1;];

M = conv2(gray, H);


figure(4);
subplot(1,2,1);
imshow(gray);
title('original');
subplot(1,2,2);
imshow(abs(M),[]);
title('filtered');

%% Gaussian Filter
gray = rgb2gray(rgbimg);
H = fspecial('gaussian', [15,15], 10);
M = conv2(gray, H);

figure(5);
subplot(1,2,1);
imshow(gray);
title('original');
subplot(1,2,2);
imshow(abs(M),[]);
title('Gaussian Filtering');

