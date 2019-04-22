function[f]=system2ODE(t,x,params)
 f = [params(1)*x(1) + params(2)*x(2);
  params(3)*x(1) + params(4)*x(2)];