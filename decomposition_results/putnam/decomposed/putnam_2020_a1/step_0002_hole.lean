theorem h_main  : {x | 2020 ∣ x ∧ Nat.log 10 x + 1 ≤ 2020 ∧ ∃ k l, k ≥ l ∧ x = ∑ i ∈ Finset.range (k - l + 1), 10 ^ (i + l)}.ncard =
    508536 :=
  by
  have h₁ :
    {x : ℕ |
        (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l))} =
      Set.Icc 1 10 ^ 2019 ∩ {x : ℕ | 2020 ∣ x} ∩
        {x : ℕ | ∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l)} := by sorry
  --  rw [h₁]
  rw [Set.ncard_eq_toFinset_card]
  rfl
  hole