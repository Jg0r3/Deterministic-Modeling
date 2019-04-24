% ======================================================================= %
% FUNCTION MODELOPTIMIZE: This function calls an ODE solver to fit a       %
%   specific ODE function "odemodel" to a set of data given by (ydat,     %
%   xdat).                                                                %
% ======================================================================= %

function [sse]=modeloptimize(parameters,ydat,xdat,runningPlot,numinit,time0)

time0 = time0;                       % Set to 1 if data at time 0, 0 otherwise
                                 % (MAY NEED TO CHANGE)
% Vector of initial conditions
y0 = parameters(1:numinit);
pars = parameters((numinit+1):length(parameters));

% Setup the ODE solver.
options=odeset('RelTol',1e-5,'AbsTol',1e-8,'stats','off');

times0 = xdat;                     % Set times0 to xdat values
if (time0==0) times0=[0;times0];   % Appends time 0 to the times
end                                % End of if statement
nout=length(times0);               % New length of times
alltimes = 1:nout;                 % Vector of all times in data set
if (time0==0) alltimes=2:nout;     % Ignores time 1 if no 0-time in data
end                                % End of if statement

% Choose the appropriate ODE function:
odemodel = @odefunction;   % (CHANGE)

% Choose the appropriate ODE solver:
solver = @ode23;

% Call the solver
[t,yout]=solver(odemodel,times0,y0,options,pars);

% Sum of squared errors minimized.
sse = sum((ydat - yout(alltimes)).^2);

% View the output? 
if runningPlot==1
    figure(1);
    plot(t(alltimes),yout(alltimes),'k-',t(alltimes),ydat,'rx');
    drawnow;
end
