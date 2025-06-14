theorem solve_congruence3 (p : ℕ) : ∃ m : ℕ, (15 * m + 8) % 7 = 1 ∧ m = 7 * p := by
  have h_main : ∃ (m : ℕ), (15 * m + 8) % 7 = 1 ∧ m = 7 * p := by
    use 7 * p
    constructor
    · 
      have h₁ : (15 * (7 * p) + 8 : ℕ) % 7 = 1 := by
        have h₂ : (15 * (7 * p) + 8 : ℕ) = 105 * p + 8 := by
          admit
        rw [h₂]
        have h₃ : (105 * p + 8 : ℕ) % 7 = 1 := by
          have h₄ : p % 7 = p % 7 := rfl
          have h₅ : (105 * p + 8 : ℕ) % 7 = 1 := by
            admit
          admit
        admit
      admit
    · 
      rfl
  admit