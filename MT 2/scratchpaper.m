%%% MT 2
format longG
% % Problem 1

% syms x k h r
% 
% f = r*x*(1-(x/k))-h;
% 
% diff(f);
% 
% q = (x^2) - (k*x) + ((h*k)/r);
% 
% qdiff = diff(q);
% fdiff = diff(f);
% qdiff;
% fdiff;

%Assign 2 to x. The value of y is still x^2 instead of 4.
%Evaluate y with the new value of x by using subs.
% x = 0;
% subs(qdiff)

syms r x k h a b
% partial deriv f'(x) f'(h) g'(x) g'(h) if h<0

f = (r*x)*(1-(x/k))-h;
g = a*(x-b);

diffFx = diff(f,x)
diffFy = diff(f,h)
diffGx = diff(g,x)
diffGy = diff(g,h)

% syms r x k h a b
% % Steady State 1: (0,0) @ h<0 == -h
% 
% f = (r*0)*(1-(0/k))-h;
% g = a*(0-b);
% 
% diffFx = diff(f,x)
% diffFy = diff(f,h)
% diffGx = diff(g,x)
% diffGy = diff(g,h)

% syms r x k h a b
% % Steady State 2: (k,0) @ h<0 == -h
% 
% f = (r*k)*(1-(k/k))-h;
% g = a*(k-b);
% 
% diffFx = diff(f,x)
% diffFy = diff(f,h)
% diffGx = diff(g,x)
% diffGy = diff(g,h)


clear all