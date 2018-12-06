%This function gives the required differential equation matrix
%to use in MATLAB's ode23 function

% Inputs: 
% t = time (scalar)
% v = initial conditions [v(0) v'(0)]
% Output:
% y = v''(t) evaluated at input t (scalar)

% **This function can be adapted for any**
% ODE is of the form:
% v''(t) + b*v'(t) + c*v(t) = v_s(t)
% or equivalently:
% v''(t) = -bv'(t) - c*v(t) + v_s(t)
% **by replacing A and vs below with**
%  A = coefficients [0 1; -c -b]
%  vs = inputs [0 v_s(t)]

% This (example) ode_function uses the ODE:
% v''(t) = (-1/3)*v'(t) + (-5/4)*v(t) + 10*cos(2*pi*t)

function y = ode_function(t,v)
A = [0 1; -5/4 -1/3];
vs = [0; 10*cos(2*pi*t)];
y = A*v + vs ;
return