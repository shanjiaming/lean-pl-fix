import Mathlib
import Aesop

set_option maxHeartbeats 0

open BigOperators Real Nat Topology Rat

/-- How many positive three-digit integers are congruent to $7 \pmod{19}?$ Show that it is 48.-/
theorem mathd_numbertheory_155 :
  Finset.card (Finset.filter (fun x => x % 19 = 7) (Finset.Icc 100 999)) = 48 := by
  -- First, we'll compute the range of three-digit numbers (100 to 999)
  -- Then we'll find all numbers in this range congruent to 7 mod 19
  -- Finally, we'll count them and show there are exactly 48

  -- Let's define the set of all three-digit numbers
  let threeDigitNumbers := Finset.Icc 100 999

  -- The numbers congruent to 7 mod 19 can be expressed as 19k + 7
  -- We need to find all k such that 19k + 7 is a three-digit number

  -- First, find the smallest three-digit number ≡ 7 mod 19
  -- Solve 19k + 7 ≥ 100 => 19k ≥ 93 => k ≥ 93/19 ≈ 4.894
  -- So the smallest integer k is 5
  -- Check: 19*5 + 7 = 95 + 7 = 102 (which is a three-digit number)

  -- Now find the largest three-digit number ≡ 7 mod 19
  -- Solve 19k + 7 ≤ 999 => 19k ≤ 992 => k ≤ 992/19 ≈ 52.210
  -- So the largest integer k is 52
  -- Check: 19*52 + 7 = 988 + 7 = 995 (which is a three-digit number)

  -- Therefore, k ranges from 5 to 52 inclusive
  -- The count of numbers is 52 - 5 + 1 = 48

  -- Now let's prove this formally in Lean

  -- First, show that numbers ≡7 mod19 in [100,999] are exactly {19k+7 | k ∈ [5,52]}
  have h_range : ∀ x ∈ Finset.Icc 100 999, x % 19 = 7 ↔ ∃ k ∈ Finset.Icc 5 52, x = 19 * k + 7 := by
    intro x hx
    constructor
    · -- Forward direction: if x ≡7 mod19, then x = 19k+7 for some k∈[5,52]
      intro hmod
      -- Since x ≡7 mod19, x = 19k + 7 for some integer k
      have ⟨k, hk⟩ : ∃ k : ℤ, x = 19 * k + 7 := by existsi (x - 7)/19; ring
      -- We need to show k is between 5 and 52
      have hk_lb : 5 ≤ k := by
        -- From x ≥ 100 and x = 19k + 7, we get k ≥ (100-7)/19 ≈ 4.894
        -- Since k must be integer, k ≥ 5
        rw [hk] at hx
        have := (Finset.mem_Icc.mp hx).1
        linarith
      have hk_ub : k ≤ 52 := by
        -- From x ≤ 999 and x = 19k + 7, we get k ≤ (999-7)/19 ≈ 52.210
        rw [hk] at hx
        have := (Finset.mem_Icc.mp hx).2
        linarith
      -- Now show k is in the range and x has the required form
      refine ⟨k.toNat, ?_, ?_⟩
      · -- Show k ∈ [5,52]
        simp [Finset.mem_Icc, hk_lb, hk_ub]
      · -- Show x = 19*k + 7
        rw [hk, Int.toNat_of_nonneg (by linarith)]
    · -- Reverse direction: if x = 19k+7 for k∈[5,52], then x≡7 mod19
      rintro ⟨k, hk, rfl⟩
      simp only [add_comm, mul_comm, Nat.add_mod, Nat.mod_mod, mul_mod_right, zero_add]

  -- Now rewrite the original goal using this characterization
  simp_rw [Finset.filter_congr h_range]

  -- The filtered set is now equivalent to mapping (fun k => 19*k + 7) over Icc 5 52
  -- Since 19k+7 is injective, the cardinality equals that of Icc 5 52
  rw [Finset.card_map, Finset.card_Icc]

  -- The cardinality of Icc 5 52 is 52 - 5 + 1 = 48
  norm_num