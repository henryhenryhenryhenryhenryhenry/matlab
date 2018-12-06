function [sOut,KOut] = fnc_rootLocusBreakAway(GH,sMin,sMax,prec)
%
% [sOut,KOut] = fnc_rootLocusBreakAway(GH,sMin,sMax,prec)
%
% This function computes the location of the break away point for a
% feedback system with G(s)*H(s) specified by the transfer function GH. The
% break away point is obtained by computing gains for the range specified
% by sMin and sMax, and with a precision of prec.

% Setting default values of precision and minimum range 
if(nargin==3)
    prec = 0.001;
end

% Obtaining points in the jw-axis: Magnitude * phase
s = (sMin:prec:sMax);

% Computing G(s)*H(s)
[num,den] = tfdata(GH,'v');
GHs = polyval(num,s)./polyval(den,s);

% Computing gains
K = abs(1./GHs);

% Exctracting pole location and gain
[~,idx] = max(K);
sOut = s(idx)
KOut = K(idx)

