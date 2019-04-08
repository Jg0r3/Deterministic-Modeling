function dydt=logistic1(t,y,coef1,coef2)
% Right hand side of the logistic equation y' = c1*y*(1-y/c2)
dydt=coef1*y*(1-y/coef2); 