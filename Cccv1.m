% Circular Convolution Method 1
clc
clear all
close all
a=input('Enter sequence a=');
b=input('Enter sequence b=');
N=input('Enter period N=');
m=length(a);
n=length(b);
if m<N
    a=[a zeros(1,N-m)];
elseif m>N
    for i=N+1:m
        k=mod(i,N);
        if k==0
            k=N;
        end
        a(k)=a(k)+a(i);
    end
    a=a(1:N);
end
if n<N
    b=[b zeros(1,N-n)];
elseif n>N
    for i=N+1:n
        k=mod(i,N);
        if k==0
            k=N;
        end
        b(k)=b(k)+b(i);
    end
    b=b(1:N);
end
c=zeros(1,N);
for i=1:N
        for j=1:N
            k=i-j+1;
            if(i-j+1<1)
                k=k+N;
            end
            c(i)=c(i)+a(j)*b(k);
        end
end
disp(c)
stem(c)