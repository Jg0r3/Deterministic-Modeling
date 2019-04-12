%%Whale population HW 1 problem:
%(three cycle is observed at approx. r = 3.83)
clear all
format longG
disp('Whale population model: x(k+1)=x(k)+r*(5000-x(k))*(x(k)-500)')
disp('  ')
x0=input('Initial condition = '); %specifying initial condition
r=input('r = '); %specifying the parameter
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
for k=1:40
   x(k+1)=x(k)+r*(5000-x(k))*(x(k)-100)
   n(k+1)=k+1;
   subplot(2,1,1),plot(n,x(:),'*') %plotting solution as points
   xlabel('iteration')
   ylabel('x')
   title('Logistic map')
   axis([1 41 -0.1 6000])
%
   subplot(2,1,2),plot(n,x(:))     %plotting solution as a broken line
   xlabel('iteration')
   ylabel('x')
   hold on
   subplot(2,1,2),plot(n,x(:),'*') %superimposing the solution points
   hold off 
   axis([1 41 -0.1 6000])
   pause
end

clear all
