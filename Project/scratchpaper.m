%scratch_paper

% K1 Run
% Vessel 1 Vessel Volumes/Hr
K_vvh_1 = [0.028 0.099 0.142 0.207 0.269 0.287 0.352 0.403]';
% Vessel 1 Optical Density at the steady state
K_OD_1 = [0.144 0.151 0.099 0.069 0.045 0.02 0.003 0]';

% Vessel 2 Vessel Volumes/Hr
K_vvh_2 = [0.054 0.11 0.141 0.199 0.257 0.296 0.348 0.397 0.41]';
% Vessel 2 Optical Density at the steady state
K_OD_2 = [0.164 0.151 0.11 0.092 0.072 0.023 0.006 0.002 0.004]';

a = K_vvh_2(1:6)
b = K_OD_2(1:length(a))
%-----------------------------------

% Sensitive- Run
% Vessel 1 Vessel Volumes/Hr
S_vvh_1 = [0.041 0.099 0.167 0.223 0.266 0.328 0.356 0.401 0.462]';
% Vessel 1 Optical Density at the steady state %% Bacterial population
S_OD_1 = [0.54 0.494 0.459 0.395 0.229 0.019 0.006 0.003 0]';

% Vessel 2 Vessel Volumes/Hr
S_vvh_2 = [0.0571 0.126 0.196 0.263 0.313 0.383]';
% Vessel 2 Optical Density at the steady state
S_OD_2 = [0.385 0.456 0.363 0.197 0.044 0.004]';

% figure(1)
% scatter(K_vvh_1,K_OD_1)
% 
% figure(2)
% scatter(K_vvh_2,K_OD_2)
% 
% figure(3)
% scatter(S_vvh_1,S_OD_1)
% 
% figure(4)
% scatter(S_vvh_2,S_OD_2)

clear all
