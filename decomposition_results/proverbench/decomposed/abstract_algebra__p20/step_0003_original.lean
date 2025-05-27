theorem h₁ (P : Polynomial ℤ) (m : ℤ) (h_div : ∀ (x : ℤ), m ∣ Polynomial.eval x P) (hP : ¬P = 0) : m ∣ ↑P.natDegree.factorial * P.leadingCoeff :=
  by
  have h₂ : ∀ x : ℤ, m ∣ P.eval x := h_div
  have h₃ : P ≠ 0 := hP
  have h₄ : (m : ℤ) ∣ (Nat.factorial P.natDegree : ℤ) * P.leadingCoeff := by sorry
  exact_mod_cast h₄