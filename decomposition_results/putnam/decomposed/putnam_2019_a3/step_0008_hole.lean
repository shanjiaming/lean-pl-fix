theorem h₁ (v : Polynomial ℂ → Prop) (hv :  v = fun b =>    b.degree = 2019 ∧      1 ≤ (b.coeff 0).re ∧        (b.coeff 2019).re ≤ 2019 ∧          (∀ (i : Fin 2020), (b.coeff ↑i).im = 0) ∧ ∀ (i : Fin 2019), (b.coeff ↑i).re < (b.coeff (↑i + 1)).re) (μ : Polynomial ℂ → ℝ) (hμ : μ = fun b => (Multiset.map (fun ω => ‖ω‖) b.roots).sum / 2019) (h_no_poly : ¬∃ b, v b) : ∀ (b : Polynomial ℂ), v b → μ b ≥ 2019 ^ (-1 / 2019) :=
  by
  --  intro b hb
  --  exfalso
  --  exact h_no_poly ⟨b, hb⟩
  hole