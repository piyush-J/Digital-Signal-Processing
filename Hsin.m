clc
clear all
close all
f1=input('Enter the first frequency, f1=');
f2=input('Enter the second frequency, f2=');
f3=input('Enter the third frequency, f3=');
fs=4*f3;
t=0:1/fs:10/f1;
x=sin(2*pi*f1*t);
y=sin(2*pi*f2*t);
z=sin(2*pi*f3*t);
s=x+y+z;
i=('Enter 1 to filter first frequency\nEnter 2 to filter second frequency\nEnter 3 to filter third frequency\n=');
wp=input('Enter passband frequency=');
ws=input('Enter stopband frequency=');
rp=input('Enter passband ripples in dB=');
rs=input('Enter stopband attenuation in dB=');
wc=(wp+ws)/2;
switch i
    case 1
        tw=ws-wp;
        N=ceil(6.2*pi/tw)+1;
        h=ideallpf(wc,N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        z=conv(s,y);
    case 2
        b=ws-wp;
        tw=mean(b);
        N=ceil(6.2*pi/tw)+1;
        h1=ideallpf(wc(1),N);
        h2=ideallpf(wc(2),N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        h=h2-h1;
        y=h.*w;
        z=conv(s,y);
    case 3
        tw=wp-ws;
        N=ceil(6.2*pi/tw)+1;
        h1=ideallpf(wc,N);
        ha=ideallpf(pi,N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        h=ha-h1;
        y=h.*w;
        z=conv(s,y);
end
subplot(2,1,1)
plot(s)
subplot(2,1,2)
plot(z)