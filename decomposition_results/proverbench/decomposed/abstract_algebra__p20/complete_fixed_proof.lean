theorem leading_coefficient_divisibility (h_div : ∀ x : ℤ, m ∣ P.eval x) :
  m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff:=
  by
  have h_main : m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff:=
    by
    --  by_cases hP : P = 0
    --  · subst_vars
    --    simp
    ·
      have h₁ : m ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff:=
        by
        have h₂ : ∀ x : ℤ, m ∣ P.eval x := h_div
        have h₃ : P ≠ 0 := hP
        have h₄ : (m : ℤ) ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff:=
          by
          have h₅ :
            (m : ℤ) ∣
              (∑ i in Finset.range (P.natDegree + 1),
                (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ)) := by sorry
          have h₇ :
            (∑ i in Finset.range (P.natDegree + 1),
                (-1 : ℤ) ^ (P.natDegree - i) * (Nat.choose P.natDegree i : ℤ) * P.eval (i : ℤ)) =
              (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by sorry
          --  rw [h₇] at h₅
          --  exact h₅
          hole
        --  exact_mod_cast h₄
        simpa
    --    exact_mod_cast h₁
    hole
  --  exact h_main
  simpa