theorem h₆ (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10) (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) (h : ¬b ≥ 211) (h₄ : b ≤ 210) (h₅ : b < 211) : b ∈ Finset.Ico 2 b → False := by
  intro h₇
  have h₈ : (beautifulSet b).card < 10 := h₂ b h₇
  linarith