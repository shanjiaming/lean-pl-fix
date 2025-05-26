theorem h_pos_n (n : ℕ) (hn : n > 1) (a : Fin n → ℝ) (A : ℝ) (hA : A + ∑ i, a i ^ 2 < 1 / ((↑n : ℝ) - 1) * (∑ i, a i) ^ 2) : (↑n : ℝ) - 1 > 0 :=
  by
  have h₁ : (n : ℝ) ≥ 2 := by sorry
  --  linarith
  linarith