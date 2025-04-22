import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- The square root of $t$ is greater than $2$ and less than $3.5$. How many integer values of $t$ satisfy this condition? Show that it is 8.-/
theorem mathd_algebra_224 (S : Finset ℕ)
  (h₀ : ∀ n : ℕ, n ∈ S ↔ Real.sqrt n < 7 / 2 ∧ 2 < Real.sqrt n) : S.card = 8 := by
  -- First, we rewrite the condition in terms of n rather than sqrt(n)
  -- The inequalities sqrt(n) < 3.5 and 2 < sqrt(n) become n < 12.25 and 4 < n when squared
  have h₁ : ∀ n : ℕ, n ∈ S ↔ 4 < n ∧ n < (7/2)^2 := by
    intro n
    rw [h₀]
    -- Convert the sqrt conditions to conditions on n
    constructor
    · intro ⟨h_lt, h_gt⟩
      -- For the left inequality: 2 < sqrt(n) → 4 < n
      rw [← sqrt_lt_sqrt_iff (by norm_num)] at h_gt
      rw [sqrt_four] at h_gt
      · exact ⟨h_gt, (sq_lt.mpr h_lt).trans_le (by norm_num)⟩
      · exact le_of_lt (lt_trans (by norm_num) h_gt)
    · intro ⟨h_gt, h_lt⟩
      -- For the right inequality: n < 12.25 → sqrt(n) < 3.5
      rw [← sqrt_lt_sqrt_iff (by norm_num)] at h_lt
      rw [sqrt_sq (by norm_num : 0 ≤ 7/2)] at h_lt
      · exact ⟨h_lt, lt_trans (by norm_num) (sqrt_lt.mpr ⟨by norm_num, h_gt⟩)⟩
      · exact le_of_lt (lt_trans (by norm_num) h_gt)

  -- Compute (7/2)^2 to get the exact upper bound
  have h₂ : (7/2 : ℝ)^2 = 49/4 := by norm_num
  have h₃ : (49/4 : ℝ) = 12.25 := by norm_num

  -- Now we can rewrite the condition using exact values
  have h₄ : ∀ n : ℕ, n ∈ S ↔ 4 < n ∧ n ≤ 12 := by
    intro n
    rw [h₁]
    rw [h₂]
    rw [h₃]
    -- The upper bound is n < 12.25, which for natural numbers is equivalent to n ≤ 12
    constructor
    · intro ⟨h_gt, h_lt⟩
      exact ⟨h_gt, lt_iff_le_and_ne.mp h_lt |>.left⟩
    · intro ⟨h_gt, h_le⟩
      exact ⟨h_gt, lt_of_le_of_lt h_le (by norm_num)⟩

  -- The set S is now clearly the natural numbers strictly between 4 and 12
  -- Let's explicitly construct this set
  have h₅ : S = {5, 6, 7, 8, 9, 10, 11, 12} := by
    ext n
    rw [h₄]
    -- Prove equivalence by checking all cases
    simp only [Finset.mem_insert, Finset.mem_singleton]
    constructor
    · intro ⟨h_gt, h_le⟩
      -- n must be one of 5 through 12
      interval_cases n
      all_goals simp
    omega
  rw [h₅]
  -- The cardinality is 8 as claimed
  simp