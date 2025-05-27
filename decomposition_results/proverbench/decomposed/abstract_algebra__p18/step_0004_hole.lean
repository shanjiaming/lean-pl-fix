theorem h₅ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (hn : ¬n = 0) (hn₁ : ¬n ≥ 1) : n = 0 := by -- omega
  hole