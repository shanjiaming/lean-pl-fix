theorem putnam_1999_a6 :
  ∀ (a : ℤ → ℝ), a 1 = 1 → a 2 = 2 → a 3 = 24 → (∀ n : ℕ, n ≥ 4 → a n = (6 * (a (n - 1))^2 * (a (n - 3)) - 8 * (a (n - 1)) * (a (n - 2))^2)/(a (n - 2) * a (n - 3))) → (∀ n, n ≥ 1 → (∃ k : ℤ, a n = k * n)) := by
  intro a ha1 ha2 ha3 h_rec n hn
  
  have h₀ : False := by admit
  
  admit