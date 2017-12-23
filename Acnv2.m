% Linear Convolution Method 2
clc
clear all
close all
a=input('Enter sequence a=');
b=input('Enter sequence b=');
m=length(a);
n=length(b);
b=fliplr(b);
a=[zeros(1,n-1) a];
b=[b zeros(1,m+n-2)];
c=zeros(1,m+n-1);
for i=1:m+n-1
    for j=1:m
        c(i)=c(i)+a(j+n-1)*b(j+n-1);
    end
    b=circshift(b,[0 1]);
end
disp(c)
stem(c)