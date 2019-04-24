% ======================================================================= %
% FUNCTION Jacob1: This function numerically estimates the Jacobian       %
% needed for the construction of the covariance for Gaussian proposal
% ======================================================================= %

function Fhat = Jacob1(ydat,xdat,startvals,numinit,time0)

solver=@ode45;                % Sets the ODE solver to use
odemodel=@odefunction;        % Sets the ODE function to fit  (CHANGE)
time0 = time0;                    % Set to 1 if data at time 0, 0 otherwise
                              %   (MAY NEED TO CHANGE)
                                 
% ============================================= %
% Here, the F-Hat (Jacobian) matrix is found numerically. %
% ============================================= %
n = length(xdat);                % Sample size
nump = length(startvals);        % Number of parameters
Fhat=zeros(n,nump);              % F-matrix initialization
dxmin=0.00001;                   % Numerical increment for computation of derivatives
y0=startvals(1:numinit);         % Starting value for u0
pars=startvals((numinit+1):nump);% Starting values for model parameters
times0 = xdat;                   % Sets times0 to xdat values
if (time0==0) times0=[0;times0]; % Appends time 0 to the times
end                              % End of if statement
nout=length(times0);             % Computes the number of times
alltimes = 1:nout;               % Vector of all times in data set
if (time0==0) alltimes=2:nout;   % Ignores time 1 if no 0-time in data
end                              % End of if statement
options=odeset('RelTol',1e-9,... % Sets stopping criteria for the ODE solver
  'AbsTol',1e-12,'stats','off');
[t,y]=solver(odemodel, ...       % Solves the logistic ODE using the parameters
  times0,y0,options,pars);       %   in p, and initial value y0
yhat=y;                          % y-hat values resulting from ODE solution 
for i=1:nump                     % Loop through parameters
  Axmin(i,:) = startvals;        % Repeat starting values in nump rows
  Axmin(i,i)=Axmin(i,i)+dxmin;   % Slight change to diagonal elements
  start_new=Axmin(i,:);          % New starting values w/one parameter incremented
  y0=start_new(1:numinit);       % Starting value for u0
  pars=start_new((numinit+1):nump);  % Parameter starting values
  [t,y]=solver(odemodel,...          % Solves the logistic ODE with one
     times0,y0,options,pars);        %   adjusted parameter in p
  y_new(:,i)=y(:);                   % New function values
  Fhat(:,i)=(y_new(alltimes,i)-...   % Computes derivatives to estimate Jacobian
    yhat(alltimes))/dxmin;           %   matrix
end
end

