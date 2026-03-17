%==========================================================================
% Enhanced Osprey Optimization Algorithm (EOOA)
%--------------------------------------------------------------------------
% Developed by : Yacine Bouali
%--------------------------------------------------------------------------
% If you use this code in your research, please cite the following paper:
%
% Author(s)  : Yacine Bouali
% Title      : [Full Paper Title]
% Journal    : [Journal / Conference Name]
% Year       : [Year]
% DOI        : [https://doi.org/xxxxxxxxxx]
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



