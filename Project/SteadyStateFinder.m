%first attempt at finding steady states by using intersection algorithm

format longG %convert 1+e0 to more readable numbers for troubleshooting

%example formulas - worked
% t= 0:pi/64:3*pi;
% y = sin(t);
% y2 = 0.6*sin(t-0.7)+0.1*randn(size(y));

%simple first tries - worked
% t = 0:10;
% y = 2.^t + 1
% y2 = 20*t - 1

%simple continous decay model - worked
%delta_t = input(' time interval in 10 minute intervals, delta_t = '); %?t is 1/10 minute
%t  = [0:delta_t:15]; %for 1st discrete model
% I0 = 10; 
% t  = [0:15];
% alpha = .3;           % rate parameter
% y3 = I0;
% y3 = I0*exp(-alpha*t); % continuous solution
% y2 = t;

%simple discrete decay model - worked (in conjuction with continous above)
% N = length(y3);
% y = I0 %defining the intial parameter
% for i = 1:N-1;
%     y(i+1) = y(i) - alpha*delta_t*y(i); % my discrete model for decay
% end

%Medication dosage model (from textbook, 2.4.2b)
%x(k+1)=x(k)+r*(5000-x(k))*(x(k)-500) - worked (keep an eye on t(end) :)
N = input('input iterations: ');
t = [0:N]; %input for iteration count
k = .2;
b = 3;      %input("input initial dosage amount: ");
y(1) = 0;         %initialization (zero power)
for i = 1:t(end)             % same as for i = 1:1:N
    y(i+1) = y(i)-k*y(i)+b %2.3.2 model
end 

y2 = t;

size(y)
size(y2)

[xout,yout] = intersections(t,y,t,y2,1);

figure(1)
plot(t,y,'linewidth',2)
%set(gca,'xlim',[min(t) max(t)],'ylim',[-1.1 1.1])%formatting
hold on
plot(t,y2,'g','linewidth',2)
plot(xout,yout,'r.','markersize',18)
hold off

SteadyStates = [xout,yout]

clear all