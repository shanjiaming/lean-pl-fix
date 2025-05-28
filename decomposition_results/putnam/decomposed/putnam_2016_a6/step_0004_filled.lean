theorem h₁ (p : ℝ → Prop) (hp :  ∀ (c : ℝ),    p c ↔      ∀ (P : ℝ[X]),        P.degree = 3 →          (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) (h₀ : p (5 / 6)) : ∀ (c : ℝ), p c → 5 / 6 ≤ c := by
  intro c hc
  by_contra h
  have h₂ : c < 5 / 6 := by sorry
  have h₃ : ¬p c := by sorry
  exact h₃ hc
  hole