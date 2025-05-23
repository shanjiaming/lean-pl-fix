theorem putnam_1988_b1
  : ∀ a ≥ 2, ∀ b ≥ 2, ∃ x y z : ℤ, x > 0 ∧ y > 0 ∧ z > 0 ∧ a * b = x * y + x * z + y * z + 1 := by
  intro a ha b hb
  have h_main : ∃ (x y z : ℤ), x > 0 ∧ y > 0 ∧ z > 0 ∧ a * b = x * y + x * z + y * z + 1 := by
    use 1, (a - 1 : ℤ), (b - 1 : ℤ)
    have h₁ : (1 : ℤ) > 0 := by norm_num
    have h₂ : (a - 1 : ℤ) > 0 := by
      have h₂₁ : (a : ℤ) ≥ 2 := by exact_mod_cast ha
      have h₂₂ : (a - 1 : ℤ) > 0 := by omega
      exact h₂₂
    have h₃ : (b - 1 : ℤ) > 0 := by
      have h₃₁ : (b : ℤ) ≥ 2 := by exact_mod_cast hb
      have h₃₂ : (b - 1 : ℤ) > 0 := by omega
      exact h₃₂
    have h₄ : (a * b : ℤ) = (1 : ℤ) * (a - 1 : ℤ) + (1 : ℤ) * (b - 1 : ℤ) + (a - 1 : ℤ) * (b - 1 : ℤ) + 1 := by
      have h₄₁ : (a : ℤ) ≥ 2 := by exact_mod_cast ha
      have h₄₂ : (b : ℤ) ≥ 2 := by exact_mod_cast hb
      ring_nf
      <;> nlinarith
    exact ⟨h₁, h₂, h₃, h₄⟩
  
  exact h_main