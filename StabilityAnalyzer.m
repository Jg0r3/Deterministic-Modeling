% %Find stability of steady states symbolically
format longG
e = exp(1);

%%Derive single variable functions

syms x k b                         %defines symbol for function
f = x - k*x + b;                  %define function to derive

derivative = diff(f)             %takes 1st derivative (ex. 1)

ss = 1 - k;                 %take your derivative function and input steady state

if ss > 1
    disp("Steady State is unstable")
elseif ss < 1
    disp("Steady State is stable")
elseif ss == 1
    disp("Steady State is inconclusive")
end

%diff(f,2)                        %takes 2nd derivative (ex. 2)

%%Derive multiple variable functions
% syms x k b                         %define symbols for function
% 
% f = x - k*x + b;                    %define function to derive
% 
% diff(f)                        %derives the partial derivative ?f/?t
% clear all