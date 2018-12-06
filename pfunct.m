% function v1 = pfunct(t,v)
% A = [0,1; -7/4,-1/2];
% b = [0;2];
% v1 = A*v + b;
% 
% end
function v1 = pfunct(t,v)
A= [ -t, (1-t); -2*(1-t), -2*t];
b= [ 1-t; t];
v1 = A*v + b;

end