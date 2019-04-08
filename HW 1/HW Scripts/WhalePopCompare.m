%Whale population model HW 1:
%Comparing two solutions
%(three cycle is observed at approx. r = 3.83)
clear all
format longG
disp('Whale Population Model: x(k+1)=x(k)+r*(5000-x(k))*(x(k)-500)')
disp('  ')
x0=input('Initial condition #1 = ');
y0=input('Initial condition #2 = ');
r=input('r = ');
x(1)=x0;
y(1)=y0;
n(1)=1;
figure(1)
%
   subplot(2,1,1),plot(n,x(:),'*',n,y(:),'ro')
   xlabel('iteration')
   ylabel('x, y')
   title('Logistic map')
   axis([1 41 -0.1 1.1])
   %
   subplot(2,1,2),plot(n,x(:),'*',n,y(:),'ro')
   xlabel('iteration')
   ylabel('x, y')
   axis([1 41 -0.1 1.1])
   %
   pause
   %
for k=1:40
   x(k+1)=x(k)+r*(5000-x(k))*(x(k)-100);
   y(k+1)=y(k)+r*(5000-y(k))*(y(k)-100);
   n(k+1)=k+1;
   subplot(2,1,1),plot(n,x(:),'*',n,y(:),'ro')
   xlabel('iteration')
   ylabel('x, y')
   title('Logistic map')
   axis([1 41 -6000 6000])
%
   subplot(2,1,2),plot(n,x(:),'b*-',n,y(:),'ro-')
   xlabel('iteration')
   ylabel('x, y')
   axis([1 41 -6000 6000])
   pause
end