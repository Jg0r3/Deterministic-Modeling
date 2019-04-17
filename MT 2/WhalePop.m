%%Example MT 2 problem:
clear all
format longG
disp('harvesting model: X = r*x*(1-(x/k))-h')
disp('  ')
x0=input('Initial condition = '); %specifying initial condition
r=input('r = '); %specifying r
k=input('k = '); %specifying k
h=input('h = '); %specifying h
x(1)=x0;
n(1)=1;

%Initialization of the figure
figure(1)
%
   subplot(2,1,1),plot(n,x(:),'*')  %first iteration
   xlabel('iteration')
   ylabel('x')
   title('Logistic map')
   axis([1 41 -0.1 1.1])            %specifying the axes limits
   %
   subplot(2,1,2),plot(n,x(:),'*')  %first iteration
   xlabel('iteration')
   ylabel('x')
   axis([1 41 -0.1 1.1])
   %
   pause
   %
for i=1:40
   x(i+1)= r*x(i)*(1-(x(i)/k))-h;
   n(i+1)=i+1;
   subplot(2,1,1),plot(n,x(:),'*') %plotting solution as points
   xlabel('iteration')
   ylabel('x')
   title('Logistic map')
   axis([1 41 -0.1 5]) %changed 6000 -> 10
%
   subplot(2,1,2),plot(n,x(:))     %plotting solution as a broken line
   xlabel('iteration')
   ylabel('x')
   hold on
   subplot(2,1,2),plot(n,x(:),'*') %superimposing the solution points
   hold off 
   axis([1 41 -0.1 5]) %changed 6000 -> 10
   pause
end

clear all
