theorem h₃ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) : n = 0 := by
  by_contra hn
  have h₄ : n ≥ 1 := by sorry
  have h₅ : P = 1 := by sorry
  have h₆ : P.natDegree = 0 := by sorry
  have h₇ : n = 0 := by sorry
  exact hn h₇