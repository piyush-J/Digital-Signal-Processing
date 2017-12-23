clc
clear all
close all
x=input('Enter sequence x=');
N=input('Enter length of sequence N=');
m=length(x);
if N>m
    x=[x zeros(1,N-m)];
elseif N<m
    x=x(1:N);
end
h=zeros(N,N);
for k=1:N
        for n=1:N
            h(k,n)=exp(-1i*2*pi*(k-1)*(n-1)/N);
        end
end
x=x';
Y=h*x;
Y=Y';
disp(Y)
stem(Y)
figure
stem(abs(Y))