import Mathlib

open Set

/--
Let $S(x)$ denote the sequence $\lfloor 0 \rfloor, \lfloor x \rfloor, \lfloor 2x \rfloor, \lfloor 3x \rfloor, \dots$, where $\lfloor x \rfloor$ denotes the greatest integer less than or equal to $x$. Prove that there exist distinct real roots $\alpha$ and $\beta$ of $x^3 - 10x^2 + 29x - 25$ such that infinitely many positive integers appear in both $S(\alpha)$ and $S(\beta)$.
-/