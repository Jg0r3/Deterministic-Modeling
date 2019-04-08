% Problem 2.4.2 - medication dosages
% Linearization comparison of Simple Model
%graph model and linearization and find intersections (steady states)
format longG %convert 1+e0 to more readable numbers for troubleshooting

N = input("input amount of iterations:  "); %input for iteration count

k = .2;
b = 3;      %input("input initial dosage amount: ");

SimpleModel(1) = 0;         %initialization (zero power)
for i = 1:N             % same as for i = 1:1:N
    SimpleModel(i+1) = SimpleModel(i)-k*SimpleModel(i)+b; %2.3.2 model
end                      %end of "for" loop 


Linearization(1) = 0;         %initialization (zero power)
for i = 1:N              % same as for i = 1:1:N
    Linearization(i+1) = Linearization(i)+1; %2.3.2 model
end     

ArrayLength = [0:N]

%Linearization' %for troubleshooting
%SimpleModel'   %for troubleshooting

Simple_matrix = [ArrayLength(:), SimpleModel(:)]
Linear_matrix = [ArrayLength(:), Linearization(:)]



figure(1)
  plot(Simple_matrix, 'b') 
  hold on 
  plot(Linear_matrix, 'r')
  hold off

clear all