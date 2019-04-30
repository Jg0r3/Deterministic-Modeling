function[f]=system2ODE_yeast(t,x,params) %% ';' deliniated ODEs
 f = [params(1)*params(7)*x(1) - params(3)*x(1)*x(2) - params(6)*x(1);
     params(2)*x(3)*x(2) - params(6)*x(2);
     params(4)*params(1)*x(3)*x(1) - params(5)*params(2)*x(3)*x(2) - params(6)*x(3) + params(6)*params(7)];

%% dN1/dt = (k1*C_0*N1)-(g*n1*n2)-(f_v*N1)
%% dN2/dt = (k2*C*N2)-(f_v*N2)
%% dC/dt  = (-a1*k1*C*N1)-(a2*k2*C*N2)-(f_v*C)+(f_v*C_0)
% %
%% x(1) = N1, x(2) = N2, x(3) = C
%% params[k1 (1), k2 (2), g (3), a1 (4), a2 (5), f_v (6), C_0 (7)]
