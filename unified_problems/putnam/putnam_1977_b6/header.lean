import Mathlib

open RingHom Set Nat Filter Topology

/--
Let $G$ be a group and $H$ be a subgroup of $G$ with $h$ elements. Suppose that $G$ contains some element $a$ such that $(xa)^3 = 1$ for all $x \in H$ (here $1$ represents the identity element of $G$). Let $P$ be the subset of $G$ containing all products of the form $x_1 a x_2 a \cdots x_n a$ with $n \ge 1$ and $x_i \in H$ for all $i \in \{1, 2, \dots, n\}$. Prove that $P$ is a finite set and contains no more than $3h^2$ elements.
-/