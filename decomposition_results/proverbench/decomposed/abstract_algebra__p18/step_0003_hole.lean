theorem h₄ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (hn : ¬n = 0) : n ≥ 1 := by
  --  by_contra hn₁
  have h₅ : n = 0 := by sorry
  --  contradiction
  hole