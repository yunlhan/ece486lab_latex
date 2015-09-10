% loop over different line styles in the figure
% Yu Sun & Pei Ng posed this question

% 2015-09-08
% Y\"un Han
% ECE 486 Lab 1

%% 
clear % clear values of variables in workspace
clc % clear messages in the command window
clf % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% get 8 different graphs, which is not important
t = linspace(0,10,101); % generate time array
y = zeros(8,length(t)); % init y array
for i = 1:8
    y(i,:) = sin(i/8*t); % each row of y is y(t)
end

%% loop over different line styles, which was the issue
% create a cell of strings
% lineStyles = ['r- ';'b: ';'g-.';'k--']; % method #1
% cellstr strips the space
% lineStyles = cellstr(lineStyles);
% in the code below, use 'char' to convert the cell string back to normal
% string

lineStyles = {'r-','b:','g-.','k--'}; % method #2
%% plot code
figure(1) % name a figure window
for i = 1:8
    
    % plot the graphs with looping line styles
    % mod(i,4)+1 ranges 1 through 4
    % the first applied line style is the 2nd in the lineStyles array
    % plot(t,y(i,:),char(lineStyles(mod(i,4)+1))) % method #1

    plot(t,y(i,:),lineStyles{mod(i,4)+1}) % method #2
    % only hold on once
    if (i == 1)
        hold on
    end
        
end

% decorate the figure
plt_opt = {'interpreter','latex'};
title('Loop over different linestyles')
xlabel('$t$ [s]', plt_opt{:})
ylabel('$y(t)$ [V]', plt_opt{:})
plt_lgnd = legend('$y_1 = \sin(1/8t)$', ...
                  'y2', ...
                  'y3', ...
                  'y4', ...
                  '$y_5 = \sin(5/8t)$', ...
                  'y6', ...
                  'y7', ...
                  'y8','location','southwest');
set(plt_lgnd, plt_opt{:})           
% see the resulting figure  
