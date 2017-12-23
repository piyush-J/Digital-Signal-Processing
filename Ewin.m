clc
clear all
close all
wp=input('Enter normalized passband frequency wp=');
ws=input('Enter normalized stopband frequency ws=');
wc=(wp+ws)/2;
tw=ws-wp;
i=input('Which window should be used?\n1.Rectangular\n2.Hanning\n3.Hamming\n4.Blackmann\n5.Kaiser\nEnter the choice number=');
switch i
    case 1
    %rectangular
        N=ceil(1.8*pi/tw)+1;
        w=ones(1,N);
    case 2
    %hanning
        N=ceil(6.2*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N
            w(n)=0.5*(1-cos(2*pi*(n-1)/(N-1)));
        end
    case 3
    %hamming
        N=ceil(6.6*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N
            w(n)=0.54-0.46*cos(2*pi*(n-1)/(N-1));
        end
    case 4
    %blackman
        N=ceil(11*pi/tw)+1;
        w=zeros(1,N);
        for n=1:N
            w(n)=0.42-0.5*cos(2*pi*(n-1)/(N-1))+0.08*cos(2*pi*(n-1)/(N-1));
        end
    case 5
    %kaiser
        As=input('Enter attenuation in stopband in dB=');
        N=ceil((As-7.95)/(2.285*tw))+1;
        if As>=50
            b=0.1102*(As-8.7);
        elseif As>=21
            b=0.5842*(As-21)^(0.4)+0.07886*(As-21);
        else
            b=0;
        end
        y=kaiser(N,b);
    otherwise
        disp('Invalid input! Please try again.');
end
if i>=1&&i<=4
    h=ideallpf(wc,N);
    y=w.*h;
    stem(h)
    figure
    stem(w)
end
if i>=1&&i<=5
    figure
    freqz(y,1,N)
end