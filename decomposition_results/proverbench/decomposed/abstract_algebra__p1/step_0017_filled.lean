theorem h₂₇ (P : Polynomial ℤ) (z : ℤ) (hz : Polynomial.eval z P = 0) (a b c : ℤ) (hab : a ≠ b) (hbc : b ≠ c) (hac : a ≠ c) (hP_a : Polynomial.eval a P = 1) (hP_b : Polynomial.eval b P = -1) (hP_c : Polynomial.eval c P = 1) (h₁₁ : a - z ∣ 1) (h₁₂ : Polynomial.eval a P - Polynomial.eval z P = 1) (h₁₄ : (a - z).natAbs ∣ Int.natAbs 1) (h₁₆ : (a - z).natAbs ∣ 1) (h₁₇ h₂₆ : (a - z).natAbs = 1) : a - z = 1 ∨ a - z = -1 := by
  --  rw [Int.natAbs_eq_iff] at h₂₆
  --  tauto
  omega