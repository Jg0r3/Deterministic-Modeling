% Problem 1.4.2
% modelling bacterial growth
format longG %convert 1+e0 to more readable numbers for troubleshooting

N = input("input end of range of growth function: ")
a = input("input growth rate 'a': ")
powerof2(1) = 1;         %initialization (zero power)
for i = 1:N              % same as for i = 1:1:N
    powerof2(i+1) = 2^(a*i); %statement
end                      %end of "for" loop 

arraylength = [1:1:(N+1)];

powerof2'
%arraylength'

figure(1)
  plot(arraylength, powerof2, 'r')

clear all