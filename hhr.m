%��ȡ��д�롢��ʾͼ��
%a-��ȡ��ͼ��
%b-��aת��Ϊ�Ķ�ֵͼ��
%info-ͼ�����Ϣ
m=imread('C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg');%��ȡͼ��
whos m;%��ȡ������Ϣ        
figure,imshow(m,[]);%��ʾͼ��
info=imfinfo('C:\Users\Public\Pictures\Sample Pictures\Tulips.jpg');%��ȡͼ����Ϣ
imwrite(m,'C:\Users\Public\Pictures\Sample Pictures\hhr.jpg');%д��ͼ��
b=im2bw(m);%��ͼ������ת��Ϊ��ֵͼ��
figure,subplot(1,2,2),imshow(b,[]);%��ʾ��ֵͼ��
subplot(1,2,1),imshow(m,[]);