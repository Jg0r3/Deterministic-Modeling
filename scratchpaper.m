%%Derive single variable functions
% syms x k b                           %defines symbol for function
% f =  x*log(x^2);                    %define function to derive
% 
% diff(f)                          %takes 1st derivative (ex. 1)

%diff(f,2)                       %takes 2nd derivative (ex. 2)

syms x(t)                        %define symbols for first order ODE

ode(t) == x(t+2) = 4*x(t+1)-3*x(t) %define function with '==', represent derivation with 'diff'         
ySol(t) = solve(ode)

clear all   