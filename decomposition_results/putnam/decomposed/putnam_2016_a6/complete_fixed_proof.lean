theorem putnam_2016_a6 (p : ℝ → Prop)
  (hp :
    ∀ c,
      p c ↔
        ∀ P : Polynomial ℝ,
          P.degree = 3 →
            (∃ x ∈ Icc 0 1, P.eval x = 0) →
              ∫ x in (0)..1, |P.eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|})) :
  IsLeast p ((5 / 6) : ℝ):=
  by
  have h₀ : p (5 / 6):= by
    rw [hp]
    intro P h_deg h_root
    have h₁ : ∫ x in (0)..1, |P.eval x| ≤ (5 / 6 : ℝ) * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|}):= by sorry
      hole
    exact h₁
    hole
  have h₁ : ∀ c, p c → (5 / 6 : ℝ) ≤ c:= by
    intro c hc
    by_contra h
    have h₂ : c < 5 / 6:= by linarith
      hole
    have h₃ : ¬p c:= by
      rw [hp] at hc
      have h₄ :
        ∃ (P : Polynomial ℝ),
          P.degree = 3 ∧
            (∃ x ∈ Icc 0 1, P.eval x = 0) ∧ ¬(∫ x in (0)..1, |P.eval x| ≤ c * (sSup {y | ∃ x ∈ Icc 0 1, y = |P.eval x|})) := by sorry
      rcases h₄ with ⟨P, hP_deg, hP_root, hP_int⟩
      have h₅ := hc P hP_deg hP_root
      exact hP_int h₅
      hole
    exact h₃ hc
    hole
  have h₂ : IsLeast p ((5 / 6) : ℝ):= by
    refine' ⟨h₀, fun c hc => _⟩
    exact h₁ c hc
    hole
  apply h₂
  hole