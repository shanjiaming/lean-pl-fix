import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Show that for any natural number $n \in \mathbb{N}$, $3 \mid n^3 + 2n$ .-/
theorem induction_divisibility_3divnto3m2n (n : ℕ) : 3 ∣ n ^ 3 + 2 * n := by
  -- We'll prove this by induction on n. The induction principle for natural numbers
  -- requires us to prove a base case (n = 0) and an inductive step (if it holds for n, it holds for n+1)
  induction n with
  | zero => 
    -- Base case: n = 0
    -- We need to show 3 divides 0^3 + 2*0 = 0
    -- Any number divides 0, so this is trivial
    simp only [Nat.zero_eq, pow_zero, zero_add, mul_zero]  -- Simplify all terms to 0
    exact dvd_zero 3  -- 3 divides 0 is true by definition
  | succ n ih => 
    -- Inductive step: assume 3 divides n^3 + 2n (induction hypothesis ih)
    -- and prove it for (n+1)^3 + 2(n+1)
    -- First expand (n+1)^3 + 2(n+1) using binomial theorem
    rw [succ_eq_add_one, add_pow, add_mul]
    -- Now we have: n³ + 3n² + 3n + 1 + 2n + 2
    -- Combine like terms: n³ + 2n + 3n² + 3n + 3
    rw [add_assoc, add_comm (2 * n) (3 * n ^ 2 + 3 * n + 3), ←add_assoc]
    -- Now we can write it as (n³ + 2n) + (3n² + 3n + 3)
    -- The first term is divisible by 3 by induction hypothesis
    -- The second term is clearly divisible by 3 since all coefficients are multiples of 3
    -- Use the theorem that if a divides x and a divides y, then a divides x + y
    apply dvd_add
    · exact ih  -- n³ + 2n is divisible by 3 by induction hypothesis
    · -- Show 3 divides 3n² + 3n + 3
      -- Factor out 3 from the expression: 3(n² + n + 1)
      rw [mul_add, mul_add, ←mul_assoc, ←mul_assoc, ←mul_assoc]
      -- Now we have 3 * (n² + n + 1), which is clearly divisible by 3
      exact dvd_mul_right 3 (n ^ 2 + n + 1)