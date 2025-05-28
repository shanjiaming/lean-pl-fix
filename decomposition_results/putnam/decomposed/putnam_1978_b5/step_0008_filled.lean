theorem h_main₂ (S : Set ℝ[X]) (hS : S = {p | p.degree = 4 ∧ ∀ x ∈ Icc (-1) 1, eval x p ∈ Icc 0 1}) (h_main₁ : 4 * X ^ 4 - 4 * X ^ 2 + 1 ∈ S) : ∀ p ∈ S, p.coeff 4 ≤ (4 * X ^ 4 - 4 * X ^ 2 + 1).coeff 4 :=
  by
  --  intro p hp
  --  rw [hS] at hp
  have h₁ : p.degree = 4 := hp.1
  have h₂ : ∀ x ∈ Icc (-1 : ℝ) 1, p.eval x ∈ Icc 0 1 := hp.2
  have h₃ : p.coeff 4 ≤ 4 := by sorry
  have h₄ : (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 = 4 := by sorry
  have h₅ : p.coeff 4 ≤ (4 * X ^ 4 - 4 * X ^ 2 + 1 : Polynomial ℝ).coeff 4 := by sorry
  --  exact h₅
  hole