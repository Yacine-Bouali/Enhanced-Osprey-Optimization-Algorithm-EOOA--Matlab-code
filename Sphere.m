%==========================================================================
% Enhanced Osprey Optimization Algorithm (EOOA)
% DOI: https://doi.org/10.3390/biomimetics11080545
%
%--------------------------------------------------------------------------
%
% If you use this code in your research, please cite:
% Bouali, Yacine, and Basem Alamri. “Enhanced Osprey Optimization Algorithm for Global Optimization with Application to PEM Fuel Cell Parameter Identification.” 
% Biomimetics, vol. 11, no. 8, Aug. 2026, p. 545, https://doi.org/10.3390/biomimetics11080545.
%==========================================================================

%% =========================================================
%  Sphere Benchmark Function
%  ---------------------------------------------------------
%  Type        : Unimodal
%  Formula     : f(x) = sum(x_i ^ 2)
%  Global Min  : f(0, 0, ..., 0) = 0
%  Search Space: [-100, 100]
%% =========================================================

function fitness = Sphere(x)
    fitness = sum(x .^ 2);
end



