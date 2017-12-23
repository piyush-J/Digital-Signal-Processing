% Cross Correlation
clc
clear all
close all
a=input('Enter sequence a=');
b=input('Enter sequence b=');
m=length(a);
n=length(b);
N=max(m,n);
c=zeros(1,2*N-1);
for i=1:2*N-1
    for j=1:n
        if j+i-N>=1 && j+i-N<=m
            c(i)=c(i)+a(j+i-N)*conj(b(j));
        end
    end
end
disp(c)
stem(c)