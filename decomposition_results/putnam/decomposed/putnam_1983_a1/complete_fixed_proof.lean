theorem putnam_1983_a1 : {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = ((2301) : ℕ):=
  by
  have h_main : {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = (2301 : ℕ):=
    by
    have h₁ : {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)}.encard = (2301 : ℕ):=
      by
      have h₂ :
        {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} = Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} := by sorry
      --  rw [h₂]
      have h₃ : (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} : Set ℤ).Finite:=
        by
        --  apply Set.Finite.subset (Set.finite_Icc _ _)
        --  intro x hx
        --  --  simp_all [Set.mem_Icc, Set.mem_setOf_eq] <;> omega
        hole
      have h₄ : (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} : Set ℤ).encard = 2301:=
        by
        --  rw [Set.encard_eq_toNat_card (Set.toFinite _)]
        rw [show
            (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)} : Set ℤ) =
              (Set.Icc 1 (20 ^ 30) ∩ {n : ℤ | n > 0 ∧ (n ∣ 10 ^ 40 ∨ n ∣ 20 ^ 30)})
            by rfl]
        rfl
        hole
      simpa using h₄
      hole
    --  exact h₁
    hole
  --  exact h_main
  hole