import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Find the modulo $7$ remainder of the sum $1+3+5+7+9+\dots+195+197+199.$ Show that it is 4.-/
theorem mathd_numbertheory_109 (v : ℕ → ℕ) (h₀ : ∀ n, v n = 2 * n - 1) :
    (∑ k in Finset.Icc 1 100, v k) % 7 = 4 := by
  -- First, simplify the goal using the given definition of v
  simp [h₀]
  
  -- The sum becomes ∑(k=1 to 100) (2k - 1)
  -- We can split this into two separate sums:
  -- 2 * ∑(k=1 to 100) k - ∑(k=1 to 100) 1
  rw [Finset.sum_sub_distrib, Finset.sum_mul]
  
  -- Simplify known sums:
  -- ∑(k=1 to 100) k = 100*101/2 = 5050
  -- ∑(k=1 to 100) 1 = 100
  rw [Finset.sum_range_id, Finset.sum_const, Finset.card_range, smul_eq_mul, mul_one]
  
  -- Now the expression becomes 2 * 5050 - 100 = 10100 - 100 = 10000
  -- So we need to compute 10000 % 7
  
  -- Compute 10000 ÷ 7:
  -- 7 × 1428 = 9996
  -- 10000 - 9996 = 4
  -- Therefore 10000 ≡ 4 mod 7
  
  -- We can verify this computation in Lean:
  have h₁ : (2 * 5050 - 100) = 10000 := by norm_num
  rw [h₁]
  
  -- Compute 10000 % 7 directly
  norm_num