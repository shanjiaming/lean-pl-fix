theorem putnam_2020_a1 :
  Set.ncard
      {x : ℕ |
        (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l))} =
    ((508536) : ℕ):=
  by
  have h_main :
    Set.ncard
        {x : ℕ |
          (2020 ∣ x) ∧ (Nat.log 10 x) + 1 ≤ 2020 ∧ (∃ k l, k ≥ l ∧ x = ∑ i in Finset.range (k - l + 1), 10 ^ (i + l))} =
      508536 := by sorry
  --  rw [h_main] <;> norm_num
  linarith