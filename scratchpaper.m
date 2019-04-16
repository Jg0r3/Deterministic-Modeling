
% syms f x g b
% 
% f(x) = 2*x - b + x
% 
% g(x) = f(x) - x
% 
% v = fzero(g(x),1)

%A(n+1) = u1*A(n) - u3*A(n)*B(n)
%B(n+1) = u3*B(n) - u4*A(n)*B(n)
syms x k b
%eqn = 1 == (b - k)/x ;
eqn = x == x-(k*x)+b
sol = solve(eqn,x)

f = x-(k*x)+b
fplot(x)
% syms x y u1 u2 u3 u4
% cond1 = x^2 + y^2 + x*y < 1;
% cond2 = x > 0;
% cond3 = y > 0;
% conds = [cond1 cond2 cond3];
% 
% sol = solve(conds, [x y], 'ReturnConditions', true);

% sol.x
% sol.y
% sol.parameters
% sol.conditions

clear all