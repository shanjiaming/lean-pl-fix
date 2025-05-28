theorem h₂ (p : ℝ → Prop) (hp :  ∀ (c : ℝ),    p c ↔      ∀ (P : ℝ[X]),        P.degree = 3 →          (∃ x ∈ Icc 0 1, eval x P = 0) → ∫ (x : ℝ) in 0 ..1, |eval x P| ≤ c * sSup {y | ∃ x ∈ Icc 0 1, y = |eval x P|}) (h₀ : p (5 / 6)) (h₁ : ∀ (c : ℝ), p c → 5 / 6 ≤ c) : IsLeast p (5 / 6) := by
  refine' ⟨h₀, fun c hc => _⟩
  exact h₁ c hc
  hole