%   Ch7_6_ODE23Example.m
%   This script uses ODE23 to numerically calculate the solution
%   of dv/dt+2*v=2*cos(2t)u(t), v(0)=1
%
clear all; close all;   %clear old variables, close old plots
%
%   ODE23
%
[t,v]=ode23(@mydefunction,[0,20],1);              % 
%
%   Exact analytical solution 
%
h=0.01;                 %set step size                     
t1=0:h:20;               %calculate the time t_k k=0,1,2
ve=0.5*exp(-2*t1)+1/(sqrt(2))*cos(2*t1- pi/4);
%
%   Plot exact and numerical solutions
%
plot(t,v,'b-',t1,ve,'r-','LineWidth',1.5)       %plot solutions versus t
axis([0,20,-1,1])               %set plot horizontal and vertical axes
xlabel('t (sec)')               %label t-axis
ylabel('v(t)')                  %label y-axis
legend('ODE23','Analytical Solution') %add a legend to label the curves
title('Comparison of ODE23 and Analytical Solution (Ch7_6_ODE23Example.m)','Interpreter','none')   %Add a title
grid on                         %add gridlines