theorem h₅ (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10) (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) (h : ¬b ≥ 211) (h₄ : b ≤ 210) : b < 211 := by -- omega
  hole