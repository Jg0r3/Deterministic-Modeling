% ============================= %
% ODE function to be integrated %
% ============================= %
function [ydot]=odefunction(t,y,p)

  ydot=zeros(size(y));
  ydot(1) = p(3)*p(2)*y.*(p(2)*t)^(p(3)-1)*(1-y/p(1));