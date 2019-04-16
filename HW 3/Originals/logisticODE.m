function[f]=logisticODE(t,x,k,N)
f = k*x*(1-x/N);