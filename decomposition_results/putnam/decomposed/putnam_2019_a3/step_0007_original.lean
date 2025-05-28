theorem h_main (v : Polynomial ℂ → Prop) (hv :  v = fun b =>    b.degree = 2019 ∧      1 ≤ (b.coeff 0).re ∧        (b.coeff 2019).re ≤ 2019 ∧          (∀ (i : Fin 2020), (b.coeff ↑i).im = 0) ∧ ∀ (i : Fin 2019), (b.coeff ↑i).re < (b.coeff (↑i + 1)).re) (μ : Polynomial ℂ → ℝ) (hμ : μ = fun b => (Multiset.map (fun ω => ‖ω‖) b.roots).sum / 2019) (h_no_poly : ¬∃ b, v b) : IsGreatest {M | ∀ (b : Polynomial ℂ), v b → μ b ≥ M} (2019 ^ (-1 / 2019)) :=
  by
  have h₁ : ∀ (b : Polynomial ℂ), v b → μ b ≥ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := by sorry
  have h₂ : (2019 : ℝ) ^ (-(1 : ℝ) / 2019) ∈ {M : ℝ | ∀ b, v b → μ b ≥ M} := by sorry
  have h₃ : ∀ (y : ℝ), y ∈ {M : ℝ | ∀ b, v b → μ b ≥ M} → y ≤ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := by sorry
  exact ⟨h₂, h₃⟩