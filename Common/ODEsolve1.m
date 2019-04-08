clear all
% This code shows how to use MATLAB's ode45 for solving the logistic ODE. 
%
% x' = k*x(1-x/N), x(0) = x_0.
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Specify time points where the solution is going to be estimated 
tint=2:0.5:25;
% Parameter values for ODE
N = 540;    % Carrying capacity
k = 0.75;   % Growth rate constant
% then define x_0:
x_0 = 14;
% and finally solve the ODE
[t,x]=ode45(@(t,x) logisticODE(t,x,k,N),tint,x_0);
%
% plot output:
figure(1), plot(t,x,'r*-')
legend('Logistic ODE model','Location','northwest')
xlabel('Days')
ylabel('Population density')

pause(2)

% Auxiliary part!

% the paramecium data: 
tp = [2:1:25]';
p = [14,34,56,94,189,266,330,416,507,580,610,513,593,557,560,522,565,517,500,585,500,495,525,510]';
% plot the output and compare with the Paramecium Aurelia data
figure(2), plot(tp,p,'o',t,x,'r--') 
legend('Paramecium Data','Logistic ODE model','Location','northwest')
xlabel('Days')
ylabel('Population density')
