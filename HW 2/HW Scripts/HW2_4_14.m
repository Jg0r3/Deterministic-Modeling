% Problem 2.4.2 - medication dosages
% Linearization comparison of Simple Model
%graph model and linearization and find intersections (steady states)
format longG %convert 1+e0 to more readable numbers for troubleshooting

N = input("input population size:  "); %input for iteration count
k = .01;
r = .95
DiseaseModel(1) = 1;         %initialization (zero power)
for i = 1:N             % same as for i = 1:1:N
    DiseaseModel(i+1) = DiseaseModel(i)+(k*DiseaseModel(i))*(N-DiseaseModel(i)); %2.3.14 model
end                      %end of "for" loop 


figure(1)
  plot(DiseaseModel) 

clear all