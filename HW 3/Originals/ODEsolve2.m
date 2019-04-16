clear all
% In this m-file, we simulate the system of differential equations:
%
%  X1' = a_11 * X1 + a_12 * X2
%  X2' = a_21 * X1 + a_22 * X2
%
% Parameters: 
params = input(' Enter [a_11, a_12, a_21, a_22] within square brackets: ');
% time interval of integration:
time1=[0,10];
% initial conditions:
x_0 = [1,1];
% Solve system of ODEs
[t,x]=ode45(@(t,x) system2ODE(t,x,params),time1,x_0);
% plot the results:
figure(1), plot(t,x,'*-')
legend('y1','y2','Location','northeast')
xlabel('Time')
ylabel('Solutions')
title('Linear system of 2 ODEs')
