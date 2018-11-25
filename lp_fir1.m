%% Kasier Window
delta=0.001;
A=-20*log10(delta);
beta=0.1102*(A-8.7);
M=ceil((A-8)/(2.285*0.1*pi))
w1=kaiser(M+1,beta);
b=fir1(73,0.65,w1);
freqz(b,1);