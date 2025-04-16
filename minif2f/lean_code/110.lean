import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- How many integers are in the solution of the inequality $|x + 4|< 9$? Show that it is 17.-/
theorem mathd_algebra_185 (s : Finset ℤ) (f : ℤ → ℤ) (h₀ : ∀ x, f x = abs (x + 4))
  (h₁ : ∀ x, x ∈ s ↔ f x < 9) : s.card = 17 := by
  -- First, we simplify the goal using the given hypotheses
  -- The set s is defined as all integers x where |x + 4| < 9
  -- So we need to count how many integers satisfy this inequality

  -- Rewrite the membership condition using h₀ and h₁
  have mem_iff : ∀ x, x ∈ s ↔ abs (x + 4) < 9 := by
    intro x
    rw [h₁, h₀]
  
  -- The inequality |x + 4| < 9 is equivalent to -9 < x + 4 < 9
  -- Which can be rewritten as -13 < x < 5
  have ineq_equiv : ∀ x : ℤ, abs (x + 4) < 9 ↔ x > -13 ∧ x < 5 := by
    intro x
    rw [abs_lt]
    constructor <;> intro h
    · constructor
      · linarith
      · linarith
    · constructor <;> linarith
  
  -- Now we can characterize the set s as all integers between -12 and 4 inclusive
  have s_eq : s = (Finset.Icc (-12) 4) := by
    ext x
    rw [Finset.mem_Icc, mem_iff, ineq_equiv]
    -- For integers, -13 < x < 5 is equivalent to -12 ≤ x ≤ 4
    constructor
    · intro h
      exact ⟨Int.le_of_lt_add_one (by linarith), Int.lt_add_one_iff.mp h.2⟩
    · intro h
      exact ⟨by linarith, by linarith⟩
  
  -- Calculate the cardinality of the interval [-12, 4]
  -- The number of integers from a to b inclusive is b - a + 1
  have card_calc : (Finset.Icc (-12) 4).card = 4 - (-12) + 1 := by
    rw [Finset.card_Icc]
    simp only [ge_iff_le, add_sub_cancel]
  
  -- Simplify the cardinality calculation
  have card_simp : 4 - (-12) + 1 = 17 := by norm_num
  
  -- Combine all the results to prove the theorem
  rw [s_eq, card_calc, card_simp]