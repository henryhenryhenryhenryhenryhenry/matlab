% clear
% tfin =.001; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% x=ones(1,numpts);
% 
% R=1000; C=159.16e-9;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% subplot(211), plot(tsecs,x), grid
% xlabel('t, sec.'), ylabel('input, x(t)')
% axis([-.00005 tfin 0 1.2]);
% title('Input')
% 
% subplot(212), plot(tsecs,y), grid
% xlabel('t, sec.'), ylabel('output, y(t)')
% axis([-.00005 tfin 0 1.2]);
% title('Simulation Output')

%--------------end of part one---------------

% clear
% tfin =.001; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=3.2e-4;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=pulse;
% 
% R=1000; C=159.16e-9;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% subplot(211), plot(tsecs,x), grid
% xlabel('t, sec.'), ylabel('input, x(t)')
% axis([-.00005 tfin 0 1.2]);
% title('Input')
% 
% subplot(212), plot(tsecs,y), grid
% xlabel('t, sec.'), ylabel('output, y(t)')
% axis([-.00005 tfin 0 1.2]);
% title('Simulation Output')

%--------------end of part one---------------

% clear
% tfin =.001; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=3.2e-4;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=pulse;
% x(PulsePoints+1:2*PulsePoints)=-pulse;
% 
% R=1000; C=159.16e-9;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% subplot(211), plot(tsecs,x), grid
% xlabel('t, sec.'), ylabel('input, x(t)')
% axis([-.00005 tfin -1.2 1.2]);
% title('Input')
% 
% subplot(212), plot(tsecs,y), grid
% xlabel('t, sec.'), ylabel('output, y(t)')
% axis([-.00005 tfin -1.2 1.2]);
% title('Simulation Output')

%--------------end of part three---------------

% clear
% tfin =.001; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=3.2e-4;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=pulse;
% 
% R=25; L=4e-4; C=1e-7;
% b= R/L;
% c= 1/(L*C)
% K1= (2+b*Deltat)/(1+b*Deltat+c*Deltat^2);
% K2= -1/(1+b*Deltat+c*Deltat^2);
% K3= (c*Deltat^2)/(1+b*Deltat+c*Deltat^2);
% 
% xcoeffs=[K3];
% ycoeffs=[1,-K1,-K2];
% y=filter(xcoeffs,ycoeffs,x);
% 
% subplot(211), plot(tsecs,x), grid
% xlabel('t, sec.'), ylabel('input, x(t)')
% axis([-.00005 tfin -.2 1.2]);
% title('Input')
% 
% subplot(212), plot(tsecs,y), grid
% xlabel('t, sec.'), ylabel('output, y(t)')
% axis([-.00005 tfin -1.2 2.2]);
% title('Simulation Output')

%--------------end of part four---------------
%--------------end of examples-----------------

% clear
% tfin =.1; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=.01;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(PulsePoints+1:2*PulsePoints)=-2*pulse;
% x(2*PulsePoints+1:3*PulsePoints)=-2*pulse;
% x(4*PulsePoints+1:5*PulsePoints)=3*pulse;
% x(7*PulsePoints+1:8*PulsePoints)=-pulse;
% % x=heaviside(0:Deltat:tsecs);
% 
% R=1000; C=5e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs,x), grid, hold on
% plot(tsecs, y,'--')
% xlabel('t, sec.'), ylabel('signal magnitude')
% axis([-.00005 tfin -5 5]);
% title('Input and Output signals for simple RC circuit, Lindbo')
% legend('input, x(t)','output, y(t)')

%-------------------end of part A-----------------

% clear
% tfin =.1; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=.01;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(PulsePoints+1:2*PulsePoints)=-2*pulse;
% x(2*PulsePoints+1:3*PulsePoints)=-2*pulse;
% x(4*PulsePoints+1:5*PulsePoints)=3*pulse;
% x(7*PulsePoints+1:8*PulsePoints)=-pulse;
% % x=heaviside(0:Deltat:tsecs);
% 
% R=5000; C=5e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs,x), grid, hold on
% plot(tsecs, y,'--')
% xlabel('t, sec.'), ylabel('signal magnitude')
% axis([-.00005 tfin -5 5]);
% title('Input and Output signals for simple RC circuit, Lindbo')
% legend('input, x(t)','output, y(t)')

%-------------------end of part B-----------------

