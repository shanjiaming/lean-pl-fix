theorem leading_coefficient_divisibility (P : Polynomial ℤ) (m : ℤ) (h_div : ∀ (x : ℤ), m ∣ Polynomial.eval x P) : m ∣ ↑P.natDegree.factorial * P.leadingCoeff :=
  by
  have h_main : m ∣ Nat.factorial (P.natDegree) * P.leadingCoeff := by sorry
  exact h_main