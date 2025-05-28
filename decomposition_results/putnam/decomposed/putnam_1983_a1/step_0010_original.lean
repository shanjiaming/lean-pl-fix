theorem h₄ (h₂ : {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} = Set.Icc 1 (20 ^ 30) ∩ {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}) (h₃ : (Set.Icc 1 (20 ^ 30) ∩ {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}).Finite) : (Set.Icc 1 (20 ^ 30) ∩ {n | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}).encard = 2301 :=
  by
  rw [Set.encard_eq_toNat_card (Set.toFinite _)]
  rw [show
      (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} : Set ℤ) =
        (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)})
      by rfl]
  rfl