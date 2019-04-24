% ======================================================================= %
% FUNCTION MODELPRED: This function uses an ODE solver to produce 
% solutions of the ODE model for mcmc chain parameter values and 
% outputs the mutrix of sorted and appropriately truncated solution
% values ( (1-alpha)*100% confidence) at each of the output time 
% points: ymcmc rows correspond to output times; columns correspond to
% solution values lying within (1-alpha)*100% confidence interval
%=========================================================================%                                                            

% Setup the ODE solver.  %
% ======================================================================= %

function ymcmc =modelpred(parchain,xdat,numinit,npar,nsimu,time0,alpha)

% Vector of initial conditions
y00 = parchain(:,1:numinit);
pars00 = parchain(:,(numinit+1):npar);
%

options=odeset('RelTol',1e-5,'AbsTol',1e-8,'stats','off');

if (time0==1)
    times0=xdat;
else
times0=[0;xdat];   % Appends time 0 to the times
end

% Choose the appropriate ODE function:
odemodel = @odefunction;   % (CHANGE)

% Choose the appropriate ODE solver:
solver = @ode23;

youtmcmc=zeros(length(times0),nsimu);

% Call the solver various parameter sets from mcmc chain:
for i=1:nsimu
    y01=y00(i);pars1=pars00(i,:);
[t,yout]=solver(odemodel,times0,y01,options,pars1);
youtmcmc(:,i)=yout;
end

% Truncation of the solutions for each output time point:
% the solution values lie within (1-alpha)*100% confidence
% interval estimated for mcmc chain parameter values

ymcmc0=sort(youtmcmc');
ymcmc1=ymcmc0(round(1+alpha*(nsimu-1)/2):round(nsimu-alpha*(nsimu-1)/2),:);
ymcmc=ymcmc1';
end




