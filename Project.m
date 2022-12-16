% Code I
% % 1
[sis,fs]= audioread('C:\Users\Dell\Desktop\SP\Audio1.wav');
% % 2
% sound(sis,fs);    % % Normal (1X)
% sound(sis,fs*2);  % % Fast (2X)
% sound(sis,fs/2);  % % Slow (0.5X)
% 
% % 3-Original plot
% time=(1/fs)*length(sis);
% t=linspace(0,time,length(sis));
% plot(t,sis,'k');
% 
% % 4-Reverse
% rev_b=flipud(sis);
% sound(rev_b,fs); 
% soundsc(rev_b,fs);
% b=sis(1:fs*10);
% rev_b=flipud(b);
% time=(1/fs)*length(b);
% t=linspace(0, time, length(b));
% 
% % 5-Echo
% nSec=2;
% b=sis(1: fs*nSec);
% b_echo=b;
% N=fs/2;
% for n=N+1:length(b)
% % Adding N-off phase sound to the original input .
% b_echo(n) = b(n)+b(n-N);
% end 
% time=(1/fs)*length(b);
% t=linspace(0,time,length(b));
% plot(t,b,'k',t,b_echo,'r');
% xlabel('Time (sec)');
% ylabel('Signal Strength');
% title('Signal Processing');

% % Code II
% % 7-Compression
% % a
[x,fs]=audioread('C:\Users\Dell\Desktop\SP\Audio2.wav');
N=length(x);
vlcplayer=audioplayer(x,fs);
vlcplayer.play
% 
% % b
t=fft(x,N);
X=fftshift(t);
f=-fs/2:fs/N:(fs/2-fs/N);
figure(1)
plot(f,abs(X))
title('Orignal-Signal')

% % c-30% compression
% Xr = zeros(1,N);
% Xr((N*((30/100)/2))+1:N*(1-(30/100)/2))=X((N*((30/100)/2))+1:N*(1-(30/100)/2));
% figure(2)
% plot(f,abs((Xr)));
% xr=real(ifft(fftshift(Xr)));
% audiowrite('30%-Compressed.wav',xr,fs);
% title('30%Compressed')
% xlabel('Freq (Hz)'); ylabel('Magnitude');
% 
% % d-60% compression
% Xr = zeros(1,N);
% Xr((N*((60/100)/2))+1:N*(1-(60/100)/2))=X((N*((60/100)/2))+1:N*(1-(60/100)/2));
% figure(2)
% plot(f,abs((Xr)));
% xr=real(ifft(fftshift(Xr)));
% audiowrite('60%-Compressed.wav',xr,fs);
% title('60%Compressed')
% xlabel('Freq (Hz)'); ylabel('Magnitude');
% 
% % e-90% compression
Xr = zeros(1,N);
Xr((N*((90/100)/2))+1:N*(1-(90/100)/2))=X((N*((90/100)/2))+1:N*(1-(90/100)/2));
figure(2)
plot(f,abs((Xr)));
xr=real(ifft(fftshift(Xr)));
audiowrite('90%-Compressed.wav',xr,fs);
title('90%Compressed')
xlabel('Freq (Hz)'); ylabel('Magnitude');
