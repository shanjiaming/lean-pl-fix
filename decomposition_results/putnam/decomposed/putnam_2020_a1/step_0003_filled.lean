theorem h₁  : {x | 2020 ∣ x ∧ Nat.log 10 x + 1 ≤ 2020 ∧ ∃ k l, k ≥ l ∧ x = ∑ i ∈ Finset.range (k - l + 1), 10 ^ (i + l)} =
    Set.Icc 1 10 ^ 2019 ∩ {x | 2020 ∣ x} ∩ {x | ∃ k l, k ≥ l ∧ x = ∑ i ∈ Finset.range (k - l + 1), 10 ^ (i + l)} :=
  by
  --  apply Set.Subset.antisymm
  --  · intro x hx
    have h₁ : (2020 ∣ x) := hx.1
    have h₂ : (Nat.log 10 x) + 1 ≤ 2020 := hx.2.1
    have h₃ : ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l) := hx.2.2
    have h₄ : x ≥ 1 := by sorry
    have h₅ : x ≤ 10 ^ 2019 := by sorry
  --    exact ⟨⟨h₄, h₅⟩, h₁, h₃⟩
  --  · intro x hx
    have h₁ : x ≥ 1 := hx.1.1
    have h₂ : x ≤ 10 ^ 2019 := hx.1.2
    have h₃ : 2020 ∣ x := hx.2.1
    have h₄ : ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l) := hx.2.2
    have h₅ : (Nat.log 10 x) + 1 ≤ 2020 := by
      have h₅₁ : x ≤ 10 ^ 2019 := h₂
      have h₅₂ : Nat.log 10 x ≤ 2019 := by
        by_contra h₅₂
        have h₅₃ : Nat.log 10 x ≥ 2020 := by omega
        have h₅₄ : x ≥ 10 ^ 2020 :=
          by
          have h₅₅ : 10 ^ (Nat.log 10 x) ≤ x := by apply Nat.pow_log_le_self <;> omega
          have h₅₆ : 10 ^ (Nat.log 10 x) ≥ 10 ^ 2020 := by apply Nat.pow_le_pow_of_le_right <;> norm_num <;> omega
          omega
        have h₅₅ : x < 10 ^ 2020 := by
          have h₅₅₁ : x ≤ 10 ^ 2019 := h₂
          have h₅₅₂ : 10 ^ 2019 < 10 ^ 2020 := by apply Nat.pow_lt_pow_of_lt_right <;> norm_num
          omega
        omega
      omega
    exact ⟨h₃, h₅, h₄⟩
  hole