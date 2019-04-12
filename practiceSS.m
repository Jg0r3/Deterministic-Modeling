%interactions test, finding curve intersections of two lines

t= 0:pi/64:3*pi;
y = sin(t);
y2 = 0.6*sin(t-0.7)+0.1*randn(size(y));

[xout,yout] = intersections(t,y,t,y2,1);
plot(t,y,'linewidth',2)
set(gca,'xlim',[min(t) max(t)],'ylim',[-1.1 1.1])
hold on
plot(t,y2,'g','linewidth',2)
plot(xout,yout,'r.','markersize',18)

SteadyStates = [xout,yout]

clear all