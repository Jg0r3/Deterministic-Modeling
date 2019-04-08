% Problem 1.4.2
% Plot the solution of the continuous model
I0      = 10;                 % initial condition
dt      = input(' time interval in days, delta_t = '); 
t       = [0:dt:15];
nt      = length(t);
alpha   = 0.3; % rate parameter
I_cont = I0*exp(-alpha*t);   % continuous solution

% Here, write a short piece of MATLAB code that compute the difference
% equation solution I_disc. You will need to use a for loop.

% Finally, create the plot
figure(1)
  plot(t,I_cont)
  % plot(t,I_cont,t,I_disc,'o') % use this once you have I_disc