%Whale Population Model HW 1 (cobweb illustrative analysis #1):
clear all
format longG
disp('Whale Population Model: x(k+1)=x(k)+r((M-x(k))(x(k)-m))')
disp('  ')
M = 5000; %carrying capacity for whales
m = 100;  % minimal survival level
x0=input('Initial condition = ');
r=input('r = ');
x(1)=x0;
n(1)=1;
figure(1)
%
plot([-1 2],[0 0],'k-',[0 0],[-1 2],'k-')   % making coordinate axes
hold on
axis([-0.5 1.5 -0.5 1.5])                   % axes limits
zx=0:0.01:1;                                
zy=r*zx.*(1-zx);                    % describing the right-hand side
zz=zx;                              % defining the straight line
plot(zx,zy,'b-','Linewidth',2)      % plotting the right-hand side
plot(zx,zz,'g-','Linewidth',2)      % plotting the straight line
text(1.25,-0.15,'x_n')
text(0.1,1.25,'f(x_n) = r \times x_n\times (1-x_n)')
pause
plot(x(1),0,'r*')                   % plotting the initial iteration
pause
x(2)=r*x(1)*(1-x(1));
plot([x(1) x(1)],[0 x(2)],'r*-')
pause
%                                   % Computing and plotting iterations:
for k=2:30
   x(k+1)=x(k)+r*(5000-x(k))*(x(k)-100) %x(k+1)=r*x(k)*(1-x(k));
   plot([x(k-1) x(k)],[x(k) x(k)],'r*-')
   plot(x(k),0,'r*','Linewidth',2)
   pause
   plot([x(k) x(k)],[x(k) x(k+1)],'r*-')
   pause
end

hold off

