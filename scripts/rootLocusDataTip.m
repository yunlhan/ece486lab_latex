% How matlab calculates the datatip for a pair of complex poles? (even they
% are the poles of a higher order system)
% Kenneth Hoffmann raised this question

%%

% 2016-11-15
% Y\"un Han
% ECE 486 Midterm 2 Review

%% preamble
clear % clear values of variables in workspace
clc % clear messages in the command window
clf % clear existing figures 
close all % close all existing windows; w/o 'all', only close the latest

%% generate a 5th order transfer function 
den = [1 0.5 0.3 2.5 4];
num = [1 2 4];

sys5thOL = tf(num,den);
% root locus plot for this open loop transfer function
figure(1)
rlocus(sys5thOL)
% if you click anywhere on the trajectory, say we choose the upper branch
% in the LHP, I got a datatip showing 
% pole = -1.11 + 1.69i
% zeta = .55
%   Mp = 12.6%
%   wn = 2.02
% now the question is, how these numbers are calculated? i.e, zeta, Mp, and
% wn. The answer is zeta, Mp and wn are paired with a 2nd order TF based on
% the pole location pole = -1.11 + 1.69i, the 5th order transfer function
% is not relevant in the calculation. 

%% verify the calculation of the datatip matlab showed us
% let's verify this by create a 2nd order TF based on the pole location
% above
p1 = -1.11 + 1.69*1i;
p2 = conj(p1);

% s = tf('s');
% sys2ndCL = p1*p2/(s - p1)/(s - p2)
sys2ndCL = tf(p1*p2,[1 -(p1+p2) p1*p2])
stepinfo(sys2ndCL,'settlingtimethreshold',0.05)
[wn2ndCL, zeta2ndCL, poles2ndCL] = damp(sys2ndCL) % display the wn, zeta 
% based on the TF we created, and verify whether these are the same as the
% above we recorded from the datatip (ln. 28 - 30).

% now from the above discussion, we reduced the case of poles of a higher
% order sytem to the case of poles of a 2nd order system. Hence we can
% apply the approx formulae on page 13 of our lab book. In term of the
% calculation, both wn and zeta are involved. So when it comes to the
% discussion, you probably want to say something about the tr, ts and Mp
% when you vary only one of them (meaning the other is fixed). If both are
% changing, it is hard to tell the trend of variation. This can be seen
% from the root locus of the 5th order system above. When you drag the
% point along the trajectory, going to the left may NOT necessarily give you higher
% damping because the radius wn is changing at the same time. Similarly, we
% cannot for sure say anything about tr and ts. 

