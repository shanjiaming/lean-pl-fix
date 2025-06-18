theorem imo_1981_p6 (f : ℕ → ℕ → ℕ) (h₀ : ∀ y, f 0 y = y + 1) (h₁ : ∀ x, f (x + 1) 0 = f x 1)
    (h₂ : ∀ x y, f (x + 1) (y + 1) = f x (f (x + 1) y)) : ∀ y, f 4 (y + 1) = 2 ^ (f 4 y + 3) - 3 := by
  have h_f₁ : ∀ y, f 1 y = y + 2 := by
    admit
    rw [h₅]
    have h₆ : f 3 (f 4 y) = 2 ^ (f 4 y + 3) - 3 := by
      have h₆₁ : f 3 (f 4 y) = 2 ^ (f 4 y + 3) - 3 := by
        admit
      admit
    admit
  
  admit