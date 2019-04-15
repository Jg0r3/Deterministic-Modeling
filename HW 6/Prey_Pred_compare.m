%Discrete Logistic Equation: HW 6 problem 4
%Comparing two Prey-Predator Competition models
%(three cycle is observed at approx. r = 3.83)
clear all
format longG
disp('Competion models: du/dt = (u-0.01)*(2*u-0.02)*u*v vs dv/dt = (2*u-0.02)*(2*v-0.04)*u*v')
disp('  ')
u0=input('Initial condition u0 #1 = ');
v0=input('Initial condition v0 #2 = ');
u(1)=u0;
v(1)=v0;
n(1)=1;
% % figure(1)
% % %
% %    subplot(2,1,1),plot(n,x(:),'*',n,y(:),'ro')
% %    xlabel('iteration')
% %    ylabel('x, y')
% %    title('Logistic map')
% %    axis([1 41 -0.1 1.1])
% %    %
% %    subplot(2,1,2),plot(n,x(:),'*',n,y(:),'ro')
% %    xlabel('iteration')
% %    ylabel('x, y')
% %    axis([1 41 -0.1 1.1])
% %    %
% %    pause
   %
for k=1:20
   u(k+1)=u(k)-0.01*u(k)*2-0.02*u(k)*v(k)
   v(k+1)=(2*u(k)-0.02)*(2*v(k)-0.04)*u(k)*v(k)
   n(k+1)=k+1;
end

figure(1)
plot(u(k),n, 'b')

clear all