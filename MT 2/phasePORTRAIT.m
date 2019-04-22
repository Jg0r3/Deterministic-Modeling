% compute null-clines:
	%
	alfa1=2;
	alfa2=2;
	x=0:0.01:3;
	z=2:-0.01:0.5;
	z1=(alfa1-1)^(-1)*x.^0;
	x1=((alfa2-z).*(1+z))./z;
	% plot null-clines:
	%
    figure(1)
	plot(x1,z,'g:',x,z1,'g:')
	hold on
	%
	% plot the velocity vector field:
	%
	[X,Z] = meshgrid(0:.2:3);
	n=size(X);
	alfa1=2;
	alfa2=2;
	for i=1:n(1)
		for j=1:n(1)
			F(i,j)= alfa1*X(i,j)*Z(i,j)/(1+ Z(i,j))- X(i,j);
			G(i,j)= - X(i,j)*Z(i,j)/(1+ Z(i,j))- Z(i,j)+alfa2;
		end
	end
	quiver(X,Z,F,G)
 	%
	% solve ODE, plot phase trajectories:
	%
	[t,y] = ode45('growth',[0,20],[0.5,3]);
	plot(y(:,1),y(:,2))
	[t1,y1] = ode45('growth',[0,20],[0.75,0]);
	plot(y1(:,1),y1(:,2))
	[t2,y2] = ode45('growth',[0,20],[2,0]);
	plot(y2(:,1),y2(:,2))
	[t3,y3] = ode45('growth',[0,20],[1.5,3]);
	plot(y3(:,1),y3(:,2))
	[t4,y4] = ode45('growth',[0,20],[3,0.5]);
	plot(y4(:,1),y4(:,2))
	[t5,y5] = ode45('growth',[0,20],[0.01,2.0]);
	plot(y5(:,1),y5(:,2))
    %
    % plot non-trivial steady state:
    plot(2,1,'ro','LineWidth',2)
	% choice of axes:
	%
	v=[0,3,0,3];
	axis(v);
	% labels:
	title('Chemostat: phase portrait')
	xlabel('Population')
	ylabel('Nutrient')
	hold off
    
    % plot sample solutions:
	%
    figure(2)
    subplot(2,1,1),plot(t,y,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])
    subplot(2,1,2),plot(t1,y1,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])

    figure(3)
    subplot(2,1,1),plot(t2,y2,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])
    subplot(2,1,2),plot(t3,y3,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])
    
    figure(4)
    subplot(2,1,1),plot(t4,y4,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])
    subplot(2,1,2),plot(t5,y5,'o-')
    xlabel('time')
    legend('population','nutrient')
    ylim([0 4])
