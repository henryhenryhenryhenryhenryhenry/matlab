% syms t;
% x = exp(-t^2);
% X = fourier(x)

syms f;
X = .02*exp(-j*0.0471*f);
x =ifourier(X)