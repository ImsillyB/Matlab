%x------------------------ԭʼͼ��
%x1-----------------------��ֵ��ͼ��
%x2-----------------------��������
%x3-----------------------��ʴ����
%x4-----------------------���뽷������
%x5-----------------------������
%x6-----------------------������
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
subplot(2, 4, 2), imshow(x1, []); title('��ֵ��'); hold on;
subplot(2, 4, 3), imshow(x2, []); title('����'); hold on;
subplot(2, 4, 4), imshow(x3, []); title('��ʴ'); hold on;
subplot(2, 4, 5), imshow(x4, []); title('���뽷������'); hold on;
subplot(2, 4, 6), imshow(x5, []); title('������'); hold on;
subplot(2, 4, 7), imshow(x6, []); title('������'); 

