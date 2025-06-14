import Mathlib

open Polynomial

-- Note: uses (ℝ → ℝ) instead of (Rpos → Rpos) to check the equality property
-- {f : Set.Ioi (0 : ℝ) → Set.Ioi (0 : ℝ) | ∃ c : ℝ, c ≥ 0 ∧ ∀ x : Set.Ioi (0 : ℝ), f x = 1 / (1 + c * x)}
/--
Find all continuous functions $f:\mathbb{R}^+ \to \mathbb{R}^+$ such that $f(xf(y))+f(yf(x))=1+f(x+y)$ for all $x,y>0$.
-/