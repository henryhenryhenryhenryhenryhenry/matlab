function fnc_AnimateTrajectory(x0,x,tStep,ax)
%
% fnc_AnimateTrajectory(x0,x,tStep,ax)
%
% This function creates an animation from the provided x0 and x data
% structures. The step size 'tStep' is the size between time frames
% displayed. It has a default values of 0.1. The axis 'ax' specifies the
% windows to be used for display. Its default value is [-1 1 -1 1].

% Assigning default values to the input parameters
if(nargin<2)
    x = x0;
end

% Extracting coordinates
xya = x.Data;
xya0 = x0.Data;

% Computing axis for display
ax1 = [min(x0.Time) max(x0.Time) min([xya(:,1); xya0(:,1)]) ...
    max([xya(:,1); xya0(:,1)])];
ax1(4) = max(ax1(3)+1e-6,ax1(4));
ax2 = [min(x0.Time) max(x0.Time) min([xya(:,2); xya0(:,2)]) ...
    max([xya(:,2); xya0(:,2)])];
ax2(4) = max(ax2(3)+1e-6,ax2(4));
ax3 = [min(x0.Time) max(x0.Time) min([xya(:,3); xya0(:,3)]) ...
    max([xya(:,3); xya0(:,3)])];
ax3(4) = max(ax3(3)+1e-6,ax3(4));

% Radius of robot
L = 0.0889;

if(nargin<3)
    tStep = 0.1;
end
if(nargin<4)
    ax = [min(xya(:,1))-2*L max(xya(:,1))+2*L min(xya(:,2))-2*L ...
        max(xya(:,2))+2*L];
end

% Radius and width of wheel
Rw = 0.0254;
Ww = 0.0172;

% Computing times for animation
t = x0.Time;
t_Ani = t(1):tStep:t(end);

% Getting coordinates of robot
theta = linspace(0,2*pi,100);
xR = L*cos(theta);
yR = L*sin(theta);

% Creating coordinates for wheels
xW0 = [L-Ww L+Ww L+Ww L-Ww];
yW0 = [-Rw -Rw Rw Rw];

% Performing animation
figure(1), clf;
for i = 1:length(t_Ani)
    % Getting index ofdata used for display
    [~,idx] = min(abs(t-t_Ani(i)));
 
    % Getting coordinates of robot
    xC = xya(idx,1);
    yC = xya(idx,2);
    a = xya(idx,3);
    
    % Getting coordinates for orientation vector
    xA = xC + L*cos(a);
    yA = yC + L*sin(a);

    % Getting coordinates of wheels
    xW1 = cos(a+pi/3)*xW0 - sin(a+pi/3)*yW0 + xC;
    yW1 = sin(a+pi/3)*xW0 + cos(a+pi/3)*yW0 + yC;
    xW2 = cos(a-pi/3)*xW0 - sin(a-pi/3)*yW0 + xC;
    yW2 = sin(a-pi/3)*xW0 + cos(a-pi/3)*yW0 + yC;
    xW3 = cos(a+pi)*xW0 - sin(a+pi)*yW0 + xC;
    yW3 = sin(a+pi)*xW0 + cos(a+pi)*yW0 + yC;

    subplot(3,2,1);
    plot(t(1:idx),xya0(1:idx,1),'k:',t(1:idx),xya(1:idx,1),'b-');
    xlabel('time'); ylabel('x-Coordinate'); axis(ax1); grid on;
    legend('Desired','Output');
    
    subplot(3,2,3);
    plot(t(1:idx),xya0(1:idx,2),'k:',t(1:idx),xya(1:idx,2),'b-');
    xlabel('time'); ylabel('y-Coordinate'); axis(ax2); grid on;

    subplot(3,2,5);
    plot(t(1:idx),xya0(1:idx,3),'k:',t(1:idx),xya(1:idx,3),'b-');
    xlabel('time'); ylabel('Orientation'); axis(ax3); grid on;
    
    subplot(1,2,2); cla;
    patch(xR+xC,yR+yC,[0.75 0.75 0.75]); hold on;
    plot([xC xA],[yC yA],'r-','linewidth',2);
    plot(xya0(1:idx,1),xya0(1:idx,2),'k:');
    patch(xW1,yW1,[0 0 0]);
    patch(xW2,yW2,[0 0 0]);
    patch(xW3,yW3,[0 0 0]); hold off;
    title(sprintf('time = %5.2f',t_Ani(i)));
    axis equal; axis(ax);
    
    pause(tStep);
end
