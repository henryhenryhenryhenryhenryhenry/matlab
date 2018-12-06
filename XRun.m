% This is a simple script that illustrates how to animate the robot.

% Parameters of simulation
Tf = 10;
dt = 0.01;

% Displaying an animation
figure(1), clf;
m_animateMotion(@m_xyCoord,Tf,dt);
