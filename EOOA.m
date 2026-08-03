%==========================================================================
% Enhanced Osprey Optimization Algorithm (EOOA)
% DOI: https://doi.org/10.3390/biomimetics11080545
%--------------------------------------------------------------------------
% Developed by : Yacine Bouali
%--------------------------------------------------------------------------
%
% If you use this code in your research, please cite:
% Bouali, Y.; Alamri, B. "Enhanced Osprey Optimization Algorithm for Global Optimization with Application to PEM Fuel Cell Parameter Identification," Biomimetics, vol. 11, no. 8, 2026.
% DOI: https://doi.org/10.3390/biomimetics11080545
%==========================================================================

function [Best_score, Best_pos, EOOA_curve] = EOOA(SearchAgents, Tmax, lb, ub, dim, ObjFun)

EOOA_curve = zeros(Tmax,1);

%% ── Non-linear Adaptive Parameter ────────────────────────────────────────
%  alpha_t in (0,1]: drives the phase 3 parameters.
%  Formula : alpha_t = exp(-lambda * (t/Tmax)^2)          [Eq. 9]

%% ── DE Control Parameters ─────────────────────────────────────────────────
lambda = 3;    % Lambda  : steepness constant (range 2–4). Default = 3.
CR    = 0.9;   % Crossover probability                                
F_max = 0.9;   % Upper bound of adaptive DE scaling factor            
F_min = 0.3;   % Lower bound of adaptive DE scaling factor            
%% ── Bounds Setup ──────────────────────────────────────────────────────────
lb = ones(1, dim) .* lb;
ub = ones(1, dim) .* ub;

%% ── Initialisation (uniform random) ──────────────────────────────────────
for i = 1:dim
    X(:,i) = lb(i) + rand(SearchAgents,1) .* (ub(i) - lb(i));
end
for i = 1:SearchAgents
    fit(i) = ObjFun(X(i,:));
end

%% ═══════════════════════ MAIN LOOP ═══════════════════════════════════════
for t = 1:Tmax

    %% ── Eq. 9: Non-linear adaptive parameter ──────────────────────────────
    alpha_t = exp(-lambda * (t / Tmax)^2);   % alpha_t in (0, 1]

    %% ── Eq. 10: Adaptive DE scaling factor ────────────────────────────────
    %  F is large early (high alpha_t --> diverse mutation)
    %  F is small late  (low  alpha_t --> fine perturbation)
    F_de = F_min + (F_max - F_min) * alpha_t;

    %% ── Update global best ────────────────────────────────────────────────
    [Fbest, bestLoc] = min(fit);
    if t == 1
        xbest = X(bestLoc,:);
        fbest = Fbest;
    elseif Fbest < fbest
        fbest = Fbest;
        xbest = X(bestLoc,:);
    end

    %% ─────────── Three-Phase Agent Update Loop ───────────────────────────
    for i = 1:SearchAgents

        %% ── PHASE 1: Exploration ────────────────
        fish_position = find(fit < fit(i));
        if isempty(fish_position)
            selected_fish = xbest;
        else
            if rand < 0.5                          % [Eq. 4] selection rule
                selected_fish = xbest;
            else
                k = randperm(numel(fish_position), 1);
                selected_fish = X(fish_position(k), :);
            end
        end
        I = round(1 + rand);
        X_new = X(i,:) + rand .* (selected_fish - I .* X(i,:));   % [Eq. 5]
        X_new = max(X_new, lb); X_new = min(X_new, ub);
        fit_new = ObjFun(X_new);
        if fit_new < fit(i), X(i,:) = X_new; fit(i) = fit_new; end % [Eq. 6]
        % END Phase 1 ──────────────────────────────────────────────────────

        %% ── PHASE 2: Exploitation ───────────
        %  Retained unchanged from the original OOA (linear 1/t decay).
        X_new = X(i,:) + (lb + rand*(ub-lb)) / t;                 % [Eq. 7]
        X_new = max(X_new, lb); X_new = min(X_new, ub);
        fit_new = ObjFun(X_new);
        if fit_new < fit(i), X(i,:) = X_new; fit(i) = fit_new; end % [Eq. 8]
        % END Phase 2 ──────────────────────────────────────────────────────

        %% ── PHASE 3: DE-based (NEW PHASE) ──────────
        %  Not present in original OOA. Adds cross-agent information sharing.
        % Select 3 distinct random agents different than i
        candidates = randperm(SearchAgents, 4);
        candidates(candidates == i) = [];
        r1 = candidates(1); r2 = candidates(2); r3 = candidates(3);

        % Mutant vector:                                            [Eq. 11]
        mutant = X(r1,:) + F_de .* (X(r2,:) - X(r3,:));
        mutant = max(mutant, lb); mutant = min(mutant, ub);

        % Binomial crossover: mix mutant with current agent         [Eq. 12]
        mask = rand(1, dim) < CR;
        if ~any(mask), mask(randi(dim)) = true; end   % enforce j_rand
        trial = X(i,:);
        trial(mask) = mutant(mask);

        % Greedy selection                                          [Eq. 13]
        fit_trial = ObjFun(trial);
        if fit_trial < fit(i), X(i,:) = trial; fit(i) = fit_trial; end
        % END Phase 3 ──────────────────────────────────────────────────────

    end % end agent loop

    EOOA_curve(t) = fbest;

end % end main loop
%% ═════════════════════════════════════════════════════════════════════════

Best_score = fbest;
Best_pos   = xbest;
end
