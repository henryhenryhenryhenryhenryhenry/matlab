%question 1

% clear
% %t=[-1:.0001:10];
% syms t;
% yu=(1-exp(-50*t)).*heaviside(t);
% p=heaviside(t)-heaviside(t-.02);
% x=(heaviside(t)-heaviside(t-.02))-(heaviside(t-.04)-heaviside((t-.04)-.02));
% 
% H = laplace(yu)/laplace(heaviside(t));
% X = laplace(x);
% Y = H*X;
% syms s;
% y = ilaplace(Y)
% % heaviside(t - 3/50) - heaviside(t - 1/25) - heaviside(t - 1/50) - exp(-50*t) + heaviside(t - 1/25)*exp(2 - 50*t) + heaviside(t - 1/50)*exp(1 - 50*t) - heaviside(t - 3/50)*exp(3 - 50*t) + 1
% 
% t=0:.0001:.2;
% y=heaviside(t - 3/50) - heaviside(t - 1/25) - heaviside(t - 1/50) - exp(-50*t) + heaviside(t - 1/25).*exp(2 - 50*t) + heaviside(t - 1/50).*exp(1 - 50*t) - heaviside(t - 3/50).*exp(3 - 50*t) + 1;
% x=(heaviside(t)-heaviside(t-.02))-(heaviside(t-.04)-heaviside((t-.04)-.02));
% plot(t,x), hold on %1a
% plot(t,y) %1b
% axis([0 .2 -5 5]);
% grid on;

%question 2

clear
%t=[-1:.0001:10];
syms t;
%d=dirac(t);
h=0.7*dirac(t-.005)-0.6*(t-.007);
x1=(3*sin(2*pi*1000*t)).*(heaviside(t)-heaviside(t-(4/1000)));


X = laplace(x1);
H = laplace(h);
Y1 = X*H;

syms s;
y1 = ilaplace(Y1)
% (6000*pi*exp(-s/250)*((7*exp(-s/200))/10 + (3*((7*s)/1000 - 1))/(5*s^2)))/(s^2 + 4000000*pi^2)
% 3600*pi*ilaplace(1/(s^2*(4000000*pi^2*exp(s/250) + s^2*exp(s/250))), s, t) - (126*pi*ilaplace(1/(s*(4000000*pi^2*exp(s/250) + s^2*exp(s/250))), s, t))/5 - 3600*pi*(t/(4000000*pi^2) - sin(2000*pi*t)/(8000000000*pi^3)) - (126*pi*(cos(2000*pi*t)/(4000000*pi^2) - 1/(4000000*pi^2)))/5 - 4200*pi*heaviside(t - 1/200)*ilaplace(1/(4000000*pi^2*exp(s/250) + s^2*exp(s/250)), s, t - 1/200) + 4200*pi*heaviside(t - 1/1000)*ilaplace(1/(4000000*pi^2*exp(s/250) + s^2*exp(s/250)), s, t - 1/1000)


t=-1:.0001:10;
x=(3*sin(2*pi*1000*t)).*(heaviside(t)-heaviside(t-(4/1000)));
%y=(21*heaviside(t - 9/1000).*sin(2000*pi*(t - 9/1000)))/10 + 3600*pi*heaviside(t - 1/250).*(sin(2000*pi*(t - 1/250))/(8000000000*pi^3) - (t - 1/250)/(4000000*pi^2)) + (126*pi*heaviside(t - 1/250).*(1/(4000000*pi^2) - cos(2000*pi*(t - 1/250))/(4000000*pi^2)))/5;
%y=3600*pi*ilaplace(1/(s^2*(4000000*pi^2*exp(s/250) + s^2*exp(s/250))), s, t) - (126*pi*ilaplace(1/(s*(4000000*pi^2*exp(s/250) + s^2*exp(s/250))), s, t))/5 - 3600*pi*(t/(4000000*pi^2) - sin(2000*pi*t)/(8000000000*pi^3)) - (126*pi*(cos(2000*pi*t)/(4000000*pi^2) - 1/(4000000*pi^2)))/5 - 4200*pi*heaviside(t - 1/200)*ilaplace(1/(4000000*pi^2*exp(s/250) + s^2*exp(s/250)), s, t - 1/200) + 4200*pi*heaviside(t - 1/1000)*ilaplace(1/(4000000*pi^2*exp(s/250) + s^2*exp(s/250)), s, t - 1/1000);


plot(t, x), hold on %2a
%plot(t, y) %2b
axis([0 15e-3 -5 5]);
grid on;



