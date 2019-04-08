%Fitting logistic growth model y' = k*y*(1-y/M), y(0)=y0
% to noisy data. Parameters to fit: k, M, y0 
%
load data1.mat; %loading the "experimental data": t_i and y_i=y(t_i)
tdat1=data1(:,1); ydat1=data1(:,2); 
%
%Plot experimental data:
figure(100)
plot(tdat1,ydat1,'r*','LineWidth',2)
axis([0 5 -0.0 1.1])
title('Noisy data')
ylabel('Population density')
xlabel('Time')
%
disp('Press any key to continue!')
pause 
%
coef0=[2;3;0.2]; %initial guess of model parameters' values: k, M, y0. 
%
[coefmin1] = nlinfit(tdat1,ydat1,@myfun1,coef0)
%
coef1hat=coefmin1(1);   %   estimated k
coef2hat=coefmin1(2);   %   estimated M
y0min=coefmin1(3);      %   estimated y(0) 
%
%Compute and plot model solution for fitted parameters' values:
tplot=0:0.01:tdat1(end,1); 
[tplot,yfit]=ode23(@logistic1,tplot,y0min,[],coef1hat,coef2hat);
figure(101)
plot(tdat1,ydat1,'r*','LineWidth',2)
hold on
plot(tplot,yfit,'b-','LineWidth',2)
hold off
axis([0 5 -0.0 1.1])
title('Model fit')
ylabel('Population density')
xlabel('Time')



