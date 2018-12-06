% tmin=-pi;
% tmax=25*pi;
% tstep=pi/200;
% t=tmin:tstep:tmax;
% u=t>=0;
% x=exp(-.1*t).*u;
% s=cos(pi*t).*x;
% plot(t,s);
% axis([-10,90,-1,2]);

% f=250;
% T=1/f;
% tstep=T/100;
% tmax=10*T;
% tmin=0;
% t=tmin:tstep:tmax;
% duty=0.5;
% x=zeros(length(t),1);
% for ii=1:length(x)
%     if(mod(ii,100)<duty*100)
%         x(ii)=1;
%     end
% end
% plot(t,x);
% axis([0,0.04,-0.1,1.1]);

% z1=j;
% z2=1;
% z3=1+j;
% z4=conj(z3);
% compass(z3);
% hold on;
% compass(z4);

% n=1:4;
% z=exp((-j*pi*n)/2);
% compass(z);

% n=1:4;
% z=(1+j).^n;
% compass(z);

z1=-2*exp(j*(pi/4));
z2=4-2j;
cartesian=((z1)^2).*conj(z2)
rho=((real(cartesian)^2)+(imag(cartesian)^2))^(0.5)
theta=atan2(imag(cartesian),real(cartesian))
exponential=rho*exp(j*(theta));

