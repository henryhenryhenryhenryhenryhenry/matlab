t = 0:0.001:4; 
s = cos(2 * pi * t); 
s_rect = hw_rectifier(s); 
plot(t,s_rect) 
% omit setting axes for best display

