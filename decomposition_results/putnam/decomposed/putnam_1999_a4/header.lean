import Mathlib

open Filter Topology Metric

-- Note: This is done assuming that the series converges, otherwise it is unclear in which order to sum. The problem statement assumes convergence.
-- 9/32
/--
Sum the series \[\sum_{m=1}^\infty \sum_{n=1}^\infty \frac{m^2 n}{3^m(n3^m+m3^n)}.\]
-/