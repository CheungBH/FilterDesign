load Signal.mat
load Filter.mat
% get length of the signal & filter
N1 = size(x,1);
N2 = size(h,1);
% padding zeros before doing convolution
h1 = [h;zeros(N1-1,1)];
x1 = [x;zeros(N2-1,1)];
% do the convolution
y = zeros(N1+N2-1,1);
for n = 1 : N1+N2-1
    for m = 1 : n
        y(n) = y(n) + x1(m)*h1(n-m+1);
    end
end

Ts2=2/(length(y)-1);
Fs2=1/Ts2;
t2=0:Ts2:2;
subplot(2,1,1)
plot(t2,y)
xlabel('Time (s)')
ylabel('Amplitude')
ylim([-1.5 1.5])

win_len=0.3; %% default setting for window length;
winsize = win_len*Fs1;
nfft = 1024;   % # FFT points
[P1, f1] = stft(x, winsize, nfft, Fs1);
[P2, f2] = stft(y, winsize, nfft, Fs2);

figure
imagesc(t2,f2,P2)
colorbar
xlabel('Time (s)')
ylabel('Frequency (Hz)')
axis xy
grid on
set(gca,'ylim',[1 100])