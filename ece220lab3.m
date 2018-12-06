% w = -10:0.01:10;
% H = exp(-j*(w/2))./((1+j*w).^3);
% magH = abs(H);
% phsH = angle(H);
% 
% subplot(2,1,1)
% plot(w,magH)
% subplot(2,1,2)
% plot(w,phsH)

% n = -20:0.01:20;
% P = (1./(j*pi*n)).*(cos((n*pi)/5)-cos((3*n*pi)/5));
% P(n==0) = 0;
% 
% magP = abs(P);
% phsP = angle(P);
% 
% subplot(2,1,1)
% plot(n,magP)
% subplot(2,1,2)
% plot(n,phsP)

% syms z
% roots = solve(z^3 - 27*j)
% roots = double(roots);
% compass(roots)

% syms z
% roots = solve(z^5 +32)
% roots = double(roots);
% compass(roots)


f = 60;
for ii=1:5
%f = 60;
w = 2*pi*f;
R = 100;
C = 1e-9;
H = 1/(1j*w*R*C + 1);
% Vc(t0) = 100*cos(2*pi*F*t + pi/4);
vsmag = 100;
vsphs = pi/4;
Vs = vsmag*exp(1j*vsphs);
% H = Vc/Vs
Vc = H*Vs;
vcmag = abs(Vc);
vcphs = angle(Vc);

T = 1/f;
tstep = T/100;
tmax = T*4;
t = 0:tstep:tmax;
vc = vcmag*cos(2*pi*f*t + vcphs);
vs = vsmag*cos(2*pi*f*t + vsphs);

figure
subplot(2,1,1)
plot(t,vs)
str = sprintf('Vs,   Frequency: %7.0f', f);
title(str, 'Fontsize', 18);
subplot(2,1,2)
plot(t,vc)
str = sprintf('Vc,   Frequency: %7.0f', f);
title(str, 'Fontsize', 18);

f = f*10;
end