% A=[2,0;-1,-1;0,-2]
% B=[1,1;-2,3;-1,1]
% Asize=size(A)
% Bsize=size(B)
% Atrans=A'
% Btrans=B'
% S=A+B
% D=A-B
% M1=A.*3
% syms t
% M2=10.*B*t
% D1=A./2
% P1=A*A'
% P2=A*ones(2,3)
% P3=A*eye(2)
% P4=eye(3)*A

% initial = [0;0;1]
% T1=[1,0,5;0,1,0;0,0,1]
% R1=[0,-1,0;1,0,0;0,0,1]
% T2=[1,0,0;0,1,-2;0,0,1]
% R2=[-1,0,0;0,-1,0;0,0,1]
% Finv=inv(T1)*inv(R1)*inv(T2)*inv(R2)
% F=inv(Finv)
% finalPosition=F*initial
% initialPosition=Finv*finalPosition

x=[-1 1 1 -1 -1]
y=[-1 -1 1 1 -1]
rotation(x,y,45)