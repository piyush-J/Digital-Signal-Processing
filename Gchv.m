% Chebyshev
clc
clear all
close all
rp=input('Enter passband ripples in dB=');
rs=input('Enter stopband attenuation in dB=');
wp=input('Enter passband frequency=');
ws=input('Enter stopband frequency=');
i=input('Enter 1 for LP\nEnter 2 for HP\nEnter 3 for BP\nEnter 4 for BR\n=');
c=input('Enter type of Chebychev Filter=');
if c==1
    [n,wc]=cheb1ord(wp,ws,rp,rs);
elseif c==2
    [n,wc]=cheb2ord(wp,ws,rp,rs);
end
switch i
    case 1
        if c==1
            [a b]=cheby1(n,wc,'low');
        elseif c==2
            [a b]=cheby2(n,wc,'low');
        end
    case 2
        if c==1
            [a b]=cheby1(n,wc,'high');
        elseif c==2
            [a b]=cheby2(n,wc,'high');
        end
    case 3
        if c==1
            [a b]=cheby1(n,wc,'bandpass');
        elseif c==2
            [a b]=cheby2(n,wc,'bandpass');
        end
    case 4
        if c==1
            [a b]=cheby1(n,wc,'stop');
        elseif c==2
            [a b]=cheby2(n,wc,'stop');
        end
end
freqz(a,b)