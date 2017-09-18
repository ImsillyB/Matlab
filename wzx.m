%x--------------------image
%rx___________________ͼ��ĺ�ɫ����
%bx-------------------ͼ�����ɫ����
%gx-------------------ͼ�����ɫ����
%rb-------------------��ɫ��������ɫ�������
%r_b------------------��ɫ���μ�ȥ��ɫ����
%rbx------------------��ɫ���γ�����ɫ����
%r_bx-----------------��ɫ���γ�����ɫ����
%r_x1-----------------���Ա任1���ͼ��
%r_x2-----------------���Ա任2���ͼ��
%r_x3-----------------���Ա任3���ͼ��
%r_x4-----------------���Ա任4���ͼ��
clear all;
close all;
x = imread('����ͼ����ʵ��_6531.png');                              %��ȡͼ��
%x = double(x);
figure, subplot(3, 3, 1), imshow(x, []); title('ԭʼͼ��'); hold on; %��ʾԭͼ��
rx = x(:, :, 1);                                                     %��ɫ����
bx = x(:, :, 2);                                                     %��ɫ����
gx = x(:, :, 3);                                                     %��ɫ����
rb = rx + bx;                                                        %��ɫ���μ�����ɫ����
r_b = rx - bx;                                                       %��ɫ���μ�ȥ��ɫ����
rbx = rx .* bx;                                                      %��ɫ���γ�����ɫ����
r_bx = rx ./ bx;                                                     %��ɫ���μ�ȥ��ɫ����

%��ʾ�������ͼ��
subplot(3, 3, 2), imshow(rx, []); title('r����'); hold on;
subplot(3, 3, 3), imshow(bx, []); title('b����'); hold on;
subplot(3, 3, 4), imshow(gx, []); title('g����'); hold on;
subplot(3, 3, 5), imshow(rb, []); title('r+b����'); hold on;
subplot(3, 3, 6), imshow(r_b, []); title('r-b����'); hold on;
subplot(3, 3, 7), imshow(rbx, []); title('r*b����'); hold on;
subplot(3, 3, 8), imshow(r_bx, []); title('r/b����'); 

%��ʾ��ɫ����ɫ����ɫ�������εĻҶ�ֱ��ͼ
figure(2), subplot(3, 1, 1), imhist(uint8(rx)); title('r�����ĻҶ�ֱ��ͼ'); grid on; hold on;
subplot(3, 1, 2), imhist(uint8(gx)); title('g�����ĻҶ�ֱ��ͼ');grid on; hold on;
subplot(3, 1, 3), imhist(uint8(bx)); title('b�����ĻҶ�ֱ��ͼ'); grid on;


%��ͼ��������Ա任
fa = [1.1, 0.5, -1, -0.2];
fb = [134, 120, 110, -239];
r_x1 = fa(1) * rx + fb(1);                    %��һ�����Ա任
r_x2 = fa(2) * rx + fb(2);                    %�ڶ������Ա任
r_x3 = fa(3) * rx + fb(3);                    %���������Ա任
r_x4 = fa(4) * rx + fb(4);                    %���Ĵ����Ա任
%��ʾ�Ĵ����Ա任
figure(3), subplot(2, 2, 1), imshow(r_x1, []); title('��һ��'); hold on;
subplot(2, 2, 2), imshow(r_x2, []); title('�ڶ���'); hold on;
subplot(2, 2, 3), imshow(r_x3, []); title ('������'); hold on;
subplot(2, 2, 4), imshow(r_x4, []); title('������'); 
%���ж����任
f = fft2(im2double(rx));
f = fftshift(f);
c = 1;
k = 50;
f_rx = abs(f);
rrx1 = c * log(k + f_rx);
%��ʾ�����任
figure(4), subplot(2, 1, 1), imshow(f_rx, []); title('δ���仯��Ƶ��'); hold on;
subplot(2, 1, 2), imshow(rrx1, []); title('�����任��'); 
