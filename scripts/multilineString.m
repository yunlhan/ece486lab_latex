% how to multiline strings in legend, title etc
% Michael Zhang raised this question

% 2017-09-28
% Y\"un Han
% ECE 486 Lab 3

%% preamble
clear     % clear values of variables in workspace
clc       % clear messages in the command window
clf       % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% multiline title and alignment in legend on a dummy figure

% random functions; does not really matter
t  = 0:.1:10;
y1 = sin(t);
y2 = 2*y1;
y3 = 2*y2;

% overlay plot of above three
figure(1)
plot(t, y1, 'r')
hold on
plot(t, y2, 'g--')
plot(t, y3, 'b:', 'linewidth', 2)
% how to multiline title, use cell {} data type
title({'This is an overlaid plot of', ...
       'graph y_1', ...
       'graph y_2', ...
       'graph y_3'})
xlabel('t')
ylabel('y(t)')

% how to align in legend
% '%-20s' means left justified string of length 20 char
lgnd_ln1 = [sprintf('%-20s','y_1(t) blah '), 'aligned here'];
lgnd_ln2 = [sprintf('%-23s','y_2(t) '),      'aligned here'];
legend(sprintf('%-50s', lgnd_ln1), ...
       sprintf('%-50s', lgnd_ln2), ...
       ['y_3(t) ','not aligned' ], ...
       'location', 'best')
% note: this is what I can come up with so far, if you know a better
% solution, please let me know. my problem is with using a different width
% in the second sprintf, 23 is different from 20, which does not make sense
% to me.
