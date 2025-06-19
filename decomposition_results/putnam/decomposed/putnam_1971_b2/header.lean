import Mathlib

open Set MvPolynomial

-- {fun x : ℝ => (x^3 - x^2 - 1)/(2 * x * (x - 1))}
/--
Find all functions $F : \mathbb{R} \setminus \{0, 1\} \to \mathbb{R}$ that satisfy $F(x) + F\left(\frac{x - 1}{x}\right) = 1 + x$ for all $x \in \mathbb{R} \setminus \{0, 1\}$.
-/