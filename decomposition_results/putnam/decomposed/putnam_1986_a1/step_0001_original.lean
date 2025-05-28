theorem putnam_1986_a1 (S : Set ℝ) (f : ℝ → ℝ) (hS : S = {x | x ^ 4 + 36 ≤ 13 * x ^ 2}) (hf : f = fun x => x ^ 3 - 3 * x) : IsGreatest {x | ∃ x_1 ∈ S, f x_1 = x} 18 :=
  by
  have h₁ : (18 : ℝ) ∈ {f x | x ∈ S} := by sorry
  have h₂ : ∀ y ∈ {f x | x ∈ S}, y ≤ (18 : ℝ) := by sorry
  exact ⟨h₁, h₂⟩