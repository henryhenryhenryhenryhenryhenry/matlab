syms t;
%v = exp(4-t)* heaviside(t-4);
v=exp(-2*t)*sin(5*t)*heaviside(t);
laplace(v)

