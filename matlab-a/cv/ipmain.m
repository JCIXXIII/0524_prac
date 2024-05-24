clear all; close all; clc
rgbimg=imread('mandrill.png');

figure(1);
imshow(rgbimg);
title('Mandrill Image')
[r,c]=size(rgbimg,[1,2]);


figure(2);
grayimg=imread('pout.tif');
subplot(1,2,1); imshow(grayimg); title('original');
subplot(1,2,2); imhist(grayimg); title('histeq');

enhanced=histeq(grayimg);
figure(3);
subplot(1,2,1); imshow(enhanced); title('enhanced');
subplot(1,2,2); imhist(enhanced); title('histeq');

%%
gray=rgb2gray(rgbimg);

H1=[-1 0 1;
    -1 0 1;
    -1 0 1;];

H2=[1 1 1;
    0 0 0;
    -1 -1 -1;];

H=fspecial('gaussian',[15,25],10);
M=conv2(gray,H);

figure(4);
subplot(1,2,1); imshow(gray); title('original');
subplot(1,2,2); imshow(abs(M),[]); title('filtered');