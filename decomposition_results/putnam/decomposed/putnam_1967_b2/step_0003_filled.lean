theorem hB (p r A B C α β γ : ℝ) (prbound : 0 ≤ p ∧ p ≤ 1 ∧ 0 ≤ r ∧ r ≤ 1) (id1 : ∀ (x y : ℝ), (p * x + (1 - p) * y) ^ 2 = A * x ^ 2 + B * x * y + C * y ^ 2) (id2 : ∀ (x y : ℝ), (p * x + (1 - p) * y) * (r * x + (1 - r) * y) = α * x ^ 2 + β * x * y + γ * y ^ 2) (hA : A = p ^ 2) : B = 2 * p * (1 - p) := by
  have h₁ := id1 1 0
  have h₂ := id1 0 1
  have h₃ := id1 1 1
  have h₄ := id1 2 1
  have h₅ := id1 1 2
  have h₆ := id1 (-1) 1
  have h₇ := id1 1 (-1)
  have h₈ := id1 2 (-1)
  have h₉ := id1 (-1) 2
  --  --  norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ ⊢ <;> nlinarith [prbound.1, prbound.2.1, prbound.2.2.1, prbound.2.2.2, hA]
  linarith