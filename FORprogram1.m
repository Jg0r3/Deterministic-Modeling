% Program with FOR loop: first N powers of 2
N = 5;                  % specify N    
powerof2(1) = 1;        %initialization (zero power)
for i = 1:N             % same as for i = 1:1:N
powerof2(i+1) = 2^i; 	%statement
end                     %end of "for" loop 
powerof2'               %show the results

%N=5, 1:N == 1:5 == 1,2,3,4,5, , 4, ?, ?, ?, ?

% powerof2 = ([1:5]+1)