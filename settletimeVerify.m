% Is there anything wrong with the settling time approx formulae on p.13?
% Pei Ng and Yu Sun raised this issue in Lab 1 report

% 2015-09-14
% Y\"un Han 
% ECE 486 Lab 1 

%% preamble
clear % clear old values of variables in workspace
clc % clear command window
clf % clear existing figures
close all % close all existing windows

%% first test if zeta=.69 or .7 is a discontinuity
wn = 1;
% zeta = .69;
zeta = .69; % test zeta = .7 or .69
diffCritical = -.5/wn*log(1/400*(1 - zeta^2) ) - ... % approx from below
               (6.6*zeta - 1.6)/wn;                  % approx from above

SMALLNUM = 1e-2; % choose a small number 

if ( abs(diffCritical) < SMALLNUM )
    disp(['zeta = ', num2str(zeta), ' is probably not a discontinuity'])
else
    disp(['zeta = ', num2str(zeta), ' is probably a discontinuity'])
    disp(['the difference btwn approx of ts from below and above is ', ...
           num2str(diffCritical), ' [s]'])
end

%% parameters in lab 1
% wn = 1; % radius 1
% zeta = .7; % boundary point
disp(['use 2nd order TF w/ wn = 1 and zeta = ',num2str(zeta)])

%% approximation of ts on p.13 in lab book
% formulae on p.13
if (zeta > 0) && (zeta <= .69) % if 0 < zeta <= .69
    ts = -.5/wn*log(1/400*(1 - zeta^2));
elseif (zeta > .69) && (zeta < 3) % otherwise zeta < 3
    ts = (6.6*zeta - 1.6)/wn;
end

disp(['approximation of ts is ', num2str(ts), ' [s]'])

%% simulate the system and get settling time from internal routine stepinfo
% define 2nd order TF
sys = tf(wn^2, [1 2*zeta*wn wn^2]);
stepStats = stepinfo(sys,'SettlingTimeThreshold',.05); % 5% error strip
disp(['actual settling time is ', num2str(stepStats.SettlingTime), ' [s]'])
disp(['no body mentioned this problem before :( ', ...
      'thank you for raising this issue :)'])

% read conclusions from command line display

% comments: it seems the approx formulae on p.13 for ts work fine for zeta
% = .7 but not very so fine for zeta = .69

% end of verification
