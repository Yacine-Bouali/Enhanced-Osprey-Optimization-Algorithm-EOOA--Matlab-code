%==========================================================================
% Enhanced Osprey Optimization Algorithm (EOOA)
% DOI: https://doi.org/10.3390/biomimetics11080545
%
%--------------------------------------------------------------------------
%
% If you use this code in your research, please cite:
% Bouali, Y.; Alamri, B. "Enhanced Osprey Optimization Algorithm for Global Optimization with Application to PEM Fuel Cell Parameter Identification," Biomimetics, vol. 11, no. 8, 2026.
% DOI: https://doi.org/10.3390/biomimetics11080545
%==========================================================================

%%
clc;
clear;
close all;

%% ---- Problem Definition --------------------------------
fobj    = @Sphere;          % Objective function
lb      = -100;             % Lower bound
ub      = 100;              % Upper bound
dim     = 30;               % Number of dimensions

%% ---- Algorithm Parameters ------------------------------
N       = 30;               % Population size
MaxIter = 500;              % Maximum number of iterations

%% ---- Run EOOA ------------------------------------------
disp('Running EOOA...');
[Best_score_EOOA, Best_pos_EOOA, Curve_EOOA] = EOOA(N, MaxIter, lb, ub, dim, fobj);

fprintf('EOOA  — Best Score: %.6e\n', Best_score_EOOA);

%% ---- Convergence Curve Plot ----------------------------
figure('Name', 'Convergence Curve', 'NumberTitle', 'off');

semilogy(Curve_EOOA, 'r-',  'LineWidth', 2, 'DisplayName', 'EOOA');
xlabel('Iteration',   'FontSize', 13, 'FontWeight', 'bold');
ylabel('Fitness (log scale)', 'FontSize', 13, 'FontWeight', 'bold');
title('Convergence Curve — Sphere Function', 'FontSize', 14, 'FontWeight', 'bold');
legend('show', 'FontSize', 11, 'Location', 'northeast');
grid on;
box on;
