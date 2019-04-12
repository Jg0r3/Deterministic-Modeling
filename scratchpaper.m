
% ?u/?t = u-0.01*2u-0.02*uv --> u-0.01*2*u-0.02*u*v
% ?v/?t = 2u-0.02*2v-0.04*uv --> 2*u-0.02*2*v-0.04*u*v

syms u(t) v(t)

%define the equation using '==' and represent differentiation using the diff function

ode(t) = diff(u(t), t) == u-0.01*2*u-0.02*u*v

cond = [u(0) == 20,v(0) == 10];
          
ySol(t) = dsolve(ode,cond)%Solve the equation using 'dsolve'

clear all