theorem h₁ (S : Set ℝ) (f : ℝ → ℝ) (hS : S = {x | x ^ 4 + 36 ≤ 13 * x ^ 2}) (hf : f = fun x => x ^ 3 - 3 * x) : 18 ∈ {x | ∃ x_1 ∈ S, f x_1 = x} := by
  rw [hf]
  rw [hS]
  have h₂ : (3 : ℝ) ∈ {x : ℝ | x ^ 4 + 36 ≤ 13 * x ^ 2} := by sorry
  refine' ⟨3, h₂, _⟩
  norm_num