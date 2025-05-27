theorem h₆ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (h₃ h₅ : n = 0) : P = 1 := by
  have h₆₁ : ∀ (k : ℕ), k ≤ 2 * n → P.eval (2 * (Int.ofNat k)) = 1 := h₁
  have h₆₂ : P.eval (-1) = 1 := h₂
  have h₆₃ : n = 0 := h₃
  have h₆₄ : P = 1 := by sorry
  --  exact h₆₄
  simpa