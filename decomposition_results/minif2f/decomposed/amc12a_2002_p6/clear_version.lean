macro "hole_2" : tactic => `(tactic| admit)
macro "hole_1" : tactic => `(tactic| admit)
macro "skip_hole" : term => `(sorry)

theorem amc12a_2002_p6 (n : ℕ) (h₀ : 0 < n) : ∃ m, m > n ∧ ∃ p, m * p ≤ m + p := by
  have h₁ : ∃ (m : ℕ), m > n ∧ ∃ (p : ℕ), m * p ≤ m + p := by
    hole_2
  
  hole_1