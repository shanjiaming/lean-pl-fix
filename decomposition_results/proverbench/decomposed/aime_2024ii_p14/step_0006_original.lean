theorem h₉ (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10) (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) (h : ¬b ≥ 211) (h₄ : b ≤ 210) (h₅ : b < 211) (h₆ : b ∈ Finset.Ico 2 b → False) : b ∉ Finset.Ico 2 b := by
  intro h₇
  exact h₆ h₇