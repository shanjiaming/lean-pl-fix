theorem h₄ (x : ℕ) (hx : x ∈ {x | 2020 ∣ x ∧ Nat.log 10 x + 1 ≤ 2020 ∧ ∃ k l, k ≥ l ∧ x = ∑ i ∈ Finset.range (k - l + 1), 10 ^ (i + l)}) (h₁ : 2020 ∣ x) (h₂ : Nat.log 10 x + 1 ≤ 2020) (h₃ : ∃ k l, k ≥ l ∧ x = ∑ i ∈ Finset.range (k - l + 1), 10 ^ (i + l)) : x ≥ 1 := by
  --  by_contra h
  have h₅ : x = 0 := by sorry
  --  rw [h₅] at h₁ h₂ h₃
  --  --  --  norm_num at h₁ h₂ h₃ <;> simp_all [Finset.sum_range_succ, Nat.div_eq_of_lt] <;> omega
  hole