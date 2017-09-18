%I--------原始图像
%H--------加入高斯噪声的图像
%h1-------3x3的平均模板
%h2-------5x5的平均模板
%I1-------3x3的平均滤波器对加入高斯噪声图像进行滤波
%I2-------5x5的平均滤波器对加入高斯噪声图像进行滤波
%I3-------3x3的中值滤波器对加入高斯噪声图像进行滤波
%I4-------5x5的中值滤波器对加入高斯噪声图像进行滤波
%G--------加入椒盐噪声的图像
%I5-------3x3的平均滤波器对加入椒盐噪声图像进行滤波
%I6-------5x5的平均滤波器对加入椒盐噪声图像进行滤波
%I7-------3x3的中值滤波器对加入椒盐噪声图像进行滤波
%I8-------5x5的中值滤波器对加入椒盐噪声图像进行滤波
close all;
clear all;
I = imread('dianlu.tif');                %读取原始图像
H = imnoise(I, 'gaussian');              %加入高斯噪声
h1 = fspecial('average');                %设置3x3和5x5的平均滤波器
h2 = fspecial('average', [5, 5]);
I1 = imfilter(H, h1);                    %用各个滤波器对加入高斯噪声的图像进行滤波
I2 = imfilter(H, h2);
I3 = medfilt2(H, [3, 3]);
I4 = medfilt2(H, [5, 5]);

G = imnoise(I, 'salt & pepper');         %加入椒盐噪声
I5 = imfilter(H, h1);                    %用各个滤波器对加入椒盐噪声的图像进行滤波
I6 = imfilter(H, h2);
I7 = medfilt2(H, [3, 3]);
I8 = medfilt2(H, [5, 5]);

%显示图像
figure, subplot(3, 2, 1), imshow(I, []); title('原始图像'); hold on;
subplot(3, 2, 2), imshow(H, []); title('加入高斯噪声'); hold on;
subplot(3, 2, 3), imshow(I1, []); title('3x3模板的平均滤波器'); hold on;
subplot(3, 2, 4), imshow(I2, []); title('5x5模板的平均滤波器'); hold on;
subplot(3, 2, 5), imshow(I3, []); title('3x3模板的中值滤波器'); hold on;
subplot(3, 2, 6), imshow(I4, []); title('5x5模板的中值滤波器');

figure(2), subplot(3, 2, 1), imshow(I, []); title('原始图像'); hold on;
subplot(3, 2, 2), imshow(G, []); title('加入椒盐噪声'); hold on;
subplot(3, 2, 3), imshow(I5, []); title('3x3模板的平均滤波器'); hold on;
subplot(3, 2, 4), imshow(I6, []); title('5x5模板的平均滤波器'); hold on;
subplot(3, 2, 5), imshow(I7, []); title('3x3模板的中值滤波器'); hold on;
subplot(3, 2, 6), imshow(I8, []); title('5x5模板的中值滤波器'); 


