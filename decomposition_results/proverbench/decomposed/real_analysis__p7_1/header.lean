import Mathlib

/-
Let $f:[0,8] \rightarrow \mathbb{R}$ be defined by $f(x)=\sqrt[3]{8x-x^2}$. Then there exists a point $c \in (0,8)$ such that $f'(c) = 0$. Moreover, this point is specifically $c = 4$.
-/

open Real

variable (x : ℝ)

-- Define `f`: The function f is defined as f(x) = (8x - x^2)^(1/3)
noncomputable def f (x : ℝ) : ℝ := (8 * x - x^2)^(1/3 : ℝ)

-- Prove `derivative_f`: The derivative of f is given by f'(x) = (1/3) * (8x - x^2)^(-2/3) * (8 - 2x)