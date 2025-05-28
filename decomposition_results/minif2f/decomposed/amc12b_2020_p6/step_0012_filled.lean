theorem h₂ (n : ℕ) (h₀ : 9 ≤ n) (h₁ : ↑(n + 1) ^ 2 = (↑(n + 2)! - ↑(n + 1)!) / ↑n !) : ∃ x, ↑x ^ 2 = (↑(n + 2)! - ↑(n + 1)!) / ↑n ! :=
  by
  --  refine' ⟨n + 1, _⟩
  --  simpa using h₁
  hole