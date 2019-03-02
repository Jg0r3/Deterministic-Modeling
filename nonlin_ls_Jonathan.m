function[f]=nonlin_ls_Jonathan(alpha,p)
% This function evaluates the fit between the Paramecium Aurelia data and
% the model fit for a given k and N.
k = alpha(1);
N = alpha(2);
p_model2 = zeros(size(p));
p_model2(1) = p(1);
%%k > 2;
for i = 2:length(p_model2)
    p_model2(i) = (k/(1+((k-1)/N)*p_model2(i-1)))*p_model2(i-1);
    %p_model2(i) = ((alpha_opt(1))/(1+((alpha_opt(1)-1)/alpha_opt(2)))*p_model2(i-1))*p_model2(i-1)
end
f = sum((p-p_model2).^2);  % alternatively may use: f = norm(p-p_model)^2; 
end