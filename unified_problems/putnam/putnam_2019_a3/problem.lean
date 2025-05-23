theorem putnam_2019_a3
  (v : Polynomial ℂ → Prop)
  (hv : v = fun b => b.degree = 2019 ∧ 1 ≤ (b.coeff 0).re ∧ (b.coeff 2019).re ≤ 2019 ∧
    (∀ i : Fin 2020, (b.coeff i).im = 0) ∧ (∀ i : Fin 2019, (b.coeff i).re < (b.coeff (i + 1)).re))
  (μ : Polynomial ℂ → ℝ)
  (hμ : μ = fun b => (Multiset.map (fun ω : ℂ => ‖ω‖) (Polynomial.roots b)).sum/2019) :
  IsGreatest {M : ℝ | ∀ b, v b → μ b ≥ M} ((2019^(-(1:ℝ)/2019)) : ℝ ) := by
  have h_no_poly : ¬ ∃ (b : Polynomial ℂ), v b := by
    rw [hv]
    intro h
    rcases h with ⟨b, hb⟩
    have h₁ : b.degree = 2019 := hb.1
    have h₂ : 1 ≤ (b.coeff 0).re := hb.2.1
    have h₃ : (b.coeff 2019).re ≤ 2019 := hb.2.2.1
    have h₄ : (∀ i : Fin 2020, (b.coeff i).im = 0) := hb.2.2.2.1
    have h₅ : (∀ i : Fin 2019, (b.coeff i).re < (b.coeff (i + 1)).re) := hb.2.2.2.2
    have h₆ : (b.coeff 2019).re > (b.coeff 0).re := by
      have h₆₁ : (b.coeff 0).re < (b.coeff 1).re := by
        have h₆₂ := h₅ ⟨0, by norm_num⟩
        simpa using h₆₂
      have h₆₂ : ∀ (n : ℕ), n ≤ 2019 → (b.coeff 0).re + n ≤ (b.coeff n).re := by
        intro n hn
        induction' hn with n hn IH
        · simp
        · have h₆₃ := h₅ ⟨n, by omega⟩
          have h₆₄ : (b.coeff n).re < (b.coeff (n + 1)).re := h₆₃
          have h₆₅ : (b.coeff 0).re + n ≤ (b.coeff n).re := IH
          have h₆₆ : (b.coeff 0).re + (n + 1 : ℝ) ≤ (b.coeff (n + 1)).re := by
            linarith
          simpa [add_assoc] using h₆₆
      have h₆₃ := h₆₂ 2019 (by norm_num)
      have h₆₄ : (b.coeff 0).re + (2019 : ℝ) ≤ (b.coeff 2019).re := by simpa using h₆₃
      linarith
    linarith
  
  have h_main : IsGreatest {M : ℝ | ∀ b, v b → μ b ≥ M} ((2019^(-(1:ℝ)/2019)) : ℝ) := by
    have h₁ : ∀ (b : Polynomial ℂ), v b → μ b ≥ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := by
      intro b hb
      exfalso
      exact h_no_poly ⟨b, hb⟩
    have h₂ : (2019 : ℝ) ^ (-(1 : ℝ) / 2019) ∈ {M : ℝ | ∀ b, v b → μ b ≥ M} := by
      simpa using h₁
    have h₃ : ∀ (y : ℝ), y ∈ {M : ℝ | ∀ b, v b → μ b ≥ M} → y ≤ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := by
      intro y hy
      have h₄ : ∀ (b : Polynomial ℂ), v b → μ b ≥ y := by simpa using hy
      have h₅ : y ≤ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := by
        by_contra h
        have h₆ : (2019 : ℝ) ^ (-(1 : ℝ) / 2019) < y := by linarith
        have h₇ : ∃ (b : Polynomial ℂ), v b := by
          exfalso
          exact h_no_poly ⟨0, by simp_all [hv]⟩
        rcases h₇ with ⟨b, hb⟩
        have h₈ : μ b ≥ y := h₄ b hb
        have h₉ : μ b ≥ (2019 : ℝ) ^ (-(1 : ℝ) / 2019) := h₁ b hb
        linarith
      exact h₅
    exact ⟨h₂, h₃⟩
  
  exact h_main