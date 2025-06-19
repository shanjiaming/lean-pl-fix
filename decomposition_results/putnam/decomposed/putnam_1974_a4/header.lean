import Mathlib

open Set Nat

-- (fun n ↦ (1 : ℚ) / (2 ^ (n - 1)) * (n * (n - 1).choose ⌊n / 2⌋₊))

/--
Evaluate in closed form: $\frac{1}{2^{n-1}} \sum_{k < n/2} (n-2k)*{n \choose k}$.
-/