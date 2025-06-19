import Mathlib

-- Note: uses (ℕ → (Fin 3 → ℕ)) instead of (Fin (N + 1) → (Fin 3 → ℕ))
/--
Let $S$ be a set of three, not necessarily distinct, positive integers. Show that one can transform $S$ into a set containing $0$ by a finite number of applications of the following rule: Select two of the three integers, say $x$ and $y$, where $x \leq y$ and replace them with $2x$ and $y-x$.
-/