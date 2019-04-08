function yhat = myfun1(coef,tdat1)

% Model predictions that are going to be compared with the data
% and that are constructed for a particular choice of model 
%prameters' values:

c1=coef(1);c2=coef(2);y00=coef(3);
[tdat1,yhatA]=ode23(@logistic1,tdat1,y00,[],c1,c2);
yhat=yhatA; 