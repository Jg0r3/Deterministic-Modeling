function yprime  = growth(t, y);
         alfa1 = 2;
         alfa2 = 2; 
         yprime = [ alfa1*y(1)*y(2)/(1+y(2))-y(1);
                  -y(1)*y(2)/(1+y(2))-y(2)+alfa2 ];
