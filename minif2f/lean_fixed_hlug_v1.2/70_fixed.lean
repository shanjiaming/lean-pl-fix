import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- When Rachel divides her favorite number by 7, she gets a remainder of 5. What will the remainder be if she multiplies her favorite number by 5 and then divides by 7? Show that it is 4.-/
theorem mathd_numbertheory_335 (n : ℕ) (h₀ : n % 7 = 5) : 5 * n % 7 = 4 := by
  -- We know n ≡ 5 mod 7 from the hypothesis h₀
  -- We want to compute (5 * n) mod 7
  
  -- First, rewrite n in terms of its remainder when divided by 7
  -- Since n % 7 = 5, we can write n as 7k + 5 for some integer k
  have h₁ : ∃ k, n = 7 * k + 5 := by
    exact mod_eq_iff.mp h₀
  
  -- Let's obtain such a k
  obtain ⟨k, hk⟩ := h₁
  
  -- Now substitute this expression for n into our goal
  rw [hk]
  
  -- Now compute (5 * (7k + 5)) % 7
  -- First distribute the multiplication:
  rw [mul_add, mul_comm 5 (7 * k), mul_assoc]
  
  -- Simplify 7 * k * 5 to 35 * k (though this step isn't strictly necessary)
  rw [← mul_assoc, mul_comm 7 k, mul_assoc]
  
  -- Now we have (35 * k + 25) % 7
  -- We can use the property that (a + b) % m = (a % m + b % m) % m
  rw [add_comm]
  omega
  
  -- Compute 35 % 7 = 0 since 35 is a multiple of 7