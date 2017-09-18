%读取、写入、显示图像
%a-读取的图像
%b-由a转换为的二值图像；
%info-图像的信息
m=imread('C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg');%读取图像
whos m;%获取变量信息        
figure,imshow(m,[]);%显示图像
info=imfinfo('C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg');%获取图像信息
imwrite(m,'C:\Users\Public\Pictures\Sample Pictures\hhr.jpg');%写入图像
b=im2bw(m);%将图像数据转换为二值图像
figure,subplot(1,2,2),imshow(b,[]);%显示二值图像
subplot(1,2,1),imshow(m,[]);