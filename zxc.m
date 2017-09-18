A=imread('C:\Users\Administrator\Desktop\dip\img\数字图像处理实验_4389.png');       %读取实验图像保存在A
whos A                                                                             %显示A的信息
figure , imshow(A);                                                                %显示图像
info = imfinfo ('C:\Users\Administrator\Desktop\dip\img\数字图像处理实验_4389.png') %读取图像参数
imwrite(A,'C:\Users\Administrator\Desktop\dip\img\C.jpg','quality',10);            %将A压缩
B = im2bw(A);                                                                      %将A保存为二值图像
C = imread('C:\Users\Administrator\Desktop\dip\img\C.jpg');                        %将压缩图像读取到C
figure,subplot(1,3,2),imshow(B,[]);                                                %在同一幅图像中分别显示ABC 
subplot(1,3,1),imshow(A,[]);
subplot(1,3,3),imshow(C,[]);


