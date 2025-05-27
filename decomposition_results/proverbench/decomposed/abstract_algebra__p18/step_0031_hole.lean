theorem h₇ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (hn : ¬n = 0) (h₄ : n ≥ 1) (h₅ : P = 1) (h₆ : P.natDegree = 0) : n = 0 := by
  have h₇₁ : P.natDegree = n := hP
  have h₇₂ : P.natDegree = 0 := h₆
  --  linarith
  hole