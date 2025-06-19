import Mathlib

open Set Nat

-- {f : Polynomial ℝ | ∃ d : ℕ, ∃ c ≥ (1 : ℤ) - d, ∀ n : ℝ, f.eval n = (1 / 9) * ((10 ^ c) * (9 * n + 1) ^ d - 1)}
/--
A \emph{repunit} is a positive integer whose digits in base 10 are all ones. Find all polynomials $f$ with real coefficients such that if $n$ is a repunit, then so is $f(n)$.
-/