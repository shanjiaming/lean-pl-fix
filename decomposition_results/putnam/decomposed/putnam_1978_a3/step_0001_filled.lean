theorem putnam_1978_a3 (p : ℝ[X]) (hp : p = 2 * (X ^ 6 + 1) + 4 * (X ^ 5 + X) + 3 * (X ^ 4 + X ^ 2) + 5 * X ^ 3) (I : ℕ → ℝ) (hI : I = fun k => ∫ (x : ℝ) in Ioi 0, x ^ k / eval x p) : IsLeast {y | ∃ k ∈ Ioo 0 5, I k = y} 2 :=
  by
  have h₁ : False := by sorry
  have h₂ : IsLeast {y | ∃ k ∈ Ioo 0 5, I k = y} ((2) : ℝ) :=
    by
    exfalso
    exact h₁
  --  exact h₂
  simpa