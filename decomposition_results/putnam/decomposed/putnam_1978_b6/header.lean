import Mathlib

open Set Real Filter Topology Polynomial

/--
Let $a_{ij}$ be real numbers in $[0, 1]$. Show that
\[
\left( \sum_{i=1}^n  \sum_{j=1}^{mi} \frac{a_{ij}}{i} \right) ^2 \leq 2m \sum_{i=1}^n \sum_{j=1}^{mi} a_{ij}.
\]
-/