% This script illustrates the conecept of root locus by showing an
% animation of the poles of feedback system moving as the gain K changes.

% Assume that you have a feedback system with forward gain KG(s), where
% G(s) is given by (s+4)/((s+1)(s+2)) and feedback H(s) = (s+3).
G = tf([1 4],poly([-1 -2]));
H = tf([1 3],1);

% Next, we define a range of values of K
KRange = (0:0.02:4).^3;

% Next, we show an animation of how the poles in the equivalent transfer
% function move with K.
figure(1), clf;
subplot(2,1,1);
for K = KRange
    % Computing equivalen transfer function
    Ge = feedback(K*G,H);
    % Extracting coefficients of numerator and denominator
    [num den] = tfdata(Ge,'v');
    % Computing poles
    poles = roots(den);
    
    % Plotting poles
    plot(real(poles),imag(poles),'bx');
    axis([-4.5 0.5 -1 1]);
    title(sprintf('K = %7.2f',K));
    pause(0.02);
    if(K==0)
        pause;
    end
end

%% Plotting the root locus
subplot(2,1,2);
rlocus(G*H);
axis equal; axis([-4.5 0.5 -1 1]);