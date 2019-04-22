%%Example MT 2 problem:
clear all
format longG
disp('harvesting model: X = r*x*(1-(x/k))-h')
disp('  ')
x0=.5 %input('Initial condition = '); %specifying initial condition
r=2 %input('r = '); %specifying r
k=5 %input('k = '); %specifying k
h=0 %input('h = '); %specifying h
x(1)=x0;
;

for i=1:20
   x(i+1)= r*x(i)*(1-(x(i)/k))-h
end

figure(2)
plot(x)
axis([0 20 0 3])

clear all
