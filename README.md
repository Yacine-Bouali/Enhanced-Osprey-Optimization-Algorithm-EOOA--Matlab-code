# 🦅 Enhanced Osprey Optimization Algorithm (EOOA)
[![MATLAB](https://img.shields.io/badge/MATLAB-Compatible-orange)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen)]()

> A MATLAB implementation of an enhanced variant of the Osprey Optimization 
> Algorithm (OOA) for solving global optimization problems with improved 
> accuracy and convergence behavior.

---
A Python implementation of this code is available here: [![Python Version](https://img.shields.io/badge/Python-version-3776AB?logo=python&logoColor=white)](https://github.com/Yacine-Bouali/Enhanced-Osprey-Optimization-Algorithm-EOOA-Python-code)

## 📖 Overview

The **Enhanced Osprey Optimization Algorithm (EOOA)** is a metaheuristic 
optimizer built upon the original OOA, specifically designed to overcome 
common limitations found in standard optimization algorithms, including:

- ❌ Premature convergence
- ❌ Stagnation in local minima
- ❌ Low solution accuracy

The EOOA introduces targeted modifications to the original OOA's search 
mechanisms, resulting in a more robust and accurate optimizer suitable for 
a wide range of global optimization tasks.

---

## 📚 Citation

If you use this code in your research, please cite:
```bibtex
@article{yourname2026eooa,
  title   = {Enhanced Osprey Optimization Algorithm for Global Optimization with Application to PEM Fuel Cell Parameter Identification},
  author  = {Yacine Bouali & Basem Alamri},
  journal = {Biomimetics},
  year    = {2026},
  doi     = {your-doi-here}
}
```

---

## 🗂️ Repository Structure
```
EOOA/MATLAB
│
├── EOOA.m                        # Main EOOA algorithm
├── main.m                        # Run and compare algorithms
│
├── Sphere.m                      # Sphere benchmark function
│
└── README.md
```

---

## ⚙️ Requirements

- MATLAB
- No additional toolboxes required

---

## 🚀 Usage

1. Clone or download the repository
2. Open MATLAB and navigate to the project folder
3. Run the main script:
```matlab
main
```

Or call the algorithm directly:
```matlab
% Define problem settings
lb = -100;          % Lower bound
ub = 100;           % Upper bound
dim = 30;           % Number of dimensions
N = 30;             % Population size
MaxIter = 500;      % Maximum iterations
fobj = @YourFunction;

% Run EOOA
[Best_score, Best_pos, Curve] = EOOA(N, MaxIter, lb, ub, dim, fobj);
```

---

## 📐 Algorithm Parameters

| Parameter | Description |
|---|---|
| `N` | Population size |
| `MaxIter` | Maximum iterations |
| `dim` | Problem dimension |
| `lb` | Lower bound |
| `ub` | Upper bound |

### Internal control parameters

| Parameter | Default | Description |
|---|---|---|
| `lambda_` | `3` | Steepness of the adaptive decay (range 2–4) |
| `CR` | `0.9` | DE crossover probability (range 0.1–0.9)|
| `F_max` | `0.9` | Upper bound of adaptive DE scaling factor |
| `F_min` | `0.3` | Lower bound of adaptive DE scaling factor |


## 📊 Outputs

| Output | Description |
|---|---|
| `Best_score` | Best fitness value found |
| `Best_pos` | Corresponding best solution vector |
| `Curve` | Convergence curve over iterations |

---

## 📬 Contact
Feel free to reach out for any questions or collaborations via LinkedIn:
[![LinkedIn](https://img.shields.io/badge/LinkedIn-Yacine%20Bouali-blue?logo=linkedin)](https://www.linkedin.com/in/yacinebouali3538)

---
