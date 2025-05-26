import Mathlib

open Polynomial Filter Topology Real Set Nat List

-- {f : Set.Ioi (1 : ℝ) → Set.Ioi (1 : ℝ) | ∃ c : ℝ, c > 0 ∧ ∀ x : Set.Ioi (1 : ℝ), (f x : ℝ) = x ^ c}
/--
Find all functions $f$ from the interval $(1,\infty)$ to $(1,\infty)$ with the following property: if $x,y \in (1,\infty)$ and $x^2 \leq y \leq x^3$, then $(f(x))^2 \leq f(y) \leq (f(x))^3$.
-/