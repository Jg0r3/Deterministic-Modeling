function[f]=nonlin_ls(alpha,p)
% This function evaluates the fit between the Paramecium Aurelia data and
% the model fit for a given k and N.
k = alpha(1);
N = alpha(2);
p_model = zeros(size(p));
p_model(1) = p(1);
for i = 2:length(p_model)
    p_model(i) = p_model(i-1)+k*(N-p_model(i-1))*p_model(i-1);
end
f = sum((p-p_model).^2);  % alternatively may use: f = norm(p-p_model)^2; 
end
