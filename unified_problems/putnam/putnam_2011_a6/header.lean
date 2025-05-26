import Mathlib

open Topology Filter Matrix

/--
Let $G$ be an abelian group with $n$ elements, and let $\{g_1=e,g_2,\dots,g_k\} \subsetneq G$ be a (not necessarily minimal) set of distinct generators of $G$. A special die, which randomly selects one of the elements $g_1,g_2,\dots,g_k$ with equal probability, is rolled $m$ times and the selected elements are multiplied to produce an element $g \in G$. Prove that there exists a real number $b \in (0,1)$ such that $\lim_{m \to \infty} \frac{1}{b^{2m}} \sum_{x \in G} (\text{Prob}(g=x)-\frac{1}{n})^2$ is positive and finite.
-/