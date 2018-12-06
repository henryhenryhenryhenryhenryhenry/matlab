wz = 4000;
w1 = 500;
w2 = 1000;
w3 = 24000;
T0 = 100;
Gg0 = 0.5;

s = tf('s');
T = T0*(1+s/wz)/((1+s/w1)*(1+s/w2)*(1+s/w3));
Gvg = Gg0*1/((1+s/w1)*(1+s/w3));

%bode(T)
%margin(T)
%[Gm,Pm,Wcg,Wcp] = margin(T)

bode(Gvg)