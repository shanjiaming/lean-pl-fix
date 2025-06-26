import Mathlib

-- 508536
/--
Find the number of positive integers $N$ satisfying: (i) $N$ is divisible by $2020$, (ii) $N$ has at most $2020$ decimal digits, (iii) The decimal digits of $N$ are a string of consecutive ones followed by a string of consecutive zeros.
-/
theorem putnam_2020_a1
: Set.ncard {x : ℕ | (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l))} = ((508536) : ℕ ) := by
  have h_main : Set.ncard {x : ℕ | (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l))} = 508536 := by
    have h₁ : {x : ℕ | (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l))} = Set.Icc 1 10^2019 ∩ {x : ℕ | 2020 ∣ x} ∩ {x : ℕ | ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l)} := by
      apply Set.Subset.antisymm
      · -- Prove the forward inclusion
        intro x hx
        have h₁ : (2020 ∣ x) := hx.1
        have h₂ : (Nat.log 10 x) + 1 ≤ 2020 := hx.2.1
        have h₃ : ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l) := hx.2.2
        have h₄ : x ≥ 1 := by
          by_contra h
          have h₅ : x = 0 := by omega
          rw [h₅] at h₁ h₂ h₃
          norm_num at h₁ h₂ h₃
          <;> simp_all [Finset.sum_range_succ, Nat.div_eq_of_lt]
          <;> omega
        have h₅ : x ≤ 10 ^ 2019 := by
          by_contra h
          have h₆ : x > 10 ^ 2019 := by omega
          have h₇ : Nat.log 10 x ≥ 2019 := by
            have h₈ : x ≥ 10 ^ 2019 := by omega
            have h₉ : Nat.log 10 x ≥ 2019 := by
              apply Nat.le_log_of_pow_le
              <;> norm_num
              <;> omega
            exact h₉
          have h₈ : (Nat.log 10 x) + 1 ≥ 2020 := by omega
          omega
        exact ⟨⟨h₄, h₅⟩, h₁, h₃⟩
      · -- Prove the reverse inclusion
        intro x hx
        have h₁ : x ≥ 1 := hx.1.1
        have h₂ : x ≤ 10 ^ 2019 := hx.1.2
        have h₃ : 2020 ∣ x := hx.2.1
        have h₄ : ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k-l+1), 10 ^ (i+l) := hx.2.2
        have h₅ : (Nat.log 10 x) + 1 ≤ 2020 := by
          have h₅₁ : x ≤ 10 ^ 2019 := h₂
          have h₅₂ : Nat.log 10 x ≤ 2019 := by
            by_contra h₅₂
            have h₅₃ : Nat.log 10 x ≥ 2020 := by omega
            have h₅₄ : x ≥ 10 ^ 2020 := by
              have h₅₅ : 10 ^ (Nat.log 10 x) ≤ x := by
                apply Nat.pow_log_le_self
                <;> omega
              have h₅₆ : 10 ^ (Nat.log 10 x) ≥ 10 ^ 2020 := by
                apply Nat.pow_le_pow_of_le_right
                <;> norm_num
                <;> omega
              omega
            have h₅₅ : x < 10 ^ 2020 := by
              have h₅₅₁ : x ≤ 10 ^ 2019 := h₂
              have h₅₅₂ : 10 ^ 2019 < 10 ^ 2020 := by
                apply Nat.pow_lt_pow_of_lt_right
                <;> norm_num
              omega
            omega
          omega
        exact ⟨h₃, h₅, h₄⟩
    rw [h₁]
    -- Use the cardinality of the intersection of the sets
    rw [Set.ncard_eq_toFinset_card]
    -- Use the cardinality of the intersection of the sets
    rfl
  rw [h_main]
  <;> norm_num