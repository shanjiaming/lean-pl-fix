import Mathlib

open EuclideanGeometry Topology Filter Complex

/--
Prove that, for any sequence of real numbers $a_1, a_2, \dots$, $$\lim_{n \to \infty} \frac{\sum_{k = 1}^{n} e^{ia_k}}{n} = \alpha$$ if and only if $$\lim_{n \to \infty} \frac{\sum_{k = 1}^{n} e^{ia_{k^2}}}{n^2} = \alpha.$$
-/