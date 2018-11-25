%% Parks-McClellan Lowpass Filter
n=52;
f=[0 0.6 0.7 1];
m=[1 1 0 0];
b = firpm(n,f,m,[1 10]);
[h,w] = freqz(b,1,512);
plot(f,m,w/pi,abs(h))
legend('Ideal','firpm Design')
xlabel 'Radian Frequency (\omega/\pi)', ylabel 'Magnitude'
freqz(b,1);
