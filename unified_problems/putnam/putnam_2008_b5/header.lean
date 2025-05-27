import Mathlib

open Filter Topology Set Nat

-- {fun (x : ℝ) => x + n | n : ℤ} ∪ {fun (x : ℝ) => -x + n | n : ℤ}
/--
Find all continuously differentiable functions f : \mathbb{R} \to \mathbb{R} such that for every rational number $q$, the number $f(q)$ is rational and has the same denominator as $q$.
-/