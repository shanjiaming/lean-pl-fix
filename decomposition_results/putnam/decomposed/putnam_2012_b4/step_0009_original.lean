theorem h₈ (a : ℕ → ℝ) (ha0 : a 0 = 1) (han : ∀ (n : ℕ), a (n + 1) = a n + rexp (-a n)) (n : ℕ) (h₃ : a n = a 0) (h₆ : n ≠ 0) : a n > a 0 :=
  by
  have h₉ : ∀ k : ℕ, k ≥ 1 → a k > a 0 := by sorry
  exact h₉ k (by omega)