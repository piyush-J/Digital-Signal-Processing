% Linear Convolution Method 1
clc
clear all
close all
a=input('Enter sequence a=');
b=input('Enter sequence b=');
m=length(a);
n=length(b);
c=zeros(1,m+n-1);
for i=1:m+n-1
        for j=1:m
            if i-j+1>=1 && i-j+1<=n
                c(i)=c(i)+a(j)*b(i-j+1);
            end
        end
end
disp(c)
stem(c)