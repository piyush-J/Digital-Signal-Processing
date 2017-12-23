clc
clear all
close all
X=input('Enter sequence X=');
N=input('Enter length of sequence N=');
m=length(X);
if N>m
    X=[X zeros(1,N-m)];
elseif N<m
    X=X(1:N);
end
y=zeros(1,N);
for n=1:N
        for k=1:N
            y(n)=y(n)+X(k)*exp(1i*2*pi*(k-1)*(n-1)/N);
        end
        y(n)=y(n)/N;
end
disp(y)