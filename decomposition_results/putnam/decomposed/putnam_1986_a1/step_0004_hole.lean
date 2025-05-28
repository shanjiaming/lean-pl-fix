theorem h₂ (S : Set ℝ) (f : ℝ → ℝ) (hS : S = {x | x ^ 4 + 36 ≤ 13 * x ^ 2}) (hf : f = fun x => x ^ 3 - 3 * x) (h₁ : 18 ∈ {x | ∃ x_1 ∈ S, f x_1 = x}) : ∀ y ∈ {x | ∃ x_1 ∈ S, f x_1 = x}, y ≤ 18 := by
  --  intro y hy
  --  rw [hf] at hy
  --  rw [hS] at hy
  --  rcases hy with ⟨x, hx, rfl⟩
  have h₃ : x ^ 4 + 36 ≤ 13 * x ^ 2 := by sorry
  have h₄ : x ^ 2 ≤ 9 := by sorry
  have h₅ : x ^ 2 ≥ 4 := by sorry
  have h₆ : x ≤ 3 := by sorry
  have h₇ : x ≥ -3 := by sorry
  have h₈ : x ^ 3 - 3 * x ≤ 18 := by sorry
  --  exact h₈
  hole