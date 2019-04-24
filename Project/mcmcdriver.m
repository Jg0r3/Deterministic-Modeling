% ========================================================== %
% This template is for fitting data to an (ODE) model with a %
% set of unknown parameter values defined by a system of     %
% differential equations, and using MCMC to                  %
% characterize the uncertainty in the estimates.             %
% ========================================================== %
clear;
load sheep.mat;                           % Loads the bighorn data

% =============================================================== %
%% 
% Set up the data and set the starting values and parameter names %
% =============================================================== %
x = sheep.year(sheep.year<=1982)-1964;    % Take only years before 1983
y = sheep.count(sheep.year<=1982);        % Take only cases before 1983
parnames = {'u0';'M';'k';'gam'};          % Parameter names
startvals = [27 221 0.33 1];              % Parameter starting values
                                          % (initial conditions first)
numinit = 1;                              % Number of initial conditions
runningPlot = 1;                          % Show running plots: 0 or 1
                                          %             for    NO or  YES
alpha = 0.05;                        %  alpha for computing confidence
%                                     intervals and prediction bands
% Number of simulations in the MCMC chain:
nsimu = 5000;
% 
time0 = 0; % Set to 1 if data at time 0, 0 otherwise
                                 % (MAY NEED TO CHANGE)
% ================================================================ %
% Fits the ODE to the data using the simplex method with objective %
% function "modeloptimize" (usually least squares), starting values %
% "startvals" and data in "y,x" to fit the data to the model       %
% ================================================================ %
opts = optimset('Display','iter');        % Sets fminsearch options
[pEstimates,rss] = fminsearch(@(par) ...  % Computes model parameter
  modeloptimize(par,y,x,runningPlot,...   %   estimates using startvals
    numinit,time0),startvals,opts);             %   as starting values

% get the estimate for sigma2:
nobs = length(x);                    %  number of observations
npar=length(pEstimates);             %  number of parameters
sigma2 = rss/(nobs-npar);            %  variance of meas.error

%% =============================================================== %
% Plotting the fitted model solution and the data:
figure(10)
modelplot
%%

%the 'initial guess' for the proposal:

% "Simple choice"
%qcov   = 1e-4*eye(npar);              %  covariance for Gaussian proposal

% ... but when one (or more) run has been done, comment the above and try
% to find a better covariance for a Gaussian proposal

% Better choice
% Numerical estimation of the Jacobian matrix:
J=Jacob1(y,x,pEstimates,numinit,time0);      
qcov   = 2.4^2/npar*sigma2*inv(J'*J);  %  covariance for Gaussian proposal

% Change of notation for optimal parameter values (for convenience):
par0=pEstimates;


%%%%%%%%%%%%%%%MCMC sampling starts here %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
R      = chol(qcov);
oldpar = par0;
ss     = modelss(oldpar,x,y,numinit,time0); % first SS value
rej        = 0;                     % initialized count for rejections

chain(1,:) = oldpar;
for i=2:nsimu % simulation loop
   newpar = oldpar+randn(1,npar)*R;     % new candidate
   ss2    = ss;                         % old SS
   ss1    = modelss(newpar,x,y,numinit,time0);  % new SS
   if (ss1<ss2 | rand < exp(-0.5*(ss1-ss2)/sigma2))
     chain(i,:) = newpar;              % accept
     oldpar     = newpar;
     ss         = ss1;   
   else   
     chain(i,:) = oldpar;              % reject
     rej        = rej+1;  
   end
end

accept = 1-rej./nsimu                  % acceptance rate


%%%%%%%%%%%MCMC sampling done %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%
%%%%some plots: 

figure(20)

% MCMC chains:
txt1=string(parnames);
for i=1:npar
subplot(npar,1,i);plot(1:nsimu,chain(:,i)); title(['CHAIN for '+txt1(i)]);
end

% Plot parameter values in the MCMC chain for parameter pairs:
plotpairs

figure(40)
out = mcmcoutput(chain,pEstimates, ... % Function to produce standard
      parnames,alpha)                      % mcmc output

% Plot of model prediction with the (1-alpha)*100% confidence band:
ymcmc=modelpred(chain,x,numinit,npar,nsimu,time0,alpha);

%%

figure(50)
hold on
[m1,m2]=size(ymcmc);
if (time0==1)
for i=1:m2
plot([x],ymcmc(:,i),'y-','LineWidth',2)
end
else 
for i=1:m2
plot([0;x],ymcmc(:,i),'y-','LineWidth',2)
end
end
modelplot
txt2=num2str(100*(1-alpha));
title(['Fitted solution, data, ',txt2,'% prediction band']) 
hold off
%% 