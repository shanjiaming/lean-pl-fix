theorem hβ (p r A B C α β γ : ℝ) (prbound : 0 ≤ p ∧ p ≤ 1 ∧ 0 ≤ r ∧ r ≤ 1) (id1 : ∀ (x y : ℝ), (p * x + (1 - p) * y) ^ 2 = A * x ^ 2 + B * x * y + C * y ^ 2) (id2 : ∀ (x y : ℝ), (p * x + (1 - p) * y) * (r * x + (1 - r) * y) = α * x ^ 2 + β * x * y + γ * y ^ 2) (hA : A = p ^ 2) (hB : B = 2 * p * (1 - p)) (hC : C = (1 - p) ^ 2) (h_max_ABC : max (max A B) C ≥ 4 / 9) (hα : α = p * r) : β = p + r - 2 * p * r := by
  have h₁ := id2 1 0
  have h₂ := id2 0 1
  have h₃ := id2 1 1
  have h₄ := id2 2 1
  have h₅ := id2 1 2
  have h₆ := id2 (-1) 1
  have h₇ := id2 1 (-1)
  have h₈ := id2 2 (-1)
  have h₉ := id2 (-1) 2
  norm_num at h₁ h₂ h₃ h₄ h₅ h₆ h₇ h₈ h₉ ⊢ <;>
    nlinarith [prbound.1, prbound.2.1, prbound.2.2.1, prbound.2.2.2, hA, hB, hC, hα]