import Mathlib

open  Real Equiv

-- {(0, 0, 0), (0, -1, 1), (1, 0, -1), (-1, 1, 0)}
/--
Prove that there are only a finite number of possibilities for the ordered triple $T=(x-y,y-z,z-x)$, where $x,y,z$ are complex numbers satisfying the simultaneous equations
\[
x(x-1)+2yz = y(y-1)+2zx = z(z-1)+2xy,
\]
and list all such triples $T$.
-/