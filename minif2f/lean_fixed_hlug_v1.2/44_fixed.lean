import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- What is the remainder when $1999^{2000}$ is divided by $5?$ Show that it is 1.-/
theorem mathd_numbertheory_236 : 1999 ^ 2000 % 5 = 1 := by
  -- First, we simplify the base 1999 modulo 5
  -- Since 1999 ÷ 5 = 399 with remainder 4, we have 1999 ≡ 4 mod 5
  have h₁ : 1999 % 5 = 4 := by norm_num
  
  -- Using the property that (a ≡ b mod m) → (a^n ≡ b^n mod m),
  -- we can rewrite 1999^2000 ≡ 4^2000 mod 5
  norm_num