% Program constructs the vector field and the direction field for 
% the chemostat model
%
% Sample points at which the vectors will be constructed:
[X,Z] = meshgrid(0:.2:3);
	n=size(X);
	alfa1=2;
	alfa2=2;
% Components of vector field vectors and of direction field vectors:
	for i=1:n(1)
		for j=1:n(1)
			F(i,j)= alfa1*X(i,j)*Z(i,j)/(1+ Z(i,j))- X(i,j);
			G(i,j)= - X(i,j)*Z(i,j)/(1+ Z(i,j))- Z(i,j)+alfa2;
			F1(i,j)=0.1*F(i,j)/( (F(i,j))^2+(G(i,j))^2)^0.5;
			G1(i,j)=0.1*G(i,j)/( (F(i,j))^2+(G(i,j))^2)^0.5;
		end
    end
%
% Graphs:
    figure(10)
    quiver(X,Z,F,G)
    title('Chemostat: vector field')
    xlabel('Population')
	ylabel('Nutrient')
    %
    figure(20)
	quiver(X,Z,F1,G1)
    title('Chemostat: direction field')
    xlabel('Population')
	ylabel('Nutrient')
