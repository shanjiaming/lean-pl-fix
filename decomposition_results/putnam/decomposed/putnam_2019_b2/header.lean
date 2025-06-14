import Mathlib

open Topology Filter Set

-- 8/Real.pi^3
/--
For all $n \geq 1$, let
\[
a_n = \sum_{k=1}^{n-1} \frac{\sin \left( \frac{(2k-1)\pi}{2n} \right)}{\cos^2 \left( \frac{(k-1)\pi}{2n} \right) \cos^2 \left( \frac{k\pi}{2n} \right)}.
\]
Determine
\[
\lim_{n \to \infty} \frac{a_n}{n^3}.
\]
-/