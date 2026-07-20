# 🦅 Enhanced Osprey Optimization Algorithm (EOOA)
[![MATLAB](https://img.shields.io/badge/MATLAB-Compatible-orange)](https://www.mathworks.com/)
[![License: MIT](https://img.shields.io/badge/License-MIT-green.svg)](LICENSE)
[![Status](https://img.shields.io/badge/Status-Active-brightgreen)]()

> A MATLAB implementation of an enhanced variant of the Osprey Optimization 
> Algorithm (OOA) for solving global optimization problems with improved 
> accuracy and convergence behavior.

---
[![Python Version](https://img.shields.io/badge/Python-version-3776AB?logo=python&logoColor=white)](https://github.com/Yacine-Bouali/Enhanced-Osprey-Optimization-Algorithm-EOOA-Python-code)

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

---

## 📊 Outputs

| Output | Description |
|---|---|
| `Best_score` | Best fitness value found |
| `Best_pos` | Corresponding best solution vector |
| `Curve` | Convergence curve over iterations |

---

## 📬 Contact

For questions or collaborations, feel free to open an 
[issue](https://github.com/your-username/EOOA/issues) or reach out via email.

---

## 📝 License

This project is licensed under the **MIT License** — see the [LICENSE](LICENSE) file for details.
