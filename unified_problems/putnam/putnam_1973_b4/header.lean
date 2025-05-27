import Mathlib

open Nat Set MeasureTheory Topology Filter

-- Note: Boosted domain to ℝ, which is fine because you can extend any such function f from [0,1] to ℝ satisfying the same properties. There may be multiple correct answers.
-- (fun x => x)
/--
Suppose $f$ is a function on $[0,1]$ with continuous derivative satisfying $0 < f'(x) \leq 1$ and $f 0 = 0$. Prove that $\left[\int_0^1 f(x) dx\right]]^2 \geq \int_0^1 (f(x))^3 dx$, and find an example where equality holds.
-/