 % Simple program
x = 0:0.1:10;  % independent variable values
y = exp(-0.5*x).*cos(x);  % function output
plot(x,y,'b*-')	% plot the results
xlabel('x')	% label of x – axis
ylabel('y')	% label of y – axis 
title('Graph of a function')  % title 