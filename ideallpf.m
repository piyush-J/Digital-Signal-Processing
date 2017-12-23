function h=ideallpf(wc,N)
a=(N-1)/2;
h=zeros(1,N);
for n=1:N
    h(n)=(wc/pi)*sinc(wc*(n-1-a)/pi);
end