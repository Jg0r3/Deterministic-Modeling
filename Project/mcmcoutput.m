% ======================================================================= %
% FUNCTION MCMCOUTPUT: This function reads in the chain values of         %    
%   betaboot (where each column is for a different parameter), the        %
%   parameter estimates (betahat), the names of the                       %
%   parameters (parnames), and the desired alpha-level for confidence     %
%   intervals on the parameters, and returns the mcmc mean, bias,         %
%   SE, and CI for each parameter, as well as a histogram of its          %
%   mcmc distribution.                                                    %
% ======================================================================= %

function mcmcout=mcmcoutput(betamcmc,betahat,parnames,alpha)

mcmcout.true = betahat;                        % True parameter estimates
mcmcout.mean = mean(betamcmc);                 % Mean of mcmc chain values
mcmcout.bias = mcmcout.mean-mcmcout.true;      % MCMC estimate of bias
mcmcout.se = std(betamcmc);                    % MCMC estimate of SE
p = length(betahat);                        % Number of parameters
B = length(betamcmc(:,1));                  % Number of mcmc chain simulations
nbins = max(10,round(B/50));                % Number of hisrogram bins
xdim = ceil(sqrt(p));                       % x-dimension of plotting window
ydim = ceil(p/xdim);                        % y-dimension of plotting window
for i = 1:p                                 % Begin histogram loop
  subplot(xdim,ydim,i);                     % Plot in ith spot of window
  hist(betamcmc(:,i),nbins);                % Histogram of bootstrap M-values
  xlim([min(betamcmc(:,i)), ...             % Sets x-axis limits to run from
        max(betamcmc(:,i))]);               %   min to max parameter value
  xlabel('MCMC Estimates', ...              % Puts x-label on plot in
         'fontweight','b');                 %   bold
  ylabel('Frequency','fontweight','b');     % Puts y-label on plot
  title(['MCMC ' char(parnames(i)) '-Estimates'], ...
        'fontweight','b');                  % Puts title on plot
end                                         % End of loop
sbeta = sort(betamcmc);                        % Sorts the mcmc estimates
mcmcout.cilow = sbeta(round(1+alpha*(B-1)/2),:);  % Computes the lower CI limit
mcmcout.ciupp = sbeta(round(B-alpha*(B-1)/2),:);  % Computes the upper CI limit

end