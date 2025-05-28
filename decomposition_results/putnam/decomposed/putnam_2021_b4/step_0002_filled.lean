theorem h₁ (F : ℕ → ℕ) (hF : ∀ (n : ℕ), F (n + 2) = F (n + 1) + F n) (F01 : F 0 = 0 ∧ F 1 = 1) : F 2 = 1 := by
  have h₂ := hF 0
  have h₃ := hF 1
  have h₄ := hF 2
  have h₅ := hF 3
  --  --  norm_num [F01] at h₂ h₃ h₄ h₅ ⊢ <;> omega
  linarith