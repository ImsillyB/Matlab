%a--------��һ�εĶ˵�ԭ���ĻҶ�ֵ
%b--------�ڶ��εĶ˵�ԭ���ĻҶ�ֵ
%c--------��һ�εĶ˵�任��ĻҶ�ֵ
%d--------�ڶ��εĶ˵�任��ĻҶ�ֵ
%I--------��ȡ��ͼ��
%Ir-------ͼ��ĺ�ɫ����
%Ig-------ͼ�����ɫ����
%Ib-------ͼ�����ɫ����
%Mg-------ͼ�����ĻҶ�ֵ
%Mf-------ͼ��任�����ĻҶ�ֵ
%g--------�任��ͼ��ĺ�ɫ����
%g1-------�任��ͼ�����ɫ����
%g2-------�任��ͼ�����ɫ����
%G--------�任���ͼ��
close all
clear all

%���ø�����������ȡͼ��͸�������
a = 10;
b = 150;
c = 5;
d = 200;
I = imread('D:\������\ʵ�鱨��\����ͼ����\dip\img\����ͼ����ʵ��_4389.png');
Ir = I(:,:,1);
Ig = I(:,:,2);
Ib = I(:,:,3);
Mg = 255;
[m, n] = size(Ir);
g = zeros(m, n);
g1 = zeros(m, n);
g2 = zeros(m, n);


%�Ժ�ɫ���ν��б任
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


%����ɫ���ν��б任
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


%����ɫ���ν��б任
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
%���ϱ任֮�����������
G = cat(3, uint8(g), uint8(g1), uint8(g2));
%���ԭʼͼ��ͱ任֮��ĸ���ͼ��
figure, subplot(3, 2, 1), imshow(I, []); title('ԭʼͼ��'); hold on;
subplot(3, 2, 2), imshow(g, []); title('r�����任��'); hold on;
subplot(3, 2, 3), imshow(g1, []); title('g�����任��'); hold on;
subplot(3, 2, 4), imshow(g2, []); title('b�����任��'); hold on;
subplot(3, 2, 5), imshow(G, []); title('����任��'); 



