import Mathlib

open Set Real

/--
Let $a_1, a_2, \dots , a_n$ be reals in the interval $(0, \pi)$ with arithmetic mean $\mu$. Show that
\[
\prod_{i=1}^n \left( \frac{\sin a_i}{a_i} \right) \leq \left( \frac{\sin \mu}{\mu} \right)^n.
\]
-/