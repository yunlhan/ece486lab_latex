% Is pi a built-in function or built-in constant in matlab? (both, sort of)
% Sarah Garrow raised this question

% 2016-10-13
% Y\"un Han
% ECE 486 Lab 5

% pi() is indeed a function rather than a variable (The output argument of
% pi() makes the function pi() look like a variable).

% try the following command in matlab 

% >> which pi

% built-in (/home/DIRECTORY/engrsoft/MATLABROOT/toolbox/matlab/elmat/pi)

% >> edit pi

% Matlab will open a built-in pi.m script (a function file) so you can see 
% that pi actually is a built-in function. Built-in means mathworks probably
% encrypted it already so you won't see the source code. In this case you 
% only see comments in that pi() script. It is a function without input 
% arguments and the output argument is just pi.

% Here are several take away points:

% 1. a function that takes no input arguments can be called by using

% >> f
% 
% and
% 
% >> f()
% 
% Both f and f() give the same function value. In the case of pi(), 3.1416.
% 
% 2. an output argument of a function can have the same name as the function, 
% e.g. the pi(). (though it may not be a good idea I suppose.) The full 
% version of pi() should be
% 
% function pi = pi()
%       pi = value of PI;
% end
% 
% the dummyFunction2() defined below would produce pi; see the code below.
% 
% >> dummyFunction2
% 
% ans =
% 
%       3.1416
% 
% >> dummyFunction2()
% 
% ans =
% 
%       3.1416
% 
% 3. the way pi works is as follows, you call the function, by using pi or 
% pi(), then the function produces an output argument pi, which contains 
% the math constant 3.1415926... In the matlab workspace, you only see that
% double variable pi = 3.1415926... 

%% illustration code 

% a function without an input argument
% and an output argument with the same name as the function itself
function dummyFunction2 = dummyFunction2()
     dummyFunction2 = pi; % note that pi is a function. Hence dummyFunction2 is a nested function
end
