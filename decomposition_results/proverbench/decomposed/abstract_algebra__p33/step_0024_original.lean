theorem h_rev (P : ℝ[X]) (h_imp : (∃ n, P = 16 * (X /ₘ 4) ^ n) → ∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) : P ≠ 0 → (∀ (x : ℝ), 16 * eval (x ^ 2) P = eval (2 * x) P ^ 2) → ∃ n, P = 16 * (X /ₘ 4) ^ n :=
  by
  intro hP h
  have h₁ : P.degree ≠ ⊥ := by sorry
  have h₂ : ∃ n : ℕ, P = (16 : Polynomial ℝ) * (Polynomial.X /ₘ (4 : Polynomial ℝ)) ^ n := by sorry
  exact h₂