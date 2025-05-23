theorem limit_positive_implies_function_positive (h : Tendsto f (𝓝 x₀) (𝓝 A)) (hA : A > (0 : Y)) :
∃ δ > (0 : ℝ), ∀ x, 0 < dist x x₀ ∧ dist x x₀ < δ → 0 < f x := by
  have h_main : ∃ (δ : ℝ), δ > 0 ∧ ∀ (x : X), 0 < dist x x₀ ∧ dist x x₀ < δ → 0 < f x := by
    -- Use the fact that {y | |y - A| < A/2} is a neighborhood of A
    have h₁ : {y : Y | |y - A| < A / 2} ∈ 𝓝 A := by
      have h₂ : IsOpen {y : Y | |y - A| < A / 2} := by
        apply isOpen_Iio.preimage
        continuity
      have h₃ : A ∈ {y : Y | |y - A| < A / 2} := by
        have h₄ : |(A : Y) - A| < A / 2 := by
          have h₅ : (A : Y) - A = 0 := by ring
          rw [h₅]
          have h₆ : (0 : Y) < A / 2 := by
            have h₇ : (0 : Y) < A := hA
            exact half_pos h₇
          simpa [abs_of_pos h₆] using h₆
        simpa [sub_eq_add_neg] using h₄
      exact h₂.mem_nhds h₃
    -- Use the tendsto property to find a δ such that dist x x₀ < δ implies |f x - A| < A / 2
    have h₂ : {x : X | f x ∈ {y : Y | |y - A| < A / 2}} ∈ 𝓝 x₀ := h h₁
    have h₃ : ∃ δ > (0 : ℝ), ball x₀ δ ⊆ {x : X | f x ∈ {y : Y | |y - A| < A / 2}} := by
      rw [mem_nhds_iff] at h₂
      obtain ⟨s, h₄, h₅, h₆⟩ := h₂
      have h₇ : ∃ δ > (0 : ℝ), ball x₀ δ ⊆ s := by
        -- Use the fact that s is a neighborhood of x₀ to find a δ
        have h₈ : s ∈ 𝓝 x₀ := by
          exact IsOpen.mem_nhds h₅ h₄
        rw [Metric.nhds_basis_ball.mem_iff] at h₈
        obtain ⟨δ, h₉, h₁₀⟩ := h₈
        exact ⟨δ, h₉, h₁₀⟩
      obtain ⟨δ, h₉, h₁₀⟩ := h₇
      refine' ⟨δ, h₉, _⟩
      -- Show that the ball x₀ δ is contained in the set {x | f x ∈ {y | |y - A| < A / 2}}
      have h₁₁ : ball x₀ δ ⊆ s := h₁₀
      have h₁₂ : s ⊆ {x : X | f x ∈ {y : Y | |y - A| < A / 2}} := h₆
      exact h₁₂.trans (Set.Subset.refl _) |>.trans h₁₁
    obtain ⟨δ, h₄, h₅⟩ := h₃
    refine' ⟨δ, h₄, _⟩
    intro x h₆
    have h₇ : x ∈ ball x₀ δ := by
      have h₈ : dist x x₀ < δ := by
        linarith [h₆.2]
      exact mem_ball.mpr h₈
    have h₈ : f x ∈ {y : Y | |y - A| < A / 2} := h₅ h₇
    have h₉ : |f x - A| < A / 2 := by simpa using h₈
    have h₁₀ : f x > 0 := by
      have h₁₁ : |f x - A| < A / 2 := h₉
      have h₁₂ : - (A / 2 : Y) < f x - A := by
        rw [abs_lt] at h₁₁
        exact h₁₁.1
      have h₁₃ : f x - A < A / 2 := by
        rw [abs_lt] at h₁₁
        exact h₁₁.2
      have h₁₄ : f x > 0 := by
        have h₁₅ : f x > A - A / 2 := by
          have h₁₆ : f x - A > - (A / 2 : Y) := h₁₂
          have h₁₇ : f x > A - A / 2 := by
            -- Use the fact that A > 0 to simplify the inequality
            have h₁₈ : A - A / 2 = A / 2 := by
              ring_nf
              <;> field_simp [hA.ne']
              <;> ring
            rw [h₁₈]
            have h₁₉ : f x - A > - (A / 2 : Y) := h₁₂
            have h₂₀ : f x > A / 2 := by
              -- Use the fact that A > 0 to simplify the inequality
              have h₂₁ : f x - A > - (A / 2 : Y) := h₁₂
              have h₂₂ : f x > A / 2 := by
                -- Use the fact that A > 0 to simplify the inequality
                have h₂₃ : f x - A > - (A / 2 : Y) := h₁₂
                have h₂₄ : f x > A / 2 := by
                  -- Use the fact that A > 0 to simplify the inequality
                  have h₂₅ : f x - A > - (A / 2 : Y) := h₁₂
                  have h₂₆ : f x > A / 2 := by
                    -- Use the fact that A > 0 to simplify the inequality
                    calc
                      f x = (f x - A) + A := by ring
                      _ > - (A / 2 : Y) + A := by gcongr
                      _ = A / 2 := by
                        ring_nf
                        <;> field_simp [hA.ne']
                        <;> ring
                  exact h₂₆
                exact h₂₄
              exact h₂₂
            exact h₂₀
          exact h₁₇
        have h₁₈ : A - A / 2 = A / 2 := by
          ring_nf
          <;> field_simp [hA.ne']
          <;> ring
        have h₁₉ : f x > A / 2 := by
          linarith
        have h₂₀ : A / 2 > 0 := by
          have h₂₁ : (0 : Y) < A := hA
          have h₂₂ : (0 : Y) < A / 2 := by
            exact half_pos h₂₁
          exact h₂₂
        have h₂₁ : f x > 0 := by
          linarith
        exact h₂₁
      exact h₁₄
    exact h₁₀
  obtain ⟨δ, hδ, hδ'⟩ := h_main
  refine' ⟨δ, hδ, _⟩
  intro x hx
  exact hδ' x hx