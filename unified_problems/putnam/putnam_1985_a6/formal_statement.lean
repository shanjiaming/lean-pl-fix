theorem putnam_1985_a6
  (Γ : Polynomial ℝ → ℝ)
  (f : Polynomial ℝ)
  (hΓ : Γ = fun p ↦ ∑ k in Finset.range (p.natDegree + 1), coeff p k ^ 2)
  (hf : f = 3 * X ^ 2 + 7 * X + 2) :
  let g := ((6 * X ^ 2 + 5 * X + 1) : Polynomial ℝ );
  g.eval 0 = 1 ∧ ∀ n : ℕ, n ≥ 1 → Γ (f ^ n) = Γ (g ^ n) := by