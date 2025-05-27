theorem h₉ (x✝ x : ℕ → ℝ) (L : ℝ) (hL : Tendsto x atTop (𝓝 L)) (h₂ : ∀ᶠ (n : ℕ) in atTop, |x n - L| < 1) : ∃ N, ∀ n ≥ N, |x n - L| < 1 :=
  by
  rw [Metric.tendsto_atTop] at h₄
  have h₁₀ := h₄ 1 (by norm_num)
  obtain ⟨N, hN⟩ := h₁₀
  refine' ⟨N, _⟩
  intro n hn
  exact hN n (by exact_mod_cast hn)
  hole