theorem putnam_1978_b5 (S : Set ℝ[X]) (hS : S = {p | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, eval x p ∈ Icc 0 1}) : 4 * X ^ 4 - 4 * X ^ 2 + 1 ∈ S ∧ ∀ p ∈ S, p.coeff 4 ≤ (4 * X ^ 4 - 4 * X ^ 2 + 1).coeff 4 :=
  by
  have h_main₁ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ) ∈ S := by sorry
  have h_main₂ : ∀ p ∈ S, p.coeff 4 ≤ ((4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4) := by sorry
  exact ⟨h_main₁, h_main₂⟩