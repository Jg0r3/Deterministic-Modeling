%%difficulty defining the 'partial dataset' to find a 'reasonable' t*
%%try running the scatter plot and compare different regressions
%%red dots are points that have used in the regression
%%blue dots are points that are being excluded in the regression

%%%%%%%%
% Sensitive- Run
% Vessel 1 Vessel Volumes/Hr
S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% Vessel 1 Optical Density at the steady state %% Bacterial population
S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';

%define na/nb
S_vvh_1_na = S_vvh_1(1:8);
S_vvh_1_nb = S_vvh_1(9);

disp("using fitlm function: ")
mdl_1 = fitlm(S_vvh_1_na,S_OD_1(1:8))
mdl_1_coef = mdl_1.Coefficients.Estimate  % the coefficients


%%plot and define linreg for K_vvh_1_na
figure(1)
scatter(S_vvh_1_na,S_OD_1(1:8),'r','o')
title('1 datapoint excluded from regression')
xlim([0 .45]);
ylim([0 1]);
hold on
P = polyfit(S_vvh_1_na,S_OD_1(1:8),1);
yfit = P(1)*S_vvh_1_na+P(2);
xfit = 0; %flat line for last residuals
plot(S_vvh_1_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(S_vvh_1(8:9),S_OD_1(8:9),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P(1);
b = P(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('S_vvh_1: ')
y_intercept = [P(2), 0] 
x_intercept = [0, maybe_t_star(1)]
slope = P(1)

%adds lingreg line to figure(1)
scatter(x_intercept, y_intercept, 'g', '*')
hold off

%find residuals of linreg(na)
res_S_vvh_1_na = S_vvh_1_na - yfit
res_S_vvh_1_nb = S_vvh_1_nb - xfit

% SSres_S_vvh_1_na = sum(res_S_vvh_1_na.^2)
% SStotal_S_vvh_1_na = (length(S_vvh_1_na)-1) * var(S_vvh_1_na)
% rsq = 1 - (SSres_S_vvh_1_na/SStotal_S_vvh_1_na)

%yresid = y - yfit; ^^^ above
%Square the residuals and total them to obtain the residual sum of squares:

%SSresid = sum(yresid.^2);
%Compute the total sum of squares of y by multiplying the variance of y by the number of observations minus 1:

%SStotal = (length(y)-1) * var(y);
%Compute R2 using the formula given in the introduction of this topic:

%rsq = 1 - SSresid/SStotal

%rsq =
    %0.8707


clear all

% %%%%%%%%
% % Sensitive- Run
% % Vessel 1 Vessel Volumes/Hr
% S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% % Vessel 1 Optical Density at the steady state %% Bacterial population
% S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';
% 
% %define na/nb
% S_vvh_1_na = S_vvh_1(1:7);
% S_vvh_1_nb = S_vvh_1(8:9);
% 
% %%plot and define linreg for K_vvh_1_na
% figure(2)
% scatter(S_vvh_1_na,S_OD_1(1:7),'r','o')
% title('2 datapoints excluded from regression')
% xlim([0 .45]);
% ylim([0 1]);
% hold on
% P = polyfit(S_vvh_1_na,S_OD_1(1:7),1);
% yfit = P(1)*S_vvh_1_na+P(2);
% xfit = 0; %flat line for last residuals
% plot(S_vvh_1_na,yfit,'r');
% hold on
% %completes scatter-plot with ALL data points for visuals
% scatter(S_vvh_1(7:9),S_OD_1(7:9),'b', 'o')
% hold on
% 
% %creates environment to solve for t*
% syms x a b
% a = P(1);
% b = P(2);
% f = (a*x) + b == 0;
% 
% %solves for x-intercept
% maybe_t_star = vpasolve(f);
% 
% disp('S_vvh_1: ')
% y_intercept = [P(2), 0] 
% x_intercept = [0, maybe_t_star(1)]
% slope = P(1)
% 
% %adds lingreg line to figure(1)
% scatter(x_intercept, y_intercept, 'g', '*')
% hold off
% 
% %find residuals of linreg(na)
% residuals_S_vvh_1_na = S_vvh_1_na - yfit
% residuals_S_vvh_1_nb = S_vvh_1_nb - xfit
% clear all
% 
% %%%%%%%%
% % Sensitive- Run
% % Vessel 1 Vessel Volumes/Hr
% S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% % Vessel 1 Optical Density at the steady state %% Bacterial population
% S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';
% 
% %define na/nb
% S_vvh_1_na = S_vvh_1(1:6);
% S_vvh_1_nb = S_vvh_1(7:9);
% 
% %%plot and define linreg for K_vvh_1_na
% figure(3)
% scatter(S_vvh_1_na,S_OD_1(1:6),'r','o')
% title('3 datapoints excluded from regression')
% xlim([0 .45]);
% ylim([0 1]);
% hold on
% P = polyfit(S_vvh_1_na,S_OD_1(1:6),1);
% yfit = P(1)*S_vvh_1_na+P(2);
% xfit = 0; %flat line for last residuals
% plot(S_vvh_1_na,yfit,'r');
% hold on
% %completes scatter-plot with ALL data points for visuals
% scatter(S_vvh_1(6:9),S_OD_1(6:9),'b', 'o')
% hold on
% 
% %creates environment to solve for t*
% syms x a b
% a = P(1);
% b = P(2);
% f = (a*x) + b == 0;
% 
% %solves for x-intercept
% maybe_t_star = vpasolve(f);
% 
% disp('S_vvh_1: ')
% y_intercept = [P(2), 0] 
% x_intercept = [0, maybe_t_star(1)]
% slope = P(1)
% 
% %adds lingreg line to figure(1)
% scatter(x_intercept, y_intercept, 'g', '*')
% hold off
% 
% %find residuals of linreg(na)
% residuals_S_vvh_1_na = S_vvh_1_na - yfit
% residuals_S_vvh_1_nb = S_vvh_1_nb - xfit

clear all