% clear
% 
% tfin =.02; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=1e-2;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=(1/Tpulse)*pulse;
% 
% R=1000; C=3e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs, y,'--'), hold on
% 
% %--
% 
% tfin =.02; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=5e-3;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=(1/Tpulse)*pulse;
% 
% R=1000; C=3e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs, y,'--'), hold on
% %--
% 
% tfin =.02; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=2e-3;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=(1/Tpulse)*pulse;
% 
% R=1000; C=3e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs, y,'--'), hold on
% %--
% 
% tfin =.02; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=1e-4;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=(1/Tpulse)*pulse;
% 
% R=1000; C=3e-6;
% b=1/(R*C);
% bdel=b*Deltat;
% K1=1/(1+bdel);
% K2=bdel/(1+bdel);
% 
% xcoeffs=[K2];
% ycoeffs=[1,-K1];
% y=filter(xcoeffs,ycoeffs,x);
% 
% plot(tsecs, y,'--'), hold on
% 
% h=b*exp(-b*tsecs);
% plot(tsecs, h)
% 
% xlabel('t, sec.'), ylabel('signal magnitude')
% axis([-.00005 tfin -5 400]);
% title('Output signals for different values of T, Lindbo')
% legend('T=10^-^2','T=5(10)^-^3','T=2(10)^-^3','T=10^-^4','theoretical impulse response')

%-------------------------end of part C---------------------
% 
% clear
% tfin =.0004; Deltat=1e-6; numpts=round(tfin/Deltat);
% mvalues=0:1:(numpts-1);
% tsecs=mvalues*Deltat;
% 
% x=zeros(1,numpts);
% Tpulse=2e-5;
% PulsePoints=round(Tpulse/Deltat);
% pulse=ones(1,PulsePoints);
% x(1:PulsePoints)=(1/Tpulse)*pulse;
% 
% R=25; L=4e-4; C=1e-7;
% b= R/L;
% c= 1/(L*C);
% K1= (2+b*Deltat)/(1+b*Deltat+c*Deltat^2);
% K2= -1/(1+b*Deltat+c*Deltat^2);
% K3= (c*Deltat^2)/(1+b*Deltat+c*Deltat^2);
% 
% xcoeffs=[K3];
% ycoeffs=[1,-K1,-K2];
% y=filter(xcoeffs,ycoeffs,x);
% 
% subplot(211), plot(tsecs,x), grid
% xlabel('t, sec.'), ylabel('input, x(t)')
% axis([0 tfin -1000 75000]);
% title('Input, T=2e-5, Lindbo')
% 
% subplot(212), plot(tsecs,y), grid
% xlabel('t, sec.'), ylabel('output, y(t)')
% axis([0 tfin -30000 75000]);
% title('Simulation Output')

%-------------------end of part E--------------

clear
tfin =.001; Deltat=1e-7; numpts=round(tfin/Deltat);
mvalues=0:1:(numpts-1);
tsecs=mvalues*Deltat;

x=zeros(1,numpts);
Tpulse=2e-5;
PulsePoints=round(Tpulse/Deltat);
pulse=ones(1,PulsePoints);
x(1:PulsePoints)=(1/Tpulse)*pulse;

% R=25; L=4e-4; C=1e-7;
% b= R/L;
% c= 1/(L*C);
% K1= (2+b*Deltat)/(1+b*Deltat+c*Deltat^2);
% K2= -1/(1+b*Deltat+c*Deltat^2);
% K3= (c*Deltat^2)/(1+b*Deltat+c*Deltat^2);
R=200; L=2.5e-4; C=1e-6;
alpha= 1/(R*C);
beta= 1/(L*C);
K1= -(-2/(Deltat^2)-1/Deltat)/(1/(Deltat^2)+alpha/Deltat+beta);
K2= -(1/(Deltat^2))/(1/(Deltat^2)+alpha/Deltat+beta);
K3= alpha/(1/(Deltat^2)+alpha/Deltat+beta);

xcoeffs=[K3];
ycoeffs=[1,-K1,-K2];
y=filter(xcoeffs,ycoeffs,x);

subplot(211), plot(tsecs,x), grid
xlabel('t, sec.'), ylabel('input, x(t)')
axis([0 tfin -1000 75000]);
title('Input, T=2e-5, Lindbo')

subplot(212), plot(tsecs,y), grid
xlabel('t, sec.'), ylabel('output, y(t)')
%axis([0 tfin -30000 75000]);
title('Simulation Output')
