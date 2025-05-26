import Mathlib

open Set Nat Polynomial

-- fun p ↦ ∃ᵉ (B > 0) (o : Equiv.Perm (Fin 5)), ∀ i, dist (p (o i)) (p (o (i + 1))) = B

/--
Prove that the optimal configuration of 5 (not necessarily distinct) points $p_1, \dots, p_5$ on the unit circle which maximizes the sum of the ten distances \[\Sigma_{i < j}, d(p_i, p_j) \] is the one which evenly spaces the points like a regular pentagon.
-/