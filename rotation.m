function rotation( x,y,angle )
%inputs are intitial position in x and y vectors and an angle in
%degrees, output is the rotated plot

theta = [cosd(angle),-sind(angle);sind(angle),cosd(angle)];
coords = [x;y];
rotated = zeros(size(coords));
for ii=1:length(x)
    rotated(:,ii)=theta*coords(:,ii)
end
figure
plot(rotated(1,:), rotated(2,:))
axis equal
axis([-4 4 -4 4])

end

