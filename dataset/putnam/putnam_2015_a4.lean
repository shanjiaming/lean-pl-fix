theorem putnam_2015_a4
(S : ℝ → Set ℤ)
(f : ℝ → ℝ)
(p : ℝ → Prop)
(hS : S = fun (x : ℝ) ↦ {n : ℤ | n > 0 ∧ Even ⌊n * x⌋})
(hf : f = fun (x : ℝ) ↦ ∑' n : S x, 1 / 2 ^ (n : ℤ))
(hp : ∀ l, p l ↔ ∀ x ∈ Set.Ico 0 1, f x ≥ l)
: IsGreatest p ((4 / 7) : ℝ ) := by
  have h₀ : ∀ x ∈ Set.Ico (0 : ℝ) 1, f x ≥ 4 / 7 := by sorry
  have h₁ : p (4 / 7) := by sorry
  have h₂ : IsGreatest p (4 / 7) := by sorry
  sorry