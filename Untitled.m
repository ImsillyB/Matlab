A=imread('C:\Users\Administrator\Desktop\dip\img\����ͼ����ʵ��_4389.png');
whos A 
figure , imshow(A);
info = imfinfo ('C:\Users\Administrator\Desktop\dip\img\����ͼ����ʵ��_4389.png')
imwrite(A,'C:\Users\Administrator\Desktop\dip\img\����ͼ����ʵ��_4389.jpg','quality',10);
B = im2bw(A);
figure,imshow(B);

figure,subplot(1,2,2),imshow(B,[]);
subplot(1,2,1),imshow(A,[]);



