clear all;
% G = tf(1.75,[1.2 2 0]);
% %rlocus(G)
% 
% OS = 0.05;
% zeta = -log(OS)/sqrt(pi^2 + log(OS)^2)
% 
% rMax = 1;
% [sOut,KOut] = fnc_rootLocusCrossing(G,zeta,rMax)
% 
% %------------------
% % Choosing the new dominant pole that reduces the peak time by 2
% p1 = 20*sOut;
% 
% % Computing poles and zeros of G(s)H(s)
% [num den] = tfdata(G,'v');
% zG = roots(num);
% pG = roots(den);
% 
% % Computing the angle needed for zero
% zAng = pi;
% for i = 1:length(zG)
%     zAng = zAng - angle(p1-zG(i));
% end
% for i = 1:length(pG)
%     zAng = zAng + angle(p1-pG(i));
% end
% zAng = mod(zAng,2*pi);
% fprintf('Angle for zero = %5.1f degrees\n',zAng*180/pi);
% 
% % Computing the location of the zero
% zc = real(p1) - imag(p1)/tan(zAng);
% fprintf('Zero located at zc = %5.2f\n',zc);
% 
% % Defining the PD Compensator
% Gc1 = tf([1 -zc],1)
% 
% %------------------
% 
% % Defining range of finding intercept with zeta line from diagram
% rMax = 1;
% 
% % Finding crossing
% [sOut_C1,KOut_C1] = fnc_rootLocusCrossing(G*Gc1,zeta,rMax);
% 
% % Displaying results
% fprintf('jw-intercept at %5.3f+%5.3fj with K = %6.2f\n',real(sOut_C1),...
%     imag(sOut_C1),KOut_C1);
% 
% % Computing the equivalent transfer function with the gain computed above
% Ge_C1 = KOut_C1*G*Gc1
% 
% % Plotting step response of the equivalent system
% %step(Ge_C1,50);
% 
% %------------------
% 
% % We add a PI Compensator with a zero at -0.01 (try values up to -0.3)
% Gc2 = tf([1 0.25],[1 0]);
% 
% % Plotting the locus
% %rlocus(Gc2*Gc1*G*H);
% %sgrid(zeta,0);
% 
% % Defining range of finding intercept with zeta line from diagram
% rMax = 1;
% 
% % Finding crossing
% [sOut_C2,KOut_C2] = fnc_rootLocusCrossing(G*Gc1*Gc2,zeta,rMax);
% 
% % Displaying results
% fprintf('jw-intercept at %5.3f+%5.3fj with K = %6.2f\n',real(sOut_C2),...
%     imag(sOut_C2),KOut_C2);
% 
% % Computing the equivalent transfer function with the gain computed above
% Ge_C2 = KOut_C2*G*Gc1*Gc2
% 
% % Plotting step response of the equivalent system
% %step(Ge_C2,50);
% 
% %------------------

Ha = feedback(38.22*tf([1 18.51 1.841],[1.2 2 0 0]),1)
Hb = tf([1], [1])
H = Ha*Hb
step(H, 1)
S = stepinfo(H)
