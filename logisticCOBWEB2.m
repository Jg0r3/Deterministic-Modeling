%Discrete Logistic Equation (cobweb illustrative analysis #2)
clear all
disp('Logistic equation: x(k+1)=r*x(k)*(1-x(k))')
disp('  ')
x0=input('Initial condition = ');
r=input('r = ');
x(1)=x0;
x0(1)=x0;
n(1)=1;
figure(1)
%
plot([-1 2],[0 0],'k-',[0 0],[-1 2],'k-')
hold on
axis([-0.5 1.5 -0.5 1.5])
zx=0:0.01:1;
zx0=r*zx.*(1-zx);
zy=r*zx0.*(1-zx0);
zz=zx;
plot(zx,zy,'b-','Linewidth',2)
plot(zx,zx0,'m--','Linewidth',2)
plot(zx,zz,'g-','Linewidth',2)
text(1.25,-0.15,'x_n')
text(0.1,1.25,'f(x_n) = r \times x_n\times (1-x_n), y = f(f(x_n))')
pause
plot(x(1),0,'r*')
pause
x0(2)=r*x(1)*(1-x(1));
x(2)=r*x0(1)*(1-x0(1));
plot([x(1) x(1)],[0 x(2)],'r*-')
pause
%   
for k=2:30
    x0(k+1)=r*x(k)*(1-x(k));
   x(k+1)=r*x0(k)*(1-x0(k));
   plot([x(k-1) x(k)],[x(k) x(k)],'r*-')
   plot(x(k),0,'r*','Linewidth',2)
   pause
   plot([x(k) x(k)],[x(k) x(k+1)],'r*-')
   pause
end

hold off

