theorem h₆ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (hn : ¬n = 0) (h₄ : n ≥ 1) (h₅ : P = 1) : P.natDegree = 0 := by
  have h₆₁ : P = 1 := h₅
  have h₆₂ : P.natDegree = 0 := by sorry
  --  exact h₆₂
  linarith