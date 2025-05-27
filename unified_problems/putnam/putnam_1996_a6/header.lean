import Mathlib

open Function

-- (fun c : ℝ => if c ≤ 1 / 4 then {f : ℝ → ℝ | ∃ d : ℝ, ∀ x : ℝ, f x = d} else {f : ℝ → ℝ | ContinuousOn f (Set.Icc 0 c) ∧ f 0 = f c ∧ (∀ x > 0, f x = f (x ^ 2 + c)) ∧ (∀ x < 0, f x = f (-x))})
/--
Let $c>0$ be a constant. Give a complete description, with proof, of the set of all continuous functions $f:\mathbb{R} \to \mathbb{R}$ such that $f(x)=f(x^2+c)$ for all $x \in \mathbb{R}$.
-/