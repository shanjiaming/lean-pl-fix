theorem h₅ (p : ℕ) (podd : Odd p) (pprime : Prime p) (h₁ : Nat.Prime p) (h₂ : p ≠ 0) (h₃ : p ≠ 1) (h₄ : p ≥ 2) : ∑ j, p.choose ↑j * (p + ↑j).choose ↑j = ∑ j ∈ Finset.range (p + 1), p.choose j * (p + j).choose j :=
  --  --  by simp [Finset.sum_range_succ, Fin.sum_univ_eq_sum_range] <;> rfl
  hole