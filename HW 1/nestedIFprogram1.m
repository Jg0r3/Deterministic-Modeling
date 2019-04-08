%Program with nested IF statements
x = input('month (in capitals): ','s')  %type the month                   
if strcmp(x,'JUNE')==1                  %compare strings
disp('Season: summer')                   %show result                                 
elseif strcmp(x,'JULY')==1              %compare strings                    
    disp('Season: summer')               %show result           
elseif strcmp(x,'AUGUST')==1            %compare strings                 
    disp('Season: summer')               %show result     
else
    disp('Season: not summer')           %show result                  
end                                 %end of "if" statement