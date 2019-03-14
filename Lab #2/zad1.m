clc
clear all

[x, fs]=audioread('whitenoise2018.wav');
[y, fs]=audioread('whitenoise_rec2018.wav');


Rxx= xcorr(x,x);
Rxy= xcorr(x,y);

t=(-length(Rxx)/2:length(Rxx)/2-1)/fs;%wektor czasu w Hz
figure(1)
subplot(211)
set(gcf,'color','w');
plot(t,Rxx)
axis tight %ustawienie limitu osi do zakresu danych
%axis([-100 100 min(Rxx) max(Rxx)])
xlabel('Czas [s]')
ylabel('Rxx [j^2]')
title( 'Autokorelacja Rxx')
subplot(212)
plot(t,Rxy)
axis tight
%axis([-100 100 min(Rxy) max(Rxy)])
xlabel('Czas [s]')
ylabel('Rxy [j^2]')
title( 'Korelacja Rxy')


N=length(x);
N2=round(N/2);
T=max(t);
df=fs/N; 
f=(0:N2)*df ;
X2=fft(x);
X=sqrt(X2.*conj(X2));
Sx=X*(1/df)*(1/df)*N/2; %g�sto�� energii
Gx=Sx/T; % g�sto�� mocy

figure(2)
stem(f(1:N2),Gx(1:N2))
set(gcf,'color','w');
axis tight
title('Widmowa gestosc mocy');
xlabel('Cz�stotliwo�� [Hz]')
ylabel('G�sto�� widmowa [j^2/Hz]')