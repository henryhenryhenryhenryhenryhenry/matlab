% clear
% Deltat=1e-5; T=1e-3; tfinal=5*T;
% pulsepts=round(T/Deltat); M=5*pulsepts;
% fs=1/Deltat; Deltaf=fs/M;
% 
% m=0:1:M-1; tsec=m*Deltat;
% k=0:1:M-1; fHz=k*Deltaf;
% 
% xt=zeros(1,M);
% pulse=ones(1,pulsepts);
% xt(1:pulsepts)=pulse;
% 
% Xk=fft(xt); Xf=Deltat*Xk;
% magXk=abs(Xk); magXf=abs(Xf);
% 
% subplot(211), plot(tsec,xt)
% axis([0 0.005 -0.2 1.2]), grid
% xlabel('t in secs'), ylabel('x(t)'), title('time domain pulse')
% 
% subplot(212), plot(fHz, magXf)
% axis([0 fs/10 0 0.0012]), grid
% xlabel('f in Hz'), ylabel('| X[f] |'), title('frequency domain spectrum')

% clear
% Ts=1/8000; T=1e-3; tfinal=5*T;
% pulsepts=round(T/Ts); M=256;
% fs=8000; Deltaf=fs/M;
% 
% m=0:1:M-1; tsec=m*Ts;
% k=0:1:M-1; fHz=k*Deltaf;
% 
% nm=randn(1,M);
% xt=3*cos(2*pi*600*tsec)+nm;
% 
% Xk=fft(xt); Xf=Ts*Xk;
% magXk=abs(Xk); magXf=abs(Xf);
% 
% subplot(211), plot(tsec,xt)
% axis([0 0.016 -6 6]), grid
% xlabel('t in secs'), ylabel('x(t)'), title('time domain pulse')
% 
% subplot(212), plot(fHz, magXf)
% axis([0 fs/2 0 0.05]), grid
% xlabel('f in Hz'), ylabel('| X[f] |'), title('frequency domain spectrum')

% clear
% Ts=1e-5; T=1e-3; tfinal=.01;
% pulsepts=round(T/Ts); M=1000;
% fs=1/Ts; Deltaf=fs/M;
% 
% m=0:1:M-1; tsec=m*Ts;
% k=0:1:M-1; fHz=k*Deltaf;
% 
% A=5; fc=1829;
% xt=(A*cos(2*pi*fc*tsec)) .* (heaviside(tsec-0) - heaviside(tsec-.002));
% 
% Xk=fft(xt); Xf=Ts*Xk;
% magXk=abs(Xk); magXf=abs(Xf);
% 
% subplot(211), plot(tsec,xt)
% axis([0 0.01 -6 6]), grid
% xlabel('t in secs'), ylabel('x(t)'), title('time domain pulse')
% 
% subplot(212), plot(fHz, magXf)
% axis([0 5e3 0 6e-3]), grid
% xlabel('f in Hz'), ylabel('| X[f] |'), title('frequency domain spectrum')

% clear
% Ts=1e-5; T=1e-3; tfinal=.01;
% pulsepts=round(T/Ts); M=1000;
% fs=1/Ts; Deltaf=fs/M;
% 
% m=0:1:M-1; tsec=m*Ts;
% k=0:1:M-1; fHz=k*Deltaf;
% 
% A=5; fc=1829;
% xt=10*exp(-1500*tsec) .* heaviside(tsec-0) ;
% 
% Xk=fft(xt); Xf=Ts*Xk;
% magXk=abs(Xk); magXf=abs(Xf);
% 
% subplot(211), plot(tsec,xt)
% axis([0 0.0025 -2 12]), grid
% xlabel('t in secs'), ylabel('h(t)'), title('time domain pulse')
% 
% subplot(212), plot(fHz, magXf)
% axis([0 2e3 0 9e-3]), grid
% xlabel('f in Hz'), ylabel('| H[f] |'), title('frequency domain spectrum')

% clear
% Ts=1/1e4; T=1e-3; tfinal=.01;
% pulsepts=round(T/Ts); M=100;
% fs=1/Ts; Deltaf=fs/M;
% 
% m=0:1:M-1; tsec=m*Ts;
% k=0:1:M-1; fHz=k*Deltaf;
% 
% nm = randn(1,M);
% xt=0.4*cos(2*pi*737*tsec)+0.3*sin(2*pi*1528)+nm;
% 
% Xk=fft(xt); Xf=Ts*Xk;
% magXk=abs(Xk); magXf=abs(Xf);
% 
% subplot(211), plot(tsec,xt)
% axis([0 M*Ts -4 4]), grid
% xlabel('t in secs'), ylabel('w(t)'), title('time domain pulse')
% 
% subplot(212), plot(fHz, magXf)
% axis([0 5e3 0 2.5e-3]), grid
% xlabel('f in Hz'), ylabel('| W[f] |'), title('frequency domain spectrum')

clear
Ts=1/1e4; T=1e-3; tfinal=.01;
pulsepts=round(T/Ts); M=1000;
fs=1/Ts; Deltaf=fs/M;

m=0:1:M-1; tsec=m*Ts;
k=0:1:M-1; fHz=k*Deltaf;

nm = randn(1,M);
xt = 0.4*cos(2*pi*737*tsec) + 0.3*sin(2*pi*1528*tsec) + nm;

Xk=fft(xt); Xf=Ts*Xk;
magXk=abs(Xk); magXf=abs(Xf);

subplot(211), plot(tsec,xt)
axis([0 M*Ts -4 4]), grid
xlabel('t in secs'), ylabel('w(t)'), title('time domain pulse')

subplot(212), plot(fHz, magXf)
axis([0 5e3 0 0.02]), grid
xlabel('f in Hz'), ylabel('| W[f] |'), title('frequency domain spectrum')