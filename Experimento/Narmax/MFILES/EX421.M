% Alguns exemplos do capitulo 4

% (c) Luis Aguirre, 1999

% O sistema
u=prbs(378,6,1);
u=u-0.5;
lu=length(u);
y=dlsim([1 0.5],[1 -1.5 0.7],u);
e=randn(378,1);
% ajustar variância para dar aproximadamente 0,1
e=0.3*(e-mean(e));
yi=dimpulse([1 0.5],[1 -1.5 0.7],lu);

subplot(211)
plot(1:100,u(1:100),'k-',1:100,u(1:100),'ko');
axis([0 100 -0.7 0.7]);
title('(a)');
subplot(212)
plot(1:100,y(1:100),'k-',1:100,y(1:100),'ko');
title('(b)');
xlabel('amostras')
axis([0 100 -6 6]);

pause


[t,ruy,l,B]=myccf([y(378-314:378)+e(378-314:378) u(378-314:378)'],40,0,0,'k');
h=ruy/var(u);

subplot(111)
plot(1:41,yi(1:41),'k-',1:41,yi(1:41),'ko',1:41,h(1:41)*B,'k+');
%title('(a)');

axis([0 40 -1 3]);
xlabel('amostras');
pause

[t,ruu,l,B]=myccf([u(378-314:378)' u(378-314:378)'],20,0,1,'k');
pause;
[t,rue,l,B]=myccf([u(378-314:378)' e(378-314:378)],40,1,1,'k');
pause;

%%%% Dominio da frequencia %%%%%

u=prbs(512,11,1);
u=u-0.5;
lu=length(u);
y=dlsim([1 0.5],[1 -1.5 0.7],u);
e=randn(512,1);
Y=fft(y+e);
U=fft(u');
H=Y./U;

freq=1/(length(y))*(0:length(y)/2); 
semilogx(freq,20*log10(abs(H(1:length(freq))))); 

w=logspace(-1.4,0.4,100);
mw=max(w);
I=find(2*pi*freq<=mw);
freq=freq(I);
[mag,pha]=dbode([1 0.5],[1 -1.5 0.7],1,w);
subplot(211)
semilogx(w,20*log10(mag),'k-',2*pi*freq,20*log10(abs(H(1:length(freq)))),'k--');
title('(a)');
ylabel('|H(jw)| (dB)');
axis([0.04 2.5 -20 30]);
subplot(212)
semilogx(w,pha,'k-',2*pi*freq,angle(H(1:length(freq)))*90/pi,'k--');
title('(b)');
ylabel('fase de H(jw) (graus)');
xlabel('freqüência (rad/s)')
axis([0.04 2.5 -200 50]);

pause;

[t,ruy,l,B]=myccf([y+e u'],512,0,0,'k');
Ruy=fft(ruy*B);
[t,ruu,l,B]=myccf([u' u'],512,0,0,'k');
Ruu=fft(ruu*B);
Hr=Ruy./Ruu;

figure(2)
w=logspace(-1.4,0.4,100);
mw=max(w);
I=find(2*pi*freq<=mw);
freq=freq(I);
[mag,pha]=dbode([1 0.5],[1 -1.5 0.7],1,w);
subplot(211)
semilogx(w,20*log10(mag),'k-',2*pi*freq,20*log10(abs(Hr(1:length(freq)))),'k--');
title('(a)');
ylabel('|H(jw)| (dB)');
axis([0.04 2.5 -20 30]);
subplot(212)
semilogx(w,pha,'k-',2*pi*freq,angle(Hr(1:length(freq)))*90/pi,'k--');
title('(b)');
ylabel('fase de H(jw) (graus)');
xlabel('freqüência (rad/s)')
axis([0.04 2.5 -200 50]);

