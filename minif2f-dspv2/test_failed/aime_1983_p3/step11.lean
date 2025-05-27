theorem h₃₅ (f : ℝ → ℝ) (h₀ : ∀ (x : ℝ), f x = x ^ 2 + (18 * x + 30) - 2 * √(x ^ 2 + (18 * x + 45))) (h₁ : Fintype (↑(f ⁻¹' {0}) : Type)) (h₂ : -9 + √61 ∈ f ⁻¹' {0}) (h₃₁ h₃₄ : f (-9 - √61) = 0) : -9 - √61 ∈ f ⁻¹' {0} :=
  by
  rw [Set.mem_preimage, Set.mem_singleton_iff]
  exact h₃₄