clear
deltat = 1e-7; T = 1e-5;
A = 5;         fc = 1e6;

PulsePoints = round(T/deltat);
boft = ones(1,PulsePoints);
Aboft = A*boft;

a = [1 -1 1];
numbits = length(a);
goft = a(1)*Aboft;
for n = 2:numbits
    goft = [goft, a(n)*Aboft];
end

totpts = length(goft); tfinal = (totpts-1)*deltat;
tsecs = 0:deltat:tfinal;

subplot(411), plot(tsecs,goft)
axis([-10*deltat tfinal+10*deltat -7 7]), grid
xlabel('t'), ylabel('g(t)'), title('Baseband Analog g(t) Signal')

xoft = goft.*cos(2*pi*fc*tsecs);

subplot(412), plot(tsecs,xoft)
axis([-10*deltat tfinal+10*deltat -7 7]), grid
xlabel('t'), ylabel('x(t)'), title('RF Analog Transmitted Signal')

% - - - - - - - - - - transmission - - - - - - - - - - - -

roft = xoft;
doft = roft.*cos(2*pi*fc*tsecs);

subplot(413), plot(tsecs,doft)
axis([-10*deltat tfinal+10*deltat -7 7]), grid
xlabel('t'), ylabel('d(t)'), title('Demodulator Output')

R = 1000; C = 1.59e-9; b = 1/(R*C);
bdel = b*deltat;
K1 = 1/(1+bdel); K2 = bdel/(1+bdel);
ycoeffs = [1, -K1]; dcoeffs = [K2];
yoft = filter(dcoeffs,ycoeffs,doft);

subplot(414), plot(tsecs,yoft), grid, hold on
xlabel('t, sec.'), ylabel('output, y(t)')
axis([-10*deltat tfinal+10*deltat -7 7]);
title('RC-filter Output at Receiver')

plot(T, yoft(PulsePoints), '*')
plot(2*T, yoft(2*PulsePoints), '*')
plot(3*T, yoft(3*PulsePoints), '*')
grid
