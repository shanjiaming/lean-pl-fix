import Mathlib

open Polynomial

/--
Let $p$ be a prime number greater than 5. Let $f(p)$ denote the number of infinite sequences $a_1, a_2, a_3, \dots$ such that $a_n \in \{1, 2, \dots, p-1\}$ and $a_n a_{n+2} \equiv 1 + a_{n+1} \pmod{p}$ for all $n \geq 1$. Prove that $f(p)$ is congruent to 0 or 2 $\pmod{5}$.
-/