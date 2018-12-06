% G  = tf([1 -4 8],poly([-1.5 -3 -4 -5]));
% rlocus(G)

% G  = tf(poly([-4 -3]),[1 2 0]);
% rlocus(G)

%G  = tf( 1,[1.2 2 0])
%rlocus(G);

%TF = tf( 1,[1 0]);

%Ge = feedback(1.75*G,1);

%step(Ge,10)
%step(Ge*TF,10)

% syms s;
% syms K;
% G = tf(poly([-2 -6]),[1 8 25]);
% H = 1;

% K = (0:0.01:5)

% Ge = feedback(K*G,H)

%Ge = (K*G)/(1+K*G)

G = tf(poly([-5]),[1 3 4 12 0]);
H = tf(1,1);
nyquist(20*G*H)
