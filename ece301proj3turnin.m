clear
deltat = 1e-8; T = 2e-6;
A = 5;         fc1 = 5e6; fc2 = 10e6;

PulsePoints = round(T/deltat);
boft = ones(1,PulsePoints);
Aboft = A*boft;

a1 = [1  1 -1  1 -1 -1 1 -1];
a2 = [1 -1 -1 -1  1 -1 1  1];
numbits = length(a1);
goft1 = a1(1)*Aboft; goft2 = a2(1)*Aboft;
for n = 2:numbits
    goft1 = [goft1, a1(n)*Aboft];
    goft2 = [goft2, a2(n)*Aboft];
end

totpts = length(goft1); tfinal = (totpts-1)*deltat;
tsecs = 0:deltat:tfinal;

% subplot(211), plot(tsecs,goft1)
% axis([-10*deltat tfinal+10*deltat -7 7]), grid
% xlabel('t'), ylabel('g1(t)'), title('Baseband Analog g1(t) Signal [Lindbo]')
% 
% subplot(212), plot(tsecs,goft2)
% axis([-10*deltat tfinal+10*deltat -7 7]), grid
% xlabel('t'), ylabel('g2(t)'), title('Baseband Analog g2(t) Signal [Lindbo]')


xoft1 = goft1.*cos(2*pi*fc1*tsecs);
xoft2 = goft2.*cos(2*pi*fc2*tsecs);

% subplot(311), plot(tsecs,xoft1)
% axis([-10*deltat tfinal+10*deltat -7 7]), grid
% xlabel('t'), ylabel('x1(t)'), title('RF analog signal x1(t) [Lindbo]')
% 
% subplot(312), plot(tsecs,xoft2)
% axis([-10*deltat tfinal+10*deltat -7 7]), grid
% xlabel('t'), ylabel('x2(t)'), title('RF analog signal x2(t) [Lindbo]')

roft = xoft1 + xoft2;

% subplot(313), plot(tsecs,roft)
% axis([-10*deltat tfinal+10*deltat -15 15]), grid
% xlabel('t'), ylabel('r(t)'), title('received RF analog signal r(t) [Lindbo]')



% - - - - - - - - - - transmission - - - - - - - - - - - -


doft1 = roft.*cos(2*pi*fc1*tsecs);
doft2 = roft.*cos(2*pi*fc2*tsecs);

R = 400; C = 7.95774715e-10; b = 1/(R*C); % 3dB bandwidth is 500 KHz
bdel = b*deltat;
K1 = 1/(1+bdel); K2 = bdel/(1+bdel);
ycoeffs = [1, -K1]; dcoeffs = [K2];

yoft1 = filter(dcoeffs,ycoeffs,doft1);
yoft2 = filter(dcoeffs,ycoeffs,doft2);

subplot(211), plot(tsecs,yoft1), grid, hold on
xlabel('t, sec.'), ylabel('output, y1(t)')
axis([-10*deltat tfinal+10*deltat -7 7]);
title('RC-filter Output y1(t) at Receiver [Lindbo]')

plot(T, yoft1(PulsePoints), '*'),
plot(2*T, yoft1(2*PulsePoints), '*')
plot(3*T, yoft1(3*PulsePoints), '*')
plot(4*T, yoft1(4*PulsePoints), '*')
plot(5*T, yoft1(5*PulsePoints), '*')
plot(6*T, yoft1(6*PulsePoints), '*')
plot(7*T, yoft1(7*PulsePoints), '*')
plot(8*T, yoft1(8*PulsePoints), '*')
grid

subplot(212), plot(tsecs,yoft2), grid, hold on
xlabel('t, sec.'), ylabel('output, y2(t)')
axis([-10*deltat tfinal+10*deltat -7 7]);
title('RC-filter Output y2(t) at Receiver [Lindbo]')

plot(T, yoft2(PulsePoints), '*'),
plot(2*T, yoft2(2*PulsePoints), '*')
plot(3*T, yoft2(3*PulsePoints), '*')
plot(4*T, yoft2(4*PulsePoints), '*')
plot(5*T, yoft2(5*PulsePoints), '*')
plot(6*T, yoft2(6*PulsePoints), '*')
plot(7*T, yoft2(7*PulsePoints), '*')
plot(8*T, yoft2(8*PulsePoints), '*')
grid

