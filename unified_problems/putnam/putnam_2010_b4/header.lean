import Mathlib

open Filter Topology Set

-- {(p, q) : Polynomial ℝ × Polynomial ℝ | p.degree ≤ 1 ∧ q.degree ≤ 1 ∧ p.coeff 0 * q.coeff 1 - p.coeff 1 * q.coeff 0 = 1}
/--
Find all pairs of polynomials $p(x)$ and $q(x)$ with real coefficients for which $p(x)q(x+1)-p(x+1)q(x)=1$.
-/