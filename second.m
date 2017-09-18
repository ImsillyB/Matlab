%a--------第一段的端点原来的灰度值
%b--------第二段的端点原来的灰度值
%c--------第一段的端点变换后的灰度值
%d--------第二段的端点变换后的灰度值
%I--------读取的图像
%Ir-------图像的红色波段
%Ig-------图像的绿色波段
%Ib-------图像的蓝色波段
%Mg-------图像最大的灰度值
%Mf-------图像变换后最大的灰度值
%g--------变换后图像的红色波段
%g1-------变换后图像的绿色波段
%g2-------变换后图像的蓝色波段
%G--------变换后的图像
close all
clear all

%设置各个参数并读取图像和各个波段
a = 10;
b = 150;
c = 5;
d = 200;
I = imread('D:\汪梓鑫\实验报告\数字图像处理\dip\img\数字图像处理实验_4389.png');
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);
Mg = 255;
[m, n] = size(Ir);
g = zeros(m, n);
g1 = zeros(m, n);
g2 = zeros(m, n);


%对红色波段进行变换
Mf = 0;
for i = 1:m
    for j = 1:n
        if Mf < Ir(i,j)
            Mf = Ir(i,j);
        end
    end
end

for i = 1:m
    for j = 1:n
        if Ir(i,j) >= 0 && Ir(i,j) < a
            g(i,j) = (c / a) * Ir(i,j);
        elseif Ir(i,j) >= a && Ir(i, j) < b
            g(i,j) = (d - c) / (b - a) * (Ir(i, j) - a) + c;
        elseif Ir(i, j) >= b && Ir(i, j) <= Mf
            g(i,j) = (Mg - d) / (Mf - b) * (Ir(i, j) - b) + d;
        end
    end
end


%对绿色波段进行变换
Mf = 0;
for i = 1:m
    for j = 1:n
        if Mf < Ig(i,j)
            Mf = Ig(i,j);
        end
    end
end

for i = 1:m
    for j = 1:n
        if Ig(i,j) >= 0 && Ig(i,j) < a
            g1(i,j) = (c / a) * Ig(i,j);
        elseif Ig(i,j) >= a && Ig(i, j) < b
            g1(i,j) = (d - c) / (b - a) * (Ig(i, j) - a) + c;
        elseif Ig(i, j) >= b && Ig(i, j) <= Mf
            g1(i,j) = (Mg - d) / (Mf - b) * (Ig(i, j) - b) + d;
        end
    end
end


%对蓝色波段进行变换
Mf = 0;
for i = 1:m
    for j = 1:n
        if Mf < Ib(i,j)
            Mf = Ib(i,j);
        end
    end
end

for i = 1:m
    for j = 1:n
        if Ib(i,j) >= 0 && Ib(i,j) < a
            g2(i,j) = (c / a) * Ib(i,j);
        elseif Ib(i,j) >= a && Ib(i, j) < b
            g2(i,j) = (d - c) / (b - a) * (Ib(i, j) - a) + c;
        elseif Ib(i, j) >= b && Ib(i, j) <= Mf
            g2(i,j) = (Mg - d) / (Mf - b) * (Ib(i, j) - b) + d;
        end
    end
end
%整合变换之后的三个波段
G = cat(3, uint8(g), uint8(g1), uint8(g2));
%输出原始图像和变换之后的各个图像
figure, subplot(3, 2, 1), imshow(I, []); title('原始图像'); hold on;
subplot(3, 2, 2), imshow(g, []); title('r分量变换后'); hold on;
subplot(3, 2, 3), imshow(g1, []); title('g分量变换后'); hold on;
subplot(3, 2, 4), imshow(g2, []); title('b分量变换后'); hold on;
subplot(3, 2, 5), imshow(G, []); title('总体变换后'); 



