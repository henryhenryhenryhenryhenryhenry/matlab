clear
t=[-1:.0001:10];
T=1;
y=heaviside(t);
x=-2*heaviside(t) + 2*heaviside(t-2*T)+ 3*heaviside(t-3*T) -3*heaviside(t-4*T)+ -heaviside(t-6*T) + heaviside(t-7*T);
plot(t,x)
axis([-1 10 -5 5]);