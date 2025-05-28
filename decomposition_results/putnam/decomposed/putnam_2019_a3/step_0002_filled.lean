theorem h_no_poly (v : Polynomial ℂ → Prop) (hv :  v = fun b =>    b.degree = 2019 ∧      1 ≤ (b.coeff 0).re ∧        (b.coeff 2019).re ≤ 2019 ∧          (∀ (i : Fin 2020), (b.coeff ↑i).im = 0) ∧ ∀ (i : Fin 2019), (b.coeff ↑i).re < (b.coeff (↑i + 1)).re) (μ : Polynomial ℂ → ℝ) (hμ : μ = fun b => (Multiset.map (fun ω => ‖ω‖) b.roots).sum / 2019) : ¬∃ b, v b := by
  --  rw [hv]
  --  intro h
  --  rcases h with ⟨b, hb⟩
  have h₁ : b.degree = 2019 := hb.1
  have h₂ : 1 ≤ (b.coeff 0).re := hb.2.1
  have h₃ : (b.coeff 2019).re ≤ 2019 := hb.2.2.1
  have h₄ : (∀ i : Fin 2020, (b.coeff i).im = 0) := hb.2.2.2.1
  have h₅ : (∀ i : Fin 2019, (b.coeff i).re < (b.coeff (i + 1)).re) := hb.2.2.2.2
  have h₆ : (b.coeff 2019).re > (b.coeff 0).re := by sorry
  --  linarith
  hole