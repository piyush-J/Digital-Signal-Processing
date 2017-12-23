clc
close all
clear all
wp=input('Enter passband frequency(ies)=');
ws=input('Enter stopband frequency(ies)=');
wc=(wp+ws)/2;
i=input('Enter 1 for Low Pass\nEnter 2 for High Pass\nEnter 3 for Band Pass\nEnter 4 for Band Reject\n=');
switch i
    case 1
        tw=ws-wp;
        N=ceil(6.2*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N;
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        h=ideallpf(wc,N);
        y=h.*w;
    case 2
        tw=wp-ws;
        N=ceil(6.2*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N;
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        ha=ideallpf(pi,N);
        hi=ideallpf(wc,N);
        h=ha-hi;
        y=h.*w;
    case 3
        a=abs(ws-wp);
        tw=mean(a);
        N=ceil(6.2*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        h1=ideallpf(wc(1),N);
        h2=ideallpf(wc(2),N);
        h=h2-h1;
        y=h.*w;
    case 4
        a=abs(ws-wp);
        tw=mean(a);
        N=ceil((6.2*pi/tw))+1;
        w=zeros(1,N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
        h1=ideallpf(wc(1),N);
        h2=ideallpf(wc(2),N);
        ha=ideallpf(pi,N);
        hi=ha-h2;
        h=hi+h1;
        y=h.*w;
    otherwise
        disp('Invalid input!')
end
stem(h)
figure
stem(w)
figure
freqz(y,1,N)