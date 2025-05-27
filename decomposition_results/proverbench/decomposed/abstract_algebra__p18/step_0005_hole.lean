theorem h₅ (P : ℤ[X]) (n : ℕ) (hP : P.natDegree = n) (h₁ : ∀ k ≤ 2 * n, eval (2 * Int.ofNat k) P = 1) (h₂ : eval (-1) P = 1) (hn : ¬n = 0) (h₄ : n ≥ 1) : P = 1 :=
  by
  have h₅₁ : ∀ (k : ℤ), k ∈ (Finset.Icc 0 (2 * n)) → P.eval k = 1 := by sorry
  have h₅₂ : P = 1 := by sorry
  --  exact h₅₂
  hole