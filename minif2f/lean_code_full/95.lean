import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- If $a * b = a^b + b^a$, for all positive integer values of $a$ and $b$, then what is the value of $2 * 6$? Show that it is 100.-/
theorem mathd_algebra_15 (s : ℕ → ℕ → ℕ)
    (h₀ : ∀ a b, 0 < a ∧ 0 < b → s a b = a ^ (b : ℕ) + b ^ (a : ℕ)) : s 2 6 = 100 := by
  -- First, we need to compute s 2 6 using the given definition
  -- The hypothesis h₀ tells us how s is defined for positive a and b
  -- We'll apply this hypothesis with a = 2 and b = 6
  
  -- Step 1: Prove that 2 and 6 are positive
  have h_pos : 0 < 2 ∧ 0 < 6 := by
    -- Both 0 < 2 and 0 < 6 are true by definition
    -- We can prove this using the `simp` tactic which simplifies basic arithmetic
    simp only [zero_lt_two, zero_lt_succ]
  
  -- Step 2: Apply the hypothesis h₀ with a = 2 and b = 6
  -- This will give us the equation for s 2 6
  have h_eq := h₀ 2 6 h_pos
  -- Now h_eq states: s 2 6 = 2^6 + 6^2
  
  -- Step 3: Compute 2^6 and 6^2
  -- First, let's compute 2^6
  have h_two_pow_six : (2:ℕ)^6 = 64 := by
    -- We can compute this step by step:
    -- 2^6 = 2^(5+1) = 2^5 * 2
    -- Continuing this way until we reach base case
    -- But in Lean, we can just use norm_num which can compute concrete numbers
    norm_num
  
  -- Now compute 6^2
  have h_six_pow_two : (6:ℕ)^2 = 36 := by
    -- Similarly, 6^2 = 6 * 6 = 36
    norm_num
  
  -- Step 4: Combine the results
  -- From h_eq, we know s 2 6 = 2^6 + 6^2
  -- We've computed both terms, so let's substitute them
  rw [h_eq, h_two_pow_six, h_six_pow_two]
  -- Now the goal is 64 + 36 = 100
  
  -- Step 5: Compute the final sum
  -- We can use norm_num again to verify the addition
  norm_num