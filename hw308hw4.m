%grasons #s 5% OS, settle 1ms, R1 = 1M, L = 2H

clear all;
% syms i1 i2 vi vc r2 c s
% eq1 = -vi+4*s*i1+i1*2e6-i2*2e6==0;
% eq2 = i2*2e6-i1*2e6+r2*i2+(1/(c*s))*i2==0;
% S = solve([eq1 eq2], [i1 i2]);
% S.i2*(1/(c*s))
syms wn c r2
z = -log(0.05)/sqrt(pi^2+log(0.05)^2)
eq1 = (500e3*c*r2+1)/(2e6*c+c*r2) == 2*z*wn;
eq2 = 500e3/(2e6*c+c*r2) == wn^2;
eq3 = z*wn == 4/0.002;

S = solve([eq1 eq2 eq3], [wn c r2]);
double(S.wn)
double(S.c)
double(S.r2)