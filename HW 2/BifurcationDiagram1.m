%Discrete Logistic Equation:
%(Bifurcation diagram)
clear all
disp('Logistic equation: x(k+1)=r*x(k)*(1-x(k))')
disp('Bifurcation diagram')
x(1)=0.5;
figure(1)
r1=0.1:0.1:1;
x1=1-r1.^0;
r2=1.:0.1:4;
x2=1-r2.^0;
r3=1.:0.1:3;
x3=1-r3.^(-1);
r4=3.:0.1:4;
x4=1-r4.^(-1);
figure(1)
plot(r1,x1,'k*-',r2,x2,'ko',r3,x3,'k*-',r4,x4,'ko')
hold on
for n=1:100
   r(n)=3.01+(n-1)*0.01;
for k=1:100                     % transition trajectory
   x(k+1)=r(n)*x(k)*(1-x(k));
end
for k=101:500
   rr(k-100)=r(n);
   x(k+1)=r(n)*x(k)*(1-x(k));
   xx(k-100)=x(k+1);
end
plot(rr,xx,'k.')
end
hold off
title('Bifurcation diagram')
xlabel('Parameter')
ylabel('Steady states, periodic and chaotic solutions')