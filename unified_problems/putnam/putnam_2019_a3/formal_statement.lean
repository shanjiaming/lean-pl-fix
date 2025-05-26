theorem putnam_2019_a3
  (v : Polynomial ℂ → Prop)
  (hv : v = fun b => b.degree = 2019 ∧ 1 ≤ (b.coeff 0).re ∧ (b.coeff 2019).re ≤ 2019 ∧
    (∀ i : Fin 2020, (b.coeff i).im = 0) ∧ (∀ i : Fin 2019, (b.coeff i).re < (b.coeff (i + 1)).re))
  (μ : Polynomial ℂ → ℝ)
  (hμ : μ = fun b => (Multiset.map (fun ω : ℂ => ‖ω‖) (Polynomial.roots b)).sum/2019) :
  IsGreatest {M : ℝ | ∀ b, v b → μ b ≥ M} ((2019^(-(1:ℝ)/2019)) : ℝ ) := by