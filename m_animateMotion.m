function m_animateMotion(fHandle,Tf,dt)

% Maximum range
maxRange = 2;

% Getting the time points
tRange = 0:dt:Tf;

% Initializing coordinates
x = zeros(size(tRange));
y = zeros(size(tRange));

for i = 1:length(tRange)
    [x(i) y(i)] = fHandle(tRange(i));
    
    subplot(2,2,1); plot(tRange(1:i),x(1:i),'b-'); grid on;
    xlabel('time'); ylabel('x(t)'); axis([0 tRange(i)+dt -maxRange maxRange]);
    subplot(2,2,3); plot(tRange(1:i),y(1:i),'b-'); grid on;
    xlabel('time'); ylabel('y(t)'); axis([0 tRange(i)+dt -maxRange maxRange]);
    subplot(1,2,2); m_plotRobot(x(i),y(i)); hold on;
    plot(x(1:i),y(1:i),'b-','linewidth',2); hold off;
    title(sprintf('t = %4.1f',tRange(i)));
    
    pause(0.01);
end
