% Paramecium aurelia data
t = [2:1:25]';
p = [14,34,56,94,189,266,330,416,507,580,610,513,593,557,560,522,565,517,500,585,500,495,525,510]';
delta_p = diff(p);
figure(1)
  plot(t,p,'o')
  title('Plot of data in Table 2.1, page 11 of text')
  xlabel('time in days')
  ylabel('mean density of P. Aurelia')
N = 540; % approximate carrying capacity looking at the graph.

% Find the slope of the best fit line through the origin of the points
% (delta_p,p*(N-p)).
% First remove the last element of p, since delta_p and p have different
% lengths, as in the book.
p2   = p(1:end-1);
x    = p2.*(N-p2);
y    = delta_p;
k    = (x'*y)/(x'*x);
figure(2)
  plot(x,y,'.',x,k*x,'-')
  xlabel('p*(540-p)')
  ylabel('p_{i+1}-p_i')
  title('Data and model fit')

% Next generate output from the model with p0=p(1).
p_model = zeros(size(p));
p_model(1) = p(1);
for i = 2:length(p_model)
    p_model(i) = p_model(i-1)+k*(N-p_model(i-1))*p_model(i-1);
end

% Plot results of the book model fit:
figure(3)
   plot(t,p,'o',t,p_model,'*')
   xlabel('time in days')
   ylabel('mean density of P. Aurelia')
   legend('data','book fit','Location','NorthWest')

% Nonlinear fitting for k and N: first, we need to define the function to 
% be minimized with respect to k and N (here k = alpha(1), N = alpha(2))
[alpha_opt,f] = fminsearch(@(alpha) nonlin_ls(alpha,p),[k,N]);
% If needed, can add various options: see description in HELP!

% Next generate output from this model fit with p0=p(1).
p_model2 = zeros(size(p));
p_model2(1) = p(1);
for i = 2:length(p_model)
    p_model2(i) = p_model2(i-1)+alpha_opt(1)*(alpha_opt(2)-p_model2(i-1))*p_model2(i-1);
end

% Plot the results of the nonlinear model fit:
figure(4)
   plot(t,p,'o',t,p_model2,'gs')
   xlabel('time in days')
   ylabel('mean density of P. Aurelia')
   legend('data','nonlinear model fit','Location','NorthWest')

% Plot the results: comparison of the two models
figure(5)
   plot(t,p,'o',t,p_model,'*-',t,p_model2,'gs-')
   xlabel('time in days')
   ylabel('mean density of P. Aurelia')
   legend('data','book fit','nonlinear model fit','Location','NorthWest')
