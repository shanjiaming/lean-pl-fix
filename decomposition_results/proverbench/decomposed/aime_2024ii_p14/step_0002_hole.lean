theorem h₃ (b : ℕ) (h₀ : 2 ≤ b) (h₁ : (beautifulSet b).card ≥ 10) (h₂ : ∀ c ∈ Finset.Ico 2 b, (beautifulSet c).card < 10) : b ≥ 211 := by
  --  by_contra h
  have h₄ : b ≤ 210 := by sorry
  have h₅ : b < 211 := by sorry
  have h₆ : b ∈ Finset.Ico 2 b → False := by sorry
  have h₉ : b ∉ Finset.Ico 2 b := by sorry
  have h₁₀ : b ∉ Finset.Ico 2 b := by sorry
  have h₁₁ : b ≥ 2 := h₀
  have h₁₂ : b < b → False := by sorry
  --  --  --  --  --  simp [Finset.mem_Ico] at h₉ h₁₀ <;> (try omega) <;> (try linarith) <;> (try omega) <;> (try linarith)
  hole