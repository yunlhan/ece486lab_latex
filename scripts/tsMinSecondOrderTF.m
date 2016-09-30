% prove (experimentally) the setting time ts achieves min when zeta = .7
% how to run this file: in command line, type tsMinSecondOrderTF 
% then see the figures

function tsMinSecondOrderTF
%% preamble
clear
clc
clf
close all

%% create a second order transfer function with varying zeta and generate its step response
% we only have to specify zeta and wn
zeta = .2:.002:.9; % range of damping ratio
wn = 2; % natural frequency

% create data storage
y = cell(size(zeta)); % cell type can save data arrays with different lengths
t = cell(size(zeta));
ts = zeros(size(zeta));

for i = 1:numel(zeta)
    % loop over zeta's
    sys = tf(wn^2,[1 2*zeta(i)*wn wn^2]);
    [y{i}, t{i}] = step(sys,0:.01:15);
    stepStats = stepinfo(sys,'SettlingTimeThreshold',.05); % 5% error strip
    ts(i) = stepStats.SettlingTime;
end

[tsMin, tsMin_idx] = min(ts); % get min ts and its index

%% plots
% overlaid responses for varying zeta
figure(1)
for i = 1:numel(zeta)
    % plot response
    plot(t{i},y{i},'b')
    % hold on for overlaying
    if i == 1
        hold on
    end
    % plot its envelope
    plot(t{i},envelope(zeta(i),wn,t{i}),'r--') % envelope function defined below
end
% also plot envelope of the outer most response
% plot(t{1},1+exp(-zeta(1)*wn*t{1})/sqrt(1-zeta(1)^2),'r--')
ylim([0,3])
xlabel('time [s]')
ylabel('time domain response')
title(['Time domain response of second order transfer function with varying \zeta (\omega_n = ',num2str(wn),' rad/s)'])
text(3.5,envelope(zeta(1),wn,3.5),'\leftarrow red lines: envelope of decaying exponential')
text(3.51,0.7685,'\leftarrow blue lines: decaying exponential reponses')
text(1.95,2,['\zeta = ',num2str(zeta(tsMin_idx)),' gives the minimum value for settling time ts (5% bound)'])
text(1.95,1.8,['\zeta varies between ',num2str(zeta(1)),' and ',num2str(zeta(end)), ...
               ' with spacing ',num2str(zeta(2)-zeta(1))])
text(9.5,2.5,'$$\frac{Y(s)}{U(s)} = \frac{\omega_n^2}{s^2+2\zeta\omega_n s+\omega_n^2}$$','interpreter','latex','edgecolor','black')           
% grid on
hold off 
% end of figure(1)

% plot ts vs zeta
figure(2)
plot(zeta,ts)
xlabel('\zeta')
ylabel('settling time t_s [s]')
title('Settling time t_s vs. \zeta')
text(zeta(tsMin_idx),tsMin,['minimum setting time t_s = ',num2str(tsMin),' [s] \rightarrow'],...
                            'horizontalalignment','right')
disp(['the min ts is ',num2str(tsMin),' [s]', ...
      ' when zeta = ',num2str(zeta(tsMin_idx))])
% end of figure(2)  
end

% define envelope of 2nd order system response
function envelopeValue = envelope(zeta, wn, t)
    envelopeValue = 1+exp(-zeta*wn*t)/sqrt(1-zeta^2);
end