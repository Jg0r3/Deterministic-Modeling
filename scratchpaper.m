%%Derive single variable functions
syms k U V Mu Nv                           %defines symbol for function
u = k*U*(1-(U/Mu)-(V/Nv)) ;                    %define function to derive

diff(u, U)                          %takes 1st derivative (ex. 1)

%A(n+1) = u1*A(n) - u3*A(n)*B(n)
%B(n+1) = u3*B(n) - u4*A(n)*B(n)
syms x k b
%eqn = 1 == (b - k)/x ;
eqn = x == x-(k*x)+b
sol = solve(eqn,x)

% syms x(t)                        %define symbols for first order ODE
% 
% ode(t) == x(t+2) = 4*x(t+1)-3*x(t) %define function with '==', represent derivation with 'diff'         
% ySol(t) = solve(ode)
% 
% clear all   

% syms x y k b
% eqn = y == x - k*x +b;
% fimplicit(eqn)

clear all