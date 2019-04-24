% ======================================================================= %
% PLOT OF FITTED SOLUTION: solving ODE with fitted parmeters and 
% plotting the solution and the original data
% ======================================================================= %

% Vector of initial conditions and estimated parametrs:
y0 = pEstimates(1:numinit);
pars = pEstimates((numinit+1):length(pEstimates));

% Setup the ODE solver.
options=odeset('RelTol',1e-5,'AbsTol',1e-8,'stats','off');

times10 = [0,x(end,1)];              % Output time interval for fitted  
                                   % model solution 

% Choose the appropriate ODE function:
odemodel = @odefunction;   % (CHANGE)

% Choose the appropriate ODE solver:
solver = @ode23;

% Call the solver
[t1,yout1]=solver(odemodel,times10,y0,options,pars);

plot(t1,yout1,'k-',x,y,'rx');
xlabel('time')
ylabel('solution')
