A=imread('C:\Users\Administrator\Desktop\dip\img\����ͼ����ʵ��_4389.png');       %��ȡʵ��ͼ�񱣴���A
whos A                                                                             %��ʾA����Ϣ
figure , imshow(A);                                                                %��ʾͼ��
info = imfinfo ('C:\Users\Administrator\Desktop\dip\img\����ͼ����ʵ��_4389.png') %��ȡͼ�����
imwrite(A,'C:\Users\Administrator\Desktop\dip\img\C.jpg','quality',10);            %��Aѹ��
B = im2bw(A);                                                                      %��A����Ϊ��ֵͼ��
C = imread('C:\Users\Administrator\Desktop\dip\img\C.jpg');                        %��ѹ��ͼ���ȡ��C
figure,subplot(1,3,2),imshow(B,[]);                                                %��ͬһ��ͼ���зֱ���ʾABC 
subplot(1,3,1),imshow(A,[]);
subplot(1,3,3),imshow(C,[]);


