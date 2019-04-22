% % % Function Differentiation Finder/Solver

% % Function Deriver

%%Derive single variable functions
% syms x                           %defines symbol for function
% f = sin(5*x);                    %define function to derive
% 
% diff(f)                          %takes 1st derivative (ex. 1)
% 
% diff(f,2)                        %takes 2nd derivative (ex. 2)

%%%Derive multiple variable functions
syms r x k h                        %define symbols for function
% h = a*(x-b)
X = r*x*(1-(x/k))-h;                    %define function to derive

diff(X)                        %derives the partial derivative ?f/?t

%%%

% Solve First-Order Linear ODE
%example: ?y/?t = ty
%first, represent y by using 'syms' to create the symbolic function y(t)

syms x(t) r k h                        %define symbols for first order ODE

ode(t) = diff(x(t), t) == r*x*(1-(x/k))-h %define function with '==', represent derivation with 'diff'         
xSol(t) = dsolve(ode)            %Solve the equation using 'dsolve'
% 
% % % Solve First order Linear ODE with condition (from above)
% cond = y(0) == 2;                %define condition
% ySol(t) = dsolve(ode,cond)       %solve with condition

clear all


