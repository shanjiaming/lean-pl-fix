theorem h_main (P : Polynomial ℤ) (m : ℤ) (h_div : ∀ (x : ℤ), m ∣ Polynomial.eval x P) : m ∣ ↑P.natDegree.factorial * P.leadingCoeff :=
  by
  --  by_cases hP : P = 0
  --  · subst_vars
  --    simp
  ·
    have h₁ : m ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by sorry
  --    exact_mod_cast h₁
  hole