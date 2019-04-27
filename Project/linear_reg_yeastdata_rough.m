%%%%linear regression on 'n' and N populations of yeast
format longG

% Sensitive- Run
% Vessel 1 Vessel Volumes/Hr
K_vvh_1 = [0.028 0.099 0.142 0.207 0.269 0.287 0.352 0.403]';
% na cut off @ 0.287, nb 0.352 -> 0.403
% Vessel 1 Optical Density at the steady state
K_OD_1 = [0.144 0.151 0.099 0.069 0.045 0.02 0.003 0]';

%define na/nb
K_vvh_1_na = K_vvh_1(1:6);
K_vvh_1_nb = K_vvh_1(7:8);

%%plot and define linreg for K_vvh_1_na
figure(1)
scatter(K_vvh_1(1:6),K_OD_1(1:6),'b','o') %scatterplot of population 'A'
xlim([0 .45]); %limits for x-axis
ylim([0 .20]); %limits for y-axis
hold on
%linear regression, P(1) = a, P(2) = b
P = polyfit(K_vvh_1_na,K_OD_1(1:6),1);
yfit = P(1)*K_vvh_1_na+P(2);
xfit = 0; %flat line for last residuals
plot(K_vvh_1_na,yfit,'r')
hold on
%completes scatter-plot with ALL data points for visuals
scatter(K_vvh_1(7:8),K_OD_1(7:8),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P(1);
b = P(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('K_vvh_1: ')
y_intercept = [P(2), 0] 
x_intercept = [0, maybe_t_star(1)]
slope = P(1)

%adds lingreg line to figure(1)
scatter(x_intercept, y_intercept, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_K_vvh_1_na = K_vvh_1_na - yfit
residuals_K_vvh_1_nb = K_vvh_1_nb - xfit

clear all

% %
% Vessel 2 Vessel Volumes/Hr
K_vvh_2 = [0.054 0.11 0.141 0.199 0.257 0.296 0.348 0.397 0.41]';
% Vessel 2 Optical Density at the steady state
K_OD_2 = [0.164 0.151 0.11 0.092 0.072 0.023 0.006 0.002 0.004]';
%pop 'a' (1:7), pop 'b' (8:9)

%define na/nb
K_vvh_2_na = K_vvh_2(1:7);
K_vvh_2_nb = K_vvh_2(8:9);

%%plot and define linreg for K_vvh_1_na
figure(2)
scatter(K_vvh_2_na,K_OD_2(1:7),'b','o')
xlim([0 .45]);
ylim([0 .3]);
hold on
P = polyfit(K_vvh_2_na,K_OD_2(1:7),1);
yfit = P(1)*K_vvh_2_na+P(2);
xfit = 0; %flat line for last residuals
plot(K_vvh_2_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(K_vvh_2(8:9),K_OD_2(8:9),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P(1);
b = P(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('K_vvh_2: ')
y_intercept = [P(2), 0] 
x_intercept = [0, maybe_t_star(1)]
slope = P(1)

%adds lingreg line to figure(1)
scatter(x_intercept, y_intercept, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_K_vvh_2_na = K_vvh_2_na - yfit
residuals_K_vvh_2_nb = K_vvh_2_nb - xfit

clear all

%%%%%%%%
% Sensitive- Run
% Vessel 1 Vessel Volumes/Hr
S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% Vessel 1 Optical Density at the steady state %% Bacterial population
S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';

%define na/nb
S_vvh_1_na = S_vvh_1(1:6);
S_vvh_1_nb = S_vvh_1(7:9);

%%plot and define linreg for K_vvh_1_na
figure(3)
scatter(S_vvh_1_na,S_OD_1(1:6),'b','o')
xlim([0 .45]);
ylim([0 1]);
hold on
P = polyfit(S_vvh_1_na,S_OD_1(1:6),1);
yfit = P(1)*S_vvh_1_na+P(2);
xfit = 0; %flat line for last residuals
plot(S_vvh_1_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(S_vvh_1(7:9),S_OD_1(7:9),'b', 'o')
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
residuals_S_vvh_1_na = S_vvh_1_na - yfit
residuals_S_vvh_1_nb = S_vvh_1_nb - xfit
clear all

% %
% Vessel 2 Vessel Volumes/Hr
S_vvh_2 = [0.0571 0.126 0.196 0.263 0.313 0.383]';
% Vessel 2 Optical Density at the steady state
S_OD_2 = [0.385 0.456 0.363 0.197 0.044 0.004]';

%define na/nb
S_vvh_2_na = S_vvh_2(1:5);
S_vvh_2_nb = S_vvh_2(6);

%%plot and define linreg for K_vvh_1_na
figure(4)
scatter(S_vvh_2_na,S_OD_2(1:5),'b','o')
xlim([0 .6]);
ylim([0 .6]);
hold on
P = polyfit(S_vvh_2_na,S_OD_2(1:5),1);
yfit = P(1)*S_vvh_2_na+P(2);
xfit = 0; %flat line for last residuals
plot(S_vvh_2_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(S_vvh_2(6),S_OD_2(6),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P(1);
b = P(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('S_vvh_2: ')
y_intercept = [P(2), 0] 
x_intercept = [0, maybe_t_star(1)]
slope = P(1)

%adds lingreg line to figure(1)
scatter(x_intercept, y_intercept, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_S_vvh_2_na = S_vvh_2_na - yfit
residuals_S_vvh_2_nb = S_vvh_2_nb - xfit

clear all