%I--------ԭʼͼ��
%H--------�����˹������ͼ��
%h1-------3x3��ƽ��ģ��
%h2-------5x5��ƽ��ģ��
%I1-------3x3��ƽ���˲����Լ����˹����ͼ������˲�
%I2-------5x5��ƽ���˲����Լ����˹����ͼ������˲�
%I3-------3x3����ֵ�˲����Լ����˹����ͼ������˲�
%I4-------5x5����ֵ�˲����Լ����˹����ͼ������˲�
%G--------���뽷��������ͼ��
%I5-------3x3��ƽ���˲����Լ��뽷������ͼ������˲�
%I6-------5x5��ƽ���˲����Լ��뽷������ͼ������˲�
%I7-------3x3����ֵ�˲����Լ��뽷������ͼ������˲�
%I8-------5x5����ֵ�˲����Լ��뽷������ͼ������˲�
close all;
clear all;
I = imread('dianlu.tif');                %��ȡԭʼͼ��
H = imnoise(I, 'gaussian');              %�����˹����
h1 = fspecial('average');                %����3x3��5x5��ƽ���˲���
h2 = fspecial('average', [5, 5]);
I1 = imfilter(H, h1);                    %�ø����˲����Լ����˹������ͼ������˲�
I2 = imfilter(H, h2);
I3 = medfilt2(H, [3, 3]);
I4 = medfilt2(H, [5, 5]);

G = imnoise(I, 'salt & pepper');         %���뽷������
I5 = imfilter(H, h1);                    %�ø����˲����Լ��뽷��������ͼ������˲�
I6 = imfilter(H, h2);
I7 = medfilt2(H, [3, 3]);
I8 = medfilt2(H, [5, 5]);

%��ʾͼ��
figure, subplot(3, 2, 1), imshow(I, []); title('ԭʼͼ��'); hold on;
subplot(3, 2, 2), imshow(H, []); title('�����˹����'); hold on;
subplot(3, 2, 3), imshow(I1, []); title('3x3ģ���ƽ���˲���'); hold on;
subplot(3, 2, 4), imshow(I2, []); title('5x5ģ���ƽ���˲���'); hold on;
subplot(3, 2, 5), imshow(I3, []); title('3x3ģ�����ֵ�˲���'); hold on;
subplot(3, 2, 6), imshow(I4, []); title('5x5ģ�����ֵ�˲���');

figure(2), subplot(3, 2, 1), imshow(I, []); title('ԭʼͼ��'); hold on;
subplot(3, 2, 2), imshow(G, []); title('���뽷������'); hold on;
subplot(3, 2, 3), imshow(I5, []); title('3x3ģ���ƽ���˲���'); hold on;
subplot(3, 2, 4), imshow(I6, []); title('5x5ģ���ƽ���˲���'); hold on;
subplot(3, 2, 5), imshow(I7, []); title('3x3ģ�����ֵ�˲���'); hold on;
subplot(3, 2, 6), imshow(I8, []); title('5x5ģ�����ֵ�˲���'); 


