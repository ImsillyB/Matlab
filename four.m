%I----------------------------玫瑰花图像
%Ir---------------------------玫瑰花红色波段
%Ig---------------------------玫瑰花绿色波段
%Ib---------------------------玫瑰花蓝色波段;
%ir---------------------------红色波段直方图变换后
%ig---------------------------绿色波段直方图变换后
%ib---------------------------蓝色波段直方图变换后
%X----------------------------多光谱图像；
%x1&x2&x3---------------------多光谱图像的三个波段；
%x----------------------------三个波段的合成图像；
%H----------------------------lenna的图像
%HR---------------------------图像的红色波段
%HG---------------------------图像的绿色波段
%HB---------------------------图像的蓝色波段
%hr_1&hr_2--------------------变换后的红色波段
%hg_1&hr_2--------------------变换后的绿色波段
%hb_1&hb_2--------------------变换后的蓝色波段


clear all;
close all;
I = imread('D:\汪梓鑫\实验报告\数字图像处理\dip\img\数字图像处理实验_4389.png');
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);

figure(1), subplot(2, 2, 1), imshow(I, []); title('原始图像'); hold on;
subplot(2, 2, 2), imshow(Ir, []); title('红色分量'); hold on;
subplot(2, 2, 3), imshow(Ig, []); title('绿色分量'); hold on;
subplot(2, 2, 4), imshow(Ib, []); title('蓝色分量'); 

figure(2), subplot(3, 3, 1), imhist(uint8(Ir)); title('r分量的灰度直方图'); grid on; hold on;
subplot(3, 3, 2), imhist(uint8(Ig)); title('g分量的灰度直方图');grid on; hold on;
subplot(3, 3, 3), imhist(uint8(Ib)); title('b分量的灰度直方图'); grid on; hold on;

ir = histeq(Ir);
ig = histeq(Ig);
ib = histeq(Ib);

subplot(3, 3, 4), imhist(uint8(ir)); title('r分量的灰度直方图'); grid on; hold on;
subplot(3, 3, 5), imhist(uint8(ig)); title('g分量的灰度直方图');grid on; hold on;
subplot(3, 3, 6), imhist(uint8(ib)); title('b分量的灰度直方图'); grid on; hold on;
subplot(3, 3, 7), imshow(ir, []); title('变换后的r'); hold on;
subplot(3, 3, 8), imshow(ig, []); title('变换后的g'); hold on;
subplot(3, 3, 9), imshow(ib, []); title('变换后的b');

X = imread('D:\汪梓鑫\实验报告\数字图像处理\dip\img\hypstr.tif');
x1 = X(:, :, 1);
x2 = X(:, :, 3);
x3 = X(:, :, 4);
x = cat(3, uint8(x1), uint8(x2), uint8(x3));
figure(3), subplot(2, 2, 1), imshow(x1, []); hold on;
subplot(2, 2, 2), imshow(x2, []); hold on;
subplot(2, 2, 3), imshow(x3, []); hold on;
subplot(2, 2, 4), imshow(x, []);

H = imread('D:\汪梓鑫\实验报告\数字图像处理\dip\img\数字图像处理实验_4463.png');
H = im2double(H);
HR = H(:, :, 1);
HG = H(:, :, 2);
HB = H(:, :, 3);
HR = double(HR);
HG = double(HG);
HB = double(HB);
xx = linspace(0, 8);
y1 = -sin(xx);
y2 = -cos(xx);
y3 = sin(xx);
hr_1 = -sin(HR);
hg_1 = -cos(HG);
hb_1 = sin(HB);
h_1 = cat(3, hr_1, hg_1, hb_1);

figure(4), subplot(2, 4, 1); plot(xx, y1); title('r分量变换'); hold on;
subplot(2, 4, 2); imshow(hr_1, []); title('r变换后'); hold on;
subplot(2, 4, 3); plot(xx, y2); title('g分量变换'); hold on;
subplot(2, 4, 4); imshow(hg_1, []); title('g变换后'); hold on;
subplot(2, 4, 5); plot(xx, y3); title('b分量变换'); hold on;
subplot(2, 4, 6); imshow(hb_1, []); title('b变换后'); hold on;
subplot(2, 4, 7); imshow(H, []); title('原始图像'); hold on;
subplot(2, 4, 8); imshow(h_1, []); title('合成后');

hr_2 = -cos(HR);
hg_2 = sin(HG);
hb_2 = -sin(HB);
h_2 = cat(3, hr_2, hg_2, hb_2);

figure(5), subplot(2, 4, 1); plot(xx, y2); title('r分量变换'); hold on;
subplot(2, 4, 2); imshow(hr_2, []); title('r变换后'); hold on;
subplot(2, 4, 3); plot(xx, y3); title('g分量变换'); hold on;
subplot(2, 4, 4); imshow(hg_2, []); title('g变换后'); hold on;
subplot(2, 4, 5); plot(xx, y1); title('b分量变换'); hold on;
subplot(2, 4, 6); imshow(hb_2, []); title('b变换后'); hold on;
subplot(2, 4, 7); imshow(H, []); title('原始图像'); hold on;
subplot(2, 4, 8); imshow(h_2, []); title('合成后');








