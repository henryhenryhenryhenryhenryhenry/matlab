%   mydefunction.m
%   This script calculates f(t,v) for the DE example in
%   Ch7_6_ODE23Example.m
%
function y=mydefunction(t,v) %name of new function
y=-2*v+2*cos(2*t);
return