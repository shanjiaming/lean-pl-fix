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
  rw [← h₁, pow_mod]
  
  -- Now we focus on simplifying 4^2000 modulo 5
  -- Notice that 4 and 5 are coprime, so we can apply Euler's theorem
  -- Euler's totient function φ(5) = 4, so 4^4 ≡ 1 mod 5
  have h₂ : 4 ^ 4 % 5 = 1 := by norm_num
  
  -- We can express 2000 as 4 * 500, since 2000 ÷ 4 = 500
  have h₃ : 2000 = 4 * 500 := by norm_num
  
  -- Rewrite the exponent using this decomposition
  rw [h₃, pow_mul]
  
  -- Now we have (4^4)^500 ≡ 1^500 ≡ 1 mod 5
  rw [pow_mod, h₂, one_pow]
  
  -- The remainder is now clearly 1
  rfl