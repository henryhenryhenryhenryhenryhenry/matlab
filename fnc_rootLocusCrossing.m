function [sOut,KOut] = fnc_rootLocusCrossing(GH,zeta,rMax,prec,rMin)
%
% [sOut,KOut] = fnc_rootLocusCrossing(GH,zeta,rMax,prec,rMin)
%
% This function computes the location of the pole (and gain) corresponding
% to the intercept between the zeta line and the root locus associated
% with the negative feedback system with G(s)*H(s) specified by GH. The
% variables rMin, rMax and prec identify the range of values to be used for
% searching for this intercept and the precision. Use zeta = 0 for
% jw-intercept computations.

% Setting default values of precision and minimum range 
if(nargin==3)
    prec = 0.001;
end
if(nargin<5)
    rMin = prec;
end

% Computing angle that for the zeta line
theta = 180 - acosd(zeta);

% Obtaining points in the jw-axis: Magnitude * phase
s = (rMin:prec:rMax)*exp(theta*pi/180*1j);

% Computing G(s)*H(s)
[num,den] = tfdata(GH,'v');
GHs = polyval(num,s)./polyval(den,s);

% Determining phase(G(s)*H(s)) in degrees
ang_GH = angle(GHs)*180/pi;

% Computing offset of phase(G(s)*H(s)) from (2q+1)*180
offset_GH = abs(mod(ang_GH-180,360));

% Exctracting pole location and gain
[~,idx] = min(offset_GH);
sOut = s(idx);
KOut = 1/abs(GHs(idx));