theorem h₁₉ (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) (hd_not_div_five : d % 5 ≠ 0) (h₃ : d % 2 = 1) (h₄ : d % 5 ≠ 0) (h₅ : d % 20 = 13) (h₆ : d % 5 = 3) (h₇ : d % 5 = 0 ∨ d % 5 = 1 ∨ d % 5 = 2 ∨ d % 5 = 3 ∨ d % 5 = 4) (h₈ : ¬d % 5 = 0) (h₉ : d % 5 = 3) (h₁₀ : d ∣ 5 * x ^ 2 + 1) (h₁₁ : (5 * x ^ 2 + 1) % 5 = 1) (h₁₂ h₁₃ h₁₄ : d % 5 = 3) (h₁₅ : d ∣ 5 * x ^ 2 + 1) (h₁₆ : (5 * x ^ 2 + 1) % 5 = 1) (h₁₇ : d % 5 = 3) (h₁₈ : d ∣ 5 * x ^ 2 + 1) : (5 * x ^ 2 + 1) % 5 = 1 :=
  by
  have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by sorry
  --  --  rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;> simp [h₂₀, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
  linarith