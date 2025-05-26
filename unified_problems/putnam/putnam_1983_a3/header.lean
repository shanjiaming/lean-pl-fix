import Mathlib

/--
Let $p$ be in the set $\{3,5,7,11,\dots\}$ of odd primes and let $F(n)=1+2n+3n^2+\dots+(p-1)n^{p-2}$. Prove that if $a$ and $b$ are distinct integers in $\{0,1,2,\dots,p-1\}$ then $F(a)$ and $F(b)$ are not congruent modulo $p$, that is, $F(a)-F(b)$ is not exactly divisible by $p$.
-/