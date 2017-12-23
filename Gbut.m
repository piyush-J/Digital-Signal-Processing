% Butterworth
clc
clear all
close all
wp=input('Enter passband frequency, wp=');
ws=input('Enter stopband frequency, ws=');
rp=input('Enter passband ripples, rp in dB=');
rs=input('Enter stopband attenuation, rs in dB=');
[n,wc]=buttord(wp,ws,rp,rs);
i=input('Enter 1 for LP\nEnter 2 for HP\nEnter 3 for BP\nEnter 4 for BR\n=');
switch i
    case 1
        [a b]=butter(n,wc,'low');
    case 2
        [a b]=butter(n,wc,'high');
    case 3
        [a b]=butter(n,wc,'bandpass');
    case 4
        [a b]=butter(n,wc,'stop');
end
freqz(a,b)