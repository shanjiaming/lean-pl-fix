theorem putnam_2016_a6 (p : ℝ → Prop) (hp :  ∀ (c : ℝ),    p c ↔      ∀ (P : ℝ[X]),        P.degree = 3 →          (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) : IsLeast p (5 / 6) :=
  by
  have h₀ : p (5 / 6) := by sorry
  have h₁ : ∀ c, p c → (5 / 6 : ℝ) ≤ c := by sorry
  have h₂ : IsLeast p ((5 / 6) : ℝ) := by sorry
  apply h₂