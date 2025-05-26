import Mathlib

-- {v : Mathlib.Vector ℤ 2 | ∃ b : ℤ, 0 ≤ b ∧ b ≤ 100 ∧ Even b ∧ v.toList = [1, b]}
/--
Let $\mathcal{P}$ be the set of vectors defined by $\mathcal{P}=\left\{\left.\begin{pmatrix} a \\ b \end{pmatrix}\right| 0 \leq a \leq 2, 0 \leq b \leq 100,\text{ and }a,b \in \mathbb{Z}\right\}$. Find all $\mathbf{v} \in \mathcal{P}$ such that the set $\mathcal{P} \setminus \{\mathbf{v}\}$ obtained by omitting vector $\mathbf{v}$ from $\mathcal{P}$ can be partitioned into two sets of equal size and equal sum.
-/