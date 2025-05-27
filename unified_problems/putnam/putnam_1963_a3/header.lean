import Mathlib

open Nat Set Topology Filter

-- fun (f : ℝ → ℝ) (n : ℕ) (x : ℝ) (t : ℝ) ↦ (x - t) ^ (n - 1) * (f t) / ((n - 1)! * t ^ n)
/--
Find an integral formula (i.e., a function $z$ such that $y(x) = \int_{1}^{x} z(t) dt$) for the solution of the differential equation $$\delta (\delta - 1) (\delta - 2) \cdots (\delta - n + 1) y = f(x)$$ with the initial conditions $y(1) = y'(1) = \cdots = y^{(n-1)}(1) = 0$, where $n \in \mathbb{N}$, $f$ is continuous for all $x \ge 1$, and $\delta$ denotes $x\frac{d}{dx}$.
-/