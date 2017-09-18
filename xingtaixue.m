%x------------------------原始图像
%x1-----------------------二值化图像
%x2-----------------------膨胀运算
%x3-----------------------腐蚀运算
%x4-----------------------加入椒盐噪声
%x5-----------------------开运算
%x6-----------------------闭运算
clear all;
close all;
x = imread('dianlu.tif');
level = graythresh(x);
x1 = im2bw(x, level);

se1 = strel('disk', 5);
x2 = imerode(x1, se1);

B = [0 1 0
     1 1 1
     0 1 0];
x3 = imdilate(x1, B);

x4 = imnoise(x, 'salt & pepper');
x4 = im2bw(x4, level);
x5 = bwmorph(x4, 'open');
%x5 = bwmorph(x5, 'close');
x6 = bwmorph(x4, 'close');
%x6 = bwmorph(x6, 'open');

figure, subplot(2, 4, 1), imshow(x, []); title('original'); hold on;
subplot(2, 4, 2), imshow(x1, []); title('二值化'); hold on;
subplot(2, 4, 3), imshow(x2, []); title('膨胀'); hold on;
subplot(2, 4, 4), imshow(x3, []); title('腐蚀'); hold on;
subplot(2, 4, 5), imshow(x4, []); title('加入椒盐噪声'); hold on;
subplot(2, 4, 6), imshow(x5, []); title('开运算'); hold on;
subplot(2, 4, 7), imshow(x6, []); title('闭运算'); 

