clear all;
syms w a real;

s = j*w;

% G = 1/((s^2+2*s+2)*(s+2))
% H=1
G = (s-1)/(s+1)
H = (s-2)/(s+2)



% Gtf = tf([1 -1], [1 1])
% Htf = tf([1 -2], [1 2])
% nyquist(Gtf*Htf)

eq1 = simplify(imag(G*H)) == 0
eq2 = w > 0;

sol = solve([eq1 eq2], w);
wo = sol

eq1 = subs(simplify(real(G*H)), w, wo) == -a
sol = solve(eq1, a)
K = 1/sol

% Ge = feedback(G,H)

% nyquist(G*H);

% G = tf(1,poly(-1 -3))
% % step(G, 10)
% tp = 0.95;
% zeta = 0.85;
% 
% newWn = pi/(tp*sqrt(1-zeta^2))
% newTs = 4/(newWn*zeta)
% pole = 4/newTs*tan(acos(zeta))*1i-4/newTs
% 
% theta1 = angle(pole+1)*180/pi
% theta2 = angle(pole+3)*180/pi
% % ho1 = theta;
% eq2 = theta - (theta1+theta2) == 180-360;
% ho1 = eval(solve(eq2, theta))
% pd = tf(poly(-imag(pole)/tand(ho1)+real(pole)), 1);
% pi = tf([1 0.1],[1 0])
% pid = pd*pi
% step(feedback(pid*G,1))