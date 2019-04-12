function yhat = myfun1(coef0,tdat1)

% Model predictions that are going to be compared with the data
% and that are constructed for a particular choice of model 
%prameters' values:

c1=coef0(1);c2=coef0(2);y00=coef0(3); %changed coef -> coef0 to match main script
[tdat1,yhatA]=ode23(@logistic1,tdat1,y00,[],c1,c2);
yhat=yhatA; 