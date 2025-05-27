theorem convergent_seq_bounded (x✝ x : ℕ → ℝ) (hx : ∃ L, Tendsto x atTop (𝓝 L)) : ∃ M, ∀ (n : ℕ), |x n| ≤ M :=
  by
  have h_main : ∃ (M : ℝ), ∀ (n : ℕ), |x n| ≤ M :=
    by
    obtain ⟨L, hL⟩ := hx
    have h₁ : ∃ (N : ℕ), ∀ n ≥ N, |x n - L| < 1 :=
      by
      have h₂ : ∀ᶠ n in atTop, |x n - L| < 1 :=
        by
        have h₃ : Tendsto x atTop (𝓝 L) := hL
        have h₄ : Tendsto (fun n => x n - L) atTop (𝓝 0) := by simpa using hL.sub tendsto_const_nhds
        have h₅ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 :=
          by
          have h₆ : Tendsto (fun n => x n - L) atTop (𝓝 0) := h₄
          have h₇ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 :=
            by
            have h₈ : (1 : ℝ) > 0 := by norm_num
            have h₉ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 := by exact Metric.tendsto_atTop.mp h₄ 1 (by norm_num)
            exact h₉
          exact h₇
        have h₈ : ∀ᶠ n in atTop, |x n - L| < 1 := by simpa [sub_zero] using h₅
        exact h₈
      have h₉ : ∃ (N : ℕ), ∀ n ≥ N, |x n - L| < 1 :=
        by
        rw [Metric.tendsto_atTop] at h₄
        have h₁₀ := h₄ 1 (by norm_num)
        obtain ⟨N, hN⟩ := h₁₀
        refine' ⟨N, _⟩
        intro n hn
        exact hN n (by exact_mod_cast hn)
      exact h₉
    obtain ⟨N, hN⟩ := h₁
    have h₂ : ∃ (C : ℝ), ∀ n < N, |x n| ≤ C := by
      classical
      have h₃ : ∃ (C : ℝ), ∀ n < N, |x n| ≤ C := by
        by_cases h₄ : N = 0
        · use 0
          intro n hn
          have h₅ : n < N := hn
          have h₆ : N = 0 := h₄
          have h₇ : n < 0 := by simp_all
          have h₈ : False := by linarith
          exfalso
          exact h₈
        · use (Finset.sup (Finset.Iio N) (fun n => |x n|))
          intro n hn
          have h₅ : n < N := hn
          have h₆ : n ∈ Finset.Iio N := by exact Finset.mem_Iio.mpr h₅
          have h₇ : |x n| ≤ Finset.sup (Finset.Iio N) (fun n => |x n|) := by exact Finset.le_sup h₆
          exact h₇
      exact h₃
    obtain ⟨C, hC⟩ := h₂
    use max C (|L| + 1)
    intro n
    by_cases h₃ : n < N
    ·
      have h₄ : |x n| ≤ C := hC n h₃
      have h₅ : C ≤ max C (|L| + 1) := by exact le_max_left _ _
      have h₆ : |x n| ≤ max C (|L| + 1) := by linarith
      exact h₆
    ·
      have h₄ : n ≥ N := by
        by_contra h₅
        have h₆ : n < N := by linarith
        exact h₃ h₆
      have h₅ : |x n - L| < 1 := hN n h₄
      have h₆ : |x n| - |L| ≤ |x n - L| :=
        by
        have h₇ : |x n| - |L| ≤ |x n - L| := by
          cases' abs_cases (x n - L) with h₈ h₈ <;> cases' abs_cases (x n) with h₉ h₉ <;>
              cases' abs_cases L with h₁₀ h₁₀ <;>
            linarith
        exact h₇
      have h₇ : |x n| - |L| < 1 := by linarith
      have h₈ : |x n| < |L| + 1 := by linarith
      have h₉ : |x n| ≤ max C (|L| + 1) := by
        have h₁₀ : |x n| < |L| + 1 := h₈
        have h₁₁ : |L| + 1 ≤ max C (|L| + 1) := by exact le_max_right _ _
        have h₁₂ : |x n| ≤ max C (|L| + 1) := by linarith
        exact h₁₂
      exact h₉
  obtain ⟨M, hM⟩ := h_main
  have h_main : ∃ (M : ℝ), ∀ (n : ℕ), |x n| ≤ M := by sorry
