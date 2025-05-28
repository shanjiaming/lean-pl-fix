theorem h₇₃ (p : ℕ) (podd : Odd p) (pprime : Prime p) (h₁ : Nat.Prime p) (h₂ : p ≠ 0) (h₃ : p ≠ 1) (h₄ : p ≥ 2) (h₅ : ∑ j, p.choose ↑j * (p + ↑j).choose ↑j = ∑ j ∈ Finset.range (p + 1), p.choose j * (p + j).choose j) (h₇₁ : 2 ≤ p) (h₇₂ : 1 < p) : p % 2 = 1 := by
  --  cases' podd with k hk
  --  omega
  hole