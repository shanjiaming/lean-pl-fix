theorem h₀ (p : ℝ → Prop) (hp :  ∀ (c : ℝ),    p c ↔      ∀ (P : ℝ[X]),        P.degree = 3 →          (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) : p (5 / 6) := by
  rw [hp]
  intro P h_deg h_root
  have h₁ : ∫ x in (0)..1, |P.eval x| ≤ (5 / 6 : ℝ) * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|}) := by sorry
  exact h₁