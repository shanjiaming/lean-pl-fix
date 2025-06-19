import Mathlib

open Set Nat Polynomial Filter Topology

/--
Let $f : \mathbb{R} \to \mathbb{R}$ be continuous in each variable seperately. Show that there exists a sequence of continuous functions $g_n : \mathbb{R}^2 \to \mathbb{R}$ such that $f(x,y) = \lim_{n \to \infty} g_n(x,y)$ for all $(x,y) \in \mathbb{R}^2$.
-/