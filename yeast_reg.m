%%%%linear regression on 'n' and N populations of yeast
format longG

%initial concentration
C_0 = 0.02;

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
P_1 = polyfit(K_vvh_1_na,K_OD_1(1:6),1);
yfit = P_1(1)*K_vvh_1_na+P_1(2);
xfit = 0; %flat line for last residuals
plot(K_vvh_1_na,yfit,'r')
hold on
%completes scatter-plot with ALL data points for visuals
scatter(K_vvh_1(7:8),K_OD_1(7:8),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P_1(1);
b = P_1(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('K_vvh_1: ')
y_int_k1 = [P_1(2), 0] 
x_int_k1 = [0, maybe_t_star(1)]
slope_k1 = P_1(1)

%adds lingreg line to figure(1)
scatter(x_int_k1, y_int_k1, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_K_vvh_1_na = K_vvh_1_na - yfit;
residuals_K_vvh_1_nb = K_vvh_1_nb - xfit;

%clear all

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
P_2 = polyfit(K_vvh_2_na,K_OD_2(1:7),1);
yfit = P_2(1)*K_vvh_2_na+P_2(2);
xfit = 0; %flat line for last residuals
plot(K_vvh_2_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(K_vvh_2(8:9),K_OD_2(8:9),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P_2(1);
b = P_2(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('K_vvh_2: ')
y_int_k2 = [P_2(2), 0] 
x_int_k2 = [0, maybe_t_star(1)]
slope_k2 = P_2(1)

%adds lingreg line to figure(1)
scatter(x_int_k2, y_int_k2, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_K_vvh_2_na = K_vvh_2_na - yfit;
residuals_K_vvh_2_nb = K_vvh_2_nb - xfit;

%clear all

%%%%%%%%
% Sensitive- Run
% Vessel 1 Vessel Volumes/Hr
S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% Vessel 1 Optical Density at the steady state %% Bacterial population
S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';

%define na/nb
S_vvh_1_na = S_vvh_1(1:8);
S_vvh_1_nb = S_vvh_1(9);

%%plot and define linreg for K_vvh_1_na
figure(3)
scatter(S_vvh_1_na,S_OD_1(1:8),'b','o')
xlim([0 .45]);
ylim([0 1]);
hold on
P_3 = polyfit(S_vvh_1_na,S_OD_1(1:8),1);
yfit = P_3(1)*S_vvh_1_na+P_3(2);
xfit = 0; %flat line for last residuals
plot(S_vvh_1_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(S_vvh_1(9),S_OD_1(9),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P_3(1);
b = P_3(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('S_vvh_1: ')
y_int_s1 = [P_3(2), 0] 
x_int_s1 = [0, maybe_t_star(1)]
slope_s1 = P_3(1)

%adds lingreg line to figure(1)
scatter(x_int_s1, y_int_s1, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_S_vvh_1_na = S_vvh_1_na - yfit;
residuals_S_vvh_1_nb = S_vvh_1_nb - xfit;

%clear all

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
P_4 = polyfit(S_vvh_2_na,S_OD_2(1:5),1);
yfit = P_4(1)*S_vvh_2_na+P_4(2);
xfit = 0; %flat line for last residuals
plot(S_vvh_2_na,yfit,'r');
hold on
%completes scatter-plot with ALL data points for visuals
scatter(S_vvh_2(6),S_OD_2(6),'b', 'o')
hold on

%creates environment to solve for t*
syms x a b
a = P_4(1);
b = P_4(2);
f = (a*x) + b == 0;

%solves for x-intercept
maybe_t_star = vpasolve(f);

disp('S_vvh_2: ')
y_int_s2 = [P_4(2), 0] 
x_int_s2 = [0, maybe_t_star(1)]
slope_s2 = P_4(1)

%adds lingreg line to figure(1)
scatter(x_int_s2, y_int_s2, 'g', '*')
hold off

%find residuals of linreg(na)
residuals_S_vvh_2_na = S_vvh_2_na - yfit;
residuals_S_vvh_2_nb = S_vvh_2_nb - xfit;


%%% ranking linear regressions with the smallest

% mdl_1 = fitlm(X,y)

%%nope

%%%solving for various alpha (C_0/y_int) and k (y_int/(C_0*Slope)
disp("various forms of alpha and k")
alpha_k_1 = C_0/y_int_k1(1)
alpha_k_2 = C_0/y_int_k2(1)
alpha_s_1 = C_0/y_int_s1(1)
alpha_s_2 = C_0/y_int_s2(1)
% 
k_k_1 = y_int_k1(1)/(C_0*slope_k1)
k_k_2 = y_int_k2(1)/(C_0*slope_k2)
k_s_1 = y_int_s1(1)/(C_0*slope_s1)
k_s_2 = y_int_s2(1)/(C_0*slope_s2)

%%%defining linear regression in terms of optimal alpha and k



clear all
