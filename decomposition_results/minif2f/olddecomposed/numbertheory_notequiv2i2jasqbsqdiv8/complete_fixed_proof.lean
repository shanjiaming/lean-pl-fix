theorem numbertheory_notequiv2i2jasqbsqdiv8 :
    ¬∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k := by
  have h_main : (∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k) → False := by
    intro h
    have h₁ : (∃ i j, (4 : ℤ) = 2 * i ∧ (2 : ℤ) = 2 * j) ↔ ∃ k, (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k := by
      admit
    have h₂ : ∃ (i j : ℤ), (4 : ℤ) = 2 * i ∧ (2 : ℤ) = 2 * j := by
      admit
    have h₃ : ∃ (k : ℤ), (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k := by
      have h₄ : (∃ (k : ℤ), (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k) := by
        admit
      admit
    rcases h₃ with ⟨k, hk⟩
    have h₄ : (4 : ℤ) ^ 2 + (2 : ℤ) ^ 2 = 8 * k := by
      admit
    have h₅ : k = 5 / 2 := by
      admit
    have h₆ : (k : ℤ) ≠ 5 / 2 := by
      admit
    admit
  
  have h_final : ¬∀ a b : ℤ, (∃ i j, a = 2 * i ∧ b = 2 * j) ↔ ∃ k, a ^ 2 + b ^ 2 = 8 * k := by
    intro h
    have h₁ : False := h_main h
    admit
  
  admit