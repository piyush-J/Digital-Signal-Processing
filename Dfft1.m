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
Y=zeros(1,N);
for k=1:N
        for n=1:N
            Y(k)=Y(k)+x(n)*exp(-1i*2*pi*(k-1)*(n-1)/N);
        end
end
disp(Y)
stem(Y)
figure
stem(abs(Y))