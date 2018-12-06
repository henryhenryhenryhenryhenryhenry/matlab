%   Ch7_5_EulersMethodFirstOrder.m
%   This script uses Euler's Method to numerically calculate the solution
%   of dv/dt+av=2*cos(2t)u(t), v(0)=1
%
clear all; close all;   %clear old variables, close old plots
a=2;                    %enter parameters of differential equation
h=0.1;                 %set step size
v(1)=1;                 %set the intial conditions                     
t=0:h:20;               %calculate the time t_k k=0,1,2
%
%   Euler's Method
%
for k=1:length(t)-1
    v(k+1)=v(k)-h*a*v(k)+h*2*cos(2*t(k));
end                 % 
%
%   Exact analytical solution 
%
ve=0.5*exp(-2*t)+1/(sqrt(2))*cos(2*t- pi/4);
%
%   Plot exact and numerical solutions
%
plot(t,v,'b-',t,ve,'r-','LineWidth',1.5)       %plot solutions versus t
axis([0,20,-1,1])               %set plot horizontal and vertical axes
xlabel('t (sec)')               %label t-axis
ylabel('v(t)')                  %label y-axis
legend('Eulers Method (h=0.01)','Analytical Solution') %add a legend to label the curves
title('Comparison of Eulers Method and Analytical Solution (Ch7_5_EulersMethodFirstOrder.m)','Interpreter','none')   %Add a title
grid on                         %add gridlines