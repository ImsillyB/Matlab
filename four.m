%I----------------------------õ�廨ͼ��
%Ir---------------------------õ�廨��ɫ����
%Ig---------------------------õ�廨��ɫ����
%Ib---------------------------õ�廨��ɫ����;
%ir---------------------------��ɫ����ֱ��ͼ�任��
%ig---------------------------��ɫ����ֱ��ͼ�任��
%ib---------------------------��ɫ����ֱ��ͼ�任��
%X----------------------------�����ͼ��
%x1&x2&x3---------------------�����ͼ����������Σ�
%x----------------------------�������εĺϳ�ͼ��
%H----------------------------lenna��ͼ��
%HR---------------------------ͼ��ĺ�ɫ����
%HG---------------------------ͼ�����ɫ����
%HB---------------------------ͼ�����ɫ����
%hr_1&hr_2--------------------�任��ĺ�ɫ����
%hg_1&hr_2--------------------�任�����ɫ����
%hb_1&hb_2--------------------�任�����ɫ����


clear all;
close all;
I = imread('D:\������\ʵ�鱨��\����ͼ����\dip\img\����ͼ����ʵ��_4389.png');
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);

figure(1), subplot(2, 2, 1), imshow(I, []); title('ԭʼͼ��'); hold on;
subplot(2, 2, 2), imshow(Ir, []); title('��ɫ����'); hold on;
subplot(2, 2, 3), imshow(Ig, []); title('��ɫ����'); hold on;
subplot(2, 2, 4), imshow(Ib, []); title('��ɫ����'); 

figure(2), subplot(3, 3, 1), imhist(uint8(Ir)); title('r�����ĻҶ�ֱ��ͼ'); grid on; hold on;
subplot(3, 3, 2), imhist(uint8(Ig)); title('g�����ĻҶ�ֱ��ͼ');grid on; hold on;
subplot(3, 3, 3), imhist(uint8(Ib)); title('b�����ĻҶ�ֱ��ͼ'); grid on; hold on;

ir = histeq(Ir);
ig = histeq(Ig);
ib = histeq(Ib);

subplot(3, 3, 4), imhist(uint8(ir)); title('r�����ĻҶ�ֱ��ͼ'); grid on; hold on;
subplot(3, 3, 5), imhist(uint8(ig)); title('g�����ĻҶ�ֱ��ͼ');grid on; hold on;
subplot(3, 3, 6), imhist(uint8(ib)); title('b�����ĻҶ�ֱ��ͼ'); grid on; hold on;
subplot(3, 3, 7), imshow(ir, []); title('�任���r'); hold on;
subplot(3, 3, 8), imshow(ig, []); title('�任���g'); hold on;
subplot(3, 3, 9), imshow(ib, []); title('�任���b');

X = imread('D:\������\ʵ�鱨��\����ͼ����\dip\img\hypstr.tif');
x1 = X(:, :, 1);
x2 = X(:, :, 3);
x3 = X(:, :, 4);
x = cat(3, uint8(x1), uint8(x2), uint8(x3));
figure(3), subplot(2, 2, 1), imshow(x1, []); hold on;
subplot(2, 2, 2), imshow(x2, []); hold on;
subplot(2, 2, 3), imshow(x3, []); hold on;
subplot(2, 2, 4), imshow(x, []);

H = imread('D:\������\ʵ�鱨��\����ͼ����\dip\img\����ͼ����ʵ��_4463.png');
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

figure(4), subplot(2, 4, 1); plot(xx, y1); title('r�����任'); hold on;
subplot(2, 4, 2); imshow(hr_1, []); title('r�任��'); hold on;
subplot(2, 4, 3); plot(xx, y2); title('g�����任'); hold on;
subplot(2, 4, 4); imshow(hg_1, []); title('g�任��'); hold on;
subplot(2, 4, 5); plot(xx, y3); title('b�����任'); hold on;
subplot(2, 4, 6); imshow(hb_1, []); title('b�任��'); hold on;
subplot(2, 4, 7); imshow(H, []); title('ԭʼͼ��'); hold on;
subplot(2, 4, 8); imshow(h_1, []); title('�ϳɺ�');

hr_2 = -cos(HR);
hg_2 = sin(HG);
hb_2 = -sin(HB);
h_2 = cat(3, hr_2, hg_2, hb_2);

figure(5), subplot(2, 4, 1); plot(xx, y2); title('r�����任'); hold on;
subplot(2, 4, 2); imshow(hr_2, []); title('r�任��'); hold on;
subplot(2, 4, 3); plot(xx, y3); title('g�����任'); hold on;
subplot(2, 4, 4); imshow(hg_2, []); title('g�任��'); hold on;
subplot(2, 4, 5); plot(xx, y1); title('b�����任'); hold on;
subplot(2, 4, 6); imshow(hb_2, []); title('b�任��'); hold on;
subplot(2, 4, 7); imshow(H, []); title('ԭʼͼ��'); hold on;
subplot(2, 4, 8); imshow(h_2, []); title('�ϳɺ�');








