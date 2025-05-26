import Mathlib

open Filter Topology Real Nat

/--
For a positive real number $\alpha$, define \[ S(\alpha) = \{ \lfloor n\alpha \rfloor : n = 1,2,3,\dots \}. \] Prove that $\{1,2,3,\dots\}$ cannot be expressed as the disjoint union of three sets $S(\alpha), S(\beta)$ and $S(\gamma)$. [As usual, $\lfloor x \rfloor$ is the greatest integer $\leq x$.]
-/