import Mathlib

open Topology Filter Nat

-- (1, 9, 8, 4, 25)
/--
Let $R$ be the region consisting of all triples $(x,y,z)$ of nonnegative real numbers satisfying $x+y+z \leq 1$. Let $w=1-x-y-z$. Express the value of the triple integral $\iiint_R x^1y^9z^8w^4\,dx\,dy\,dz$ in the form $a!b!c!d!/n!$, where $a$, $b$, $c$, $d$, and $n$ are positive integers.
-/