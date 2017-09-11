%% MATLAB function tutorial
% multiple functions in a single file
%%

% 2015-09-03
% Y\"un Han
% ECE 486 Lab 

%% outer loop function

% keyword function, keyword FUNCTION_NAME are necessary
function dummyFunction 
% dummy outer function calls another function within the same file. This
% immediate documentation line after function FUNCTION_NAME will be shown 
% as preview in file explorer

clear % clear var values in workspace
clc   % clear messages in command window

% call another function in the same file
[m, n] = dummyFunction2

end % you can comment it out 

%% nested function

% () were omitted in dummyFunction since there are no input arguments, []
% can also be omitted if there are no output arguments

function [a, b] = dummyFunction2() 
    a = 1;
    b = 2;
    disp('hello from a dummy function2') 
end % you can comment it out

% Problem 1: run this file, why 'hello from a dummy function2' comes BEFORE
% m, n values displayed in command window?

% Problem 2: go to PUBLISH tab and try 'publish' button with this snippet.
% Can you format the code with proper table of contents, headlines and 
% titles/subtitles? (hint: see PUBLISH MARKUP in matlab documentation)
