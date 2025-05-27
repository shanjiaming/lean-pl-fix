theorem h₆ (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10) (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) (h₃ : b ≥ 211) (h₅ : b ≥ 212) : 211 ∈ Finset.Ico 2 b := by
  --  rw [Finset.mem_Ico]
  --  constructor
  --  · omega
  --  · omega
  simpa