have convergent_seq_bounded {x : ℕ → ℝ} (hx : ∃ L, Tendsto x atTop (𝓝 L)) : ∃ M, ∀ n, |x n| ≤ M :=
  by
  have h_main : ∃ (M : ℝ), ∀ (n : ℕ), |x n| ≤ M :=
    by
    obtain ⟨L, hL⟩ := hx
    have h₁ : ∃ (N : ℕ), ∀ n ≥ N, |x n - L| < 1 :=
      by
      have h₂ : ∀ᶠ n in atTop, |x n - L| < 1 :=
        by
        have h₃ : Tendsto x atTop (𝓝 L) := hL
        have h₄ : Tendsto (fun n => x n - L) atTop (𝓝 0) := by simpa using hL.sub tendsto_const_nhds
        have h₅ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 :=
          by
          have h₆ : Tendsto (fun n => x n - L) atTop (𝓝 0) := h₄
          have h₇ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 :=
            by
            have h₈ : (1 : ℝ) > 0 := by norm_num
            have h₉ : ∀ᶠ n in atTop, |(x n - L) - 0| < 1 := by exact Metric.tendsto_atTop.mp h₄ 1 (by norm_num)
            exact h₉
          exact h₇
        have h₈ : ∀ᶠ n in atTop, |x n - L| < 1 := by simpa [sub_zero] using h₅
        exact h₈
      have h₉ : ∃ (N : ℕ), ∀ n ≥ N, |x n - L| < 1 :=
        by
        rw [Metric.tendsto_atTop] at h₄
        have h₁₀ := h₄ 1 (by norm_num)
        obtain ⟨N, hN⟩ := h₁₀
        refine' ⟨N, _⟩
        intro n hn
        exact hN n (by exact_mod_cast hn)
      exact h₉
    obtain ⟨N, hN⟩ := h₁
    have h₂ : ∃ (C : ℝ), ∀ n < N, |x n| ≤ C := by
      classical
      have h₃ : ∃ (C : ℝ), ∀ n < N, |x n| ≤ C := by
        by_cases h₄ : N = 0
        · use 0
          intro n hn
          have h₅ : n < N := hn
          have h₆ : N = 0 := h₄
          have h₇ : n < 0 := by simp_all
          have h₈ : False := by linarith
          exfalso
          exact h₈
        · use (Finset.sup (Finset.Iio N) (fun n => |x n|))
          intro n hn
          have h₅ : n < N := hn
          have h₆ : n ∈ Finset.Iio N := by exact Finset.mem_Iio.mpr h₅
          have h₇ : |x n| ≤ Finset.sup (Finset.Iio N) (fun n => |x n|) := by exact Finset.le_sup h₆
          exact h₇
      exact h₃
    obtain ⟨C, hC⟩ := h₂
    use max C (|L| + 1)
    intro n
    by_cases h₃ : n < N
    ·
      have h₄ : |x n| ≤ C := hC n h₃
      have h₅ : C ≤ max C (|L| + 1) := by exact le_max_left _ _
      have h₆ : |x n| ≤ max C (|L| + 1) := by linarith
      exact h₆
    ·
      have h₄ : n ≥ N := by
        by_contra h₅
        have h₆ : n < N := by linarith
        exact h₃ h₆
      have h₅ : |x n - L| < 1 := hN n h₄
      have h₆ : |x n| - |L| ≤ |x n - L| :=
        by
        have h₇ : |x n| - |L| ≤ |x n - L| := by
          cases' abs_cases (x n - L) with h₈ h₈ <;> cases' abs_cases (x n) with h₉ h₉ <;>
              cases' abs_cases L with h₁₀ h₁₀ <;>
            linarith
        exact h₇
      have h₇ : |x n| - |L| < 1 := by linarith
      have h₈ : |x n| < |L| + 1 := by linarith
      have h₉ : |x n| ≤ max C (|L| + 1) := by
        have h₁₀ : |x n| < |L| + 1 := h₈
        have h₁₁ : |L| + 1 ≤ max C (|L| + 1) := by exact le_max_right _ _
        have h₁₂ : |x n| ≤ max C (|L| + 1) := by linarith
        exact h₁₂
      exact h₉
  obtain ⟨M, hM⟩ := h_main
  exact ⟨M, hM⟩
  hole