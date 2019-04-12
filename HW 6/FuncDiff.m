% %function derivative finder/solver

% syms x    %derive singular variable functions
% f = sin(5*x);
% 
% diff(f)   %takes 1st derivative
% 
% diff(f,2) %takes 2nd derivative
% 
% 
% syms s t  %derive multiple variable functions
% f = sin(s*t);
% 
% diff(f,t) %derives the partial derivative ?f/?t


%%%

% %Solve First-Order Linear ODE

          %example: dy/dt = ty
          %first, represent y by using 'syms' to create the symbolic function y(t)
% syms y(t)
% 
% 
% %define the equation using '==' and represent differentiation using the diff function
% ode(t) = diff(y(t), t) == t*y(t)         
% ySol(t) = dsolve(ode)%Solve the equation using 'dsolve'
% 
% % % Solve First order Linear ODE with condition (from above)
% cond = y(0) == 2;
% ySol(t) = dsolve(ode,cond)

