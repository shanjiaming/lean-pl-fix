theorem aime_2024ii_p14 (b : ℕ) (h₀ : 2 ≤ b)
    (h₁ : (beautifulSet b).card ≥ 10)
    (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) :
    b = 211 := by