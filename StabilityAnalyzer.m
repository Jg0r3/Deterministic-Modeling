% %Find stability of steady states symbolically
format longG
e = exp(1);
%%%

syms x k b                        %defines symbol for function
f = x - k*x + b                         %define function to derive

derivative = diff(f,x)             %takes 1st derivative (ex. 1)

ss = subs(derivative, x, 1)       

%subs(f, x, 3)

if ss > 1
    disp("Steady State is unstable")
elseif ss < 1
    disp("Steady State is stable")
elseif ss == 1
    disp("Steady State is inconclusive")
end

clear all
%diff(f,2)                        %takes 2nd derivative (ex. 2)

%%Derive multiple variable functions
% syms x k b                         %define symbols for function
% 
% f = x - k*x + b;                    %define function to derive
% 
% diff(f)                        %derives the partial derivative ?f/?t
% clear all