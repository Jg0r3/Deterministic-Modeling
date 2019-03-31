% Problem 1.4.2
% Plot the solution of the continuous model
I0 = 1;                 % initial condition [1 unique cell]
delta_t = input(' time interval in 10 minute intervals, delta_t = '); %?t is 1/10 minute
t  = [0:delta_t:15];
nt = length(t);
alpha = 1; % rate parameter
I_cont = I0*exp(alpha*t)   % continuous solution
%I(t+del_T) = I(t)exp(alpha*t)


% Here, write a short piece of MATLAB code that compute the difference
% equation solution I_disc. You will need to use a for loop.

I_disc = zeros(size(t));
I_disc(1) = I0;
delta_P = 2;
for i = 2:length(I_disc)
    I_disc = I0 + delta_P*I_disc(i-1)
    %p_model(i) = p_model(i-1)+k*(N-p_model(i-1))*p_model(i-1);
end

I_disc

N = 5;                  % specify N
powerof2(1) = 1;        %initialization (zero power)
for i = 1:N             % same as for i = 1:1:N
powerof2(i+1) = 2^i; 	%statement
end                     %end of "for" loop 
powerof2'

delta_P = 2;

%I_disc = I0 + 

%I(t+del_T) = I(t) + 
% Finally, create the plot
figure(1)
  plot(t,I_cont)
  %plot(t,I_cont,t,I_disc,'o') % use this once you have I_disc