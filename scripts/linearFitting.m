% linear fitting with dirty data set 

% 2017-09-25
% Y\"un Han
% ECE 486 Lab 4

%% preamble
% lab 4 - digital simulation of a closed loop system
% by me and partner 
% today's date 

%% 
clear     % clear values of (all) variables in workspace
clc       % clear messages in the command window
clf       % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% prepare a noisy data set
% create clean step response of a first order transfer function
% G(s) = 1/(1.5s + 1) with time constant 1.5[s]
sysG = tf(1, [1.5 1]);
% save step response of 10[s] in y(t) and t time array
[y, t] = step(sysG, 10);

% work on figure 1
figure(1) 
plot(t, y, 'b--') % clean data set

% padding clean data set with noise
tHead = 0:0.1:3; % add noise data of 3 seconds at the beginning of t
tHead = tHead';
yHead = 3*rand(size(tHead)); % noise
t = t + 3;       % shift time by 3 seconds b/c of added 3 extra seconds
tTail = t(end):0.1:t(end)+5; % add noise data at 5 seconds at the tail of t
tTail = tTail';
yTail = 5*rand(size(tTail));
% created noisy data sets: t, y arrays
t = [tHead; t; tTail];
y = [yHead; y; yTail];

% work on figure 2
figure(2)
plot(t, y, 'r') % noisy data set we are going to use
xlabel('Time [s]')
ylabel('Voltage [V]')
title('Collected Data of First Order System Response with Noise')

%% how to extract 'linear region' in the noisy data set [y, t]?
% the response was collected when a unit step input was applied to first
% order system transfer function. from fig.2, at time t = 11.2, y settles
% at 0.9958.

% although hardcoding steady state is not recommended, here I use
% hardcoding to illustrate a bigger picture, i.e., to extract linear region
% for data fitting.

vss = 0.9958; % get steady state voltage from data set
v = y;        % assign data to voltage array

% we have
% 
% Log(vss - v(t)) = -1/tau*t + Log(vss) -- (eqn. *)
% 
% since v(t) = vss*(1 - e^(-t/tau)), where tau is the time constant.
% read ./ece486_day5.html#maths behind scenes for more.
% 

% if we get the linear region correct, it will show as a line on the plot 
% for manipulated data according to Equation (*).

% work on figure 3
figure(3)
plot(t, log(vss - v))

% on fig.3, as expected, we saw a straight line between second 3ish and 13ish
% and now we apply data cursor to record a start point of the linear region
% e.g., tStrt = 3.5, and end point tEnd = 9.5. but we don't know their 
% indices in the array yet, so we need to use find() command

strtIdx = find(t > 3.5, 1, 'first'); % c.f. Lab 0 script
endIdx  = find(t > 9.5, 1, 'first'); 

% supposedly we get the linear region already. to verify, extract linear 
% portion of fig.3 and plot it on fig.4 

% work on figure 4
figure(4)
plot(t(strtIdx:endIdx), log(vss - v(strtIdx:endIdx)))

% now we can compute fitting result using fig.4 
lnCoeff = polyfit(t(strtIdx:endIdx), log(vss - v(strtIdx:endIdx)), 1);
% lnCoeff is a 2x1 vector, the first component is slope and second
% y-intercept.

% based on Equation (*), the slope of the straight line in fig. 4 is -1/tau.

% experimentally computed tau (should be close to 1.5) is
tauExp = - 1/lnCoeff(1) % tauExp = 1.3903

% question: why do we want to choose 'widest possible' linear range, i.e., in
% the above example, I chose t = 3.5 to 9.5. in practice, can we choose a 
% narrower range than that? for example, t = 5.5 to 6.0? what problem will we 
% have if use a narrower range?
