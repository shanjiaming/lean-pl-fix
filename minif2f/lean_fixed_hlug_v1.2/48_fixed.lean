import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- Cards are numbered from 1 to 100. One card is removed and the values on the other 99 are added. 
    The resulting sum is a multiple of 77. What number was on the card that was removed? 
    Show that it is 45.-/
theorem mathd_numbertheory_257 (x : ℕ) (h₀ : 1 ≤ x ∧ x ≤ 100)
    (h₁ : 77 ∣ (∑ k in Finset.range 101, k) - x) : x = 45 := by
  -- First, compute the sum of all numbers from 1 to 100 using the arithmetic series formula
  have sum_all : ∑ k in Finset.range 101, k = 100 * 101 / 2 := by
    rw [Finset.sum_range_id]  -- Convert range sum to closed form
  have sum_all_value : ∑ k in Finset.range 101, k = 5050 := by
    rw [sum_all]
  have h₁' : 77 ∣ 5050 - x := by rwa [sum_all_value] at h₁

  -- We need to find x ∈ [1,100] such that 5050 - x ≡ 0 mod 77
  -- First compute 5050 mod 77
  have mod_calc : 5050 % 77 = 45 := by norm_num

  -- From 77 ∣ 5050 - x, we have x ≡ 5050 mod 77
  have x_mod : x ≡ 45 [MOD 77] := by
    rw [Nat.modEq_iff_dvd']
    exact h₁'
    rw [mod_calc]

  -- Since 1 ≤ x ≤ 100, and x ≡ 45 mod 77, the only possible value is x = 45
  -- Because the next congruent number would be 45 + 77 = 122 > 100
  -- And previous would be 45 - 77 = -32 < 1
  omega
  -- Substitute x = 77k + 45 into the bounds