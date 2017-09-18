%x--------------------image
%rx___________________图像的红色波段
%bx-------------------图像的蓝色波段
%gx-------------------图像的绿色波段
%rb-------------------红色波段与蓝色波段相加
%r_b------------------红色波段减去蓝色波段
%rbx------------------红色波段乘以蓝色波段
%r_bx-----------------红色波段除以蓝色波段
%r_x1-----------------线性变换1后的图像
%r_x2-----------------线性变换2后的图像
%r_x3-----------------线性变换3后的图像
%r_x4-----------------线性变换4后的图像
clear all;
close all;
x = imread('数字图像处理实验_6531.png');                              %读取图像
%x = double(x);
figure, subplot(3, 3, 1), imshow(x, []); title('原始图像'); hold on; %显示原图像
rx = x(:, :, 1);                                                     %红色波段
bx = x(:, :, 2);                                                     %蓝色波段
gx = x(:, :, 3);                                                     %绿色波段
rb = rx + bx;                                                        %红色波段加上蓝色波段
r_b = rx - bx;                                                       %红色波段减去蓝色波段
rbx = rx .* bx;                                                      %红色波段乘以蓝色波段
r_bx = rx ./ bx;                                                     %红色波段减去蓝色波段

%显示上面各个图像
subplot(3, 3, 2), imshow(rx, []); title('r分量'); hold on;
subplot(3, 3, 3), imshow(bx, []); title('b分量'); hold on;
subplot(3, 3, 4), imshow(gx, []); title('g分量'); hold on;
subplot(3, 3, 5), imshow(rb, []); title('r+b分量'); hold on;
subplot(3, 3, 6), imshow(r_b, []); title('r-b分量'); hold on;
subplot(3, 3, 7), imshow(rbx, []); title('r*b分量'); hold on;
subplot(3, 3, 8), imshow(r_bx, []); title('r/b分量'); 

%显示红色、绿色、蓝色各个波段的灰度直方图
figure(2), subplot(3, 1, 1), imhist(uint8(rx)); title('r分量的灰度直方图'); grid on; hold on;
subplot(3, 1, 2), imhist(uint8(gx)); title('g分量的灰度直方图');grid on; hold on;
subplot(3, 1, 3), imhist(uint8(bx)); title('b分量的灰度直方图'); grid on;


%对图像进行线性变换
fa = [1.1, 0.5, -1, -0.2];
fb = [134, 120, 110, -239];
r_x1 = fa(1) * rx + fb(1);                    %第一次线性变换
r_x2 = fa(2) * rx + fb(2);                    %第二次线性变换
r_x3 = fa(3) * rx + fb(3);                    %第三次线性变换
r_x4 = fa(4) * rx + fb(4);                    %第四次线性变换
%显示四次线性变换
figure(3), subplot(2, 2, 1), imshow(r_x1, []); title('第一组'); hold on;
subplot(2, 2, 2), imshow(r_x2, []); title('第二组'); hold on;
subplot(2, 2, 3), imshow(r_x3, []); title ('第三组'); hold on;
subplot(2, 2, 4), imshow(r_x4, []); title('第四组'); 
%进行对数变换
f = fft2(im2double(rx));
f = fftshift(f);
c = 1;
k = 50;
f_rx = abs(f);
rrx1 = c * log(k + f_rx);
%显示对数变换
figure(4), subplot(2, 1, 1), imshow(f_rx, []); title('未经变化的频谱'); hold on;
subplot(2, 1, 2), imshow(rrx1, []); title('对数变换后'); 
