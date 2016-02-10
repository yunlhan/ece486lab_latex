% how to create var names from strings?
% Chris Charhut posed this question

% 2016-02-09
% Y\"un Han
% ECE 486 Lab 2

%% 
clear % clear values of variables in workspace
clc % clear messages in the command window
clf % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% create cell of strings
y2appendixCell = {'a', 'b', 'c', 'd', 'e'};

for i = 1:numel(y2appendixCell)
   % in the following loops, create y2a = 1, y2b = 2, ... 
   % y2a, y2b, ... are type double 
  
   % try assign a 1d array on the right hand side, note we manually include a
   % pair of brackets []
   y2 = linspace(0,i,10); % dummy 1d double array, like y2 in lab 2
   eval(['y2',y2appendixCell{i},' = [', num2str(y2),'];']) % eval the string literally
   % but this is not recommended according to matlab users since 'eval'
   % slows down general performance of scripts
   
end

% see results in command window or workspace