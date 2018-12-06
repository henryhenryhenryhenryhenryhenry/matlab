function s_out = hw_rectifier(s_in) 
N = length(s_in); 
for k = 1:N 
if s_in(k) < 0 
s_out(k) = 0; 
else s_out(k) = s_in(k); 
end 
end 
return