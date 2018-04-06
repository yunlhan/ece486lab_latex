% numerical evidence of the image of small semi circle used to avoid poles
% on the imag axis under G(s) is also a circle (and why at the end)

% 2017-04-05
% Y\"un Han
% ECE 486 Midterm 2

%% preamble
clear     % clear values of (all) variables in workspace
clc       % clear messages in the command window
clf       % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% image of an r-circle under proper rational functions G(s) (transfer function)
% Question: Is the image also a circle? 
r = 1e-4;                       % r < 1 (try r > 1 also, wont give images as circles)
theta = 0:0.001:2*pi;           % complex s = re^(i*theta) in polar form
circPointsX = r*cos(theta);     % real part of the pt on the r-circle
circPointsY = r*sin(theta);     % imag part
figure(100)
plot(circPointsX,circPointsY)

GsPoints = RationalG(circPointsX,circPointsY); % generate the image G(X+iY)
GsPointsX = real(GsPoints);
GsPointsY = imag(GsPoints);
figure(101)
scatter(GsPointsX,GsPointsY)
axis('equal')

function Gs = RationalG(x, y)
    % G(s) = b(s)/a(s)
    % G(s) = (b3*s^3 + b2*s^2 + b1*s + b0)/(a4*s^4 + a3*s^3 + a2*s^2 + a1*s + a0)
    b3 = 1;
    b2 = 2;
    b1 = 3;
    b0 = 1;
    a4 = 1;
    a3 = 0;
    a2 = 5+1i;
    a1 = 0;
    a0 = 1;

    s = x+y*1i;
    Gs = (b3*s.^3 + b2*s.^2 + b1*s + b0)./(a4*s.^4 + a3*s.^3 + a2*s.^2 + a1*s + a0);
end

% comment: when this r-circle is small enough, i.e., r << 1, higher order
% terms are dominated by linear terms resp. in b(s) and a(s). so the
% transfer function G(s) can be thought of as G(s) = (b1*s + b0)/(a1*s +
% a0). the image of r-circle under the this approx G(s) is equivalent to
% r-circle under the normal mobius transform M(z) = az + b / cz + d, which
% is known to map (generalised) circle to (generalised) circle. This is the
% reason why the tiny semi circular path (workaround used in Nyquist
% criterion) is mapped to a large circle at infinity.