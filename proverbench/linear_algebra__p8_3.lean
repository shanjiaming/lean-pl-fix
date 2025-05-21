theorem unique_solution : ∃! x : ℚ × ℚ × ℚ,
-19 * x.1 + 8 * x.2.1 = -108 ∧
-71 * x.1 + 30 * x.2.1 = -404 ∧
-2 * x.1 + x.2.1 = -12 ∧
4 * x.1 + x.2.2 = 14 := by
  have h_exists : ∃ (x : ℚ × ℚ × ℚ), -19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14 := by
    refine' ⟨(4, -4, -2), _⟩
    -- Verify that (4, -4, -2) is a solution
    norm_num [verify_solution]

  have h_unique : ∀ (x y : ℚ × ℚ × ℚ), (-19 * x.1 + 8 * x.2.1 = -108 ∧ -71 * x.1 + 30 * x.2.1 = -404 ∧ -2 * x.1 + x.2.1 = -12 ∧ 4 * x.1 + x.2.2 = 14) → (-19 * y.1 + 8 * y.2.1 = -108 ∧ -71 * y.1 + 30 * y.2.1 = -404 ∧ -2 * y.1 + y.2.1 = -12 ∧ 4 * y.1 + y.2.2 = 14) → x = y := by
    intro x y hx hy
    -- Extract the equations for x and y
    have h₁ : -19 * x.1 + 8 * x.2.1 = -108 := hx.1
    have h₂ : -71 * x.1 + 30 * x.2.1 = -404 := hx.2.1
    have h₃ : -2 * x.1 + x.2.1 = -12 := hx.2.2.1
    have h₄ : 4 * x.1 + x.2.2 = 14 := hx.2.2.2
    have h₅ : -19 * y.1 + 8 * y.2.1 = -108 := hy.1
    have h₆ : -71 * y.1 + 30 * y.2.1 = -404 := hy.2.1
    have h₇ : -2 * y.1 + y.2.1 = -12 := hy.2.2.1
    have h₈ : 4 * y.1 + y.2.2 = 14 := hy.2.2.2
    -- Solve for x and y to show they must be equal
    have h₉ : x.1 = 4 := by
      -- Use linear arithmetic to solve for x.1
      have h₉₁ : -2 * x.1 + x.2.1 = -12 := h₃
      have h₉₂ : -19 * x.1 + 8 * x.2.1 = -108 := h₁
      have h₉₃ : x.2.1 = 2 * x.1 - 12 := by linarith
      rw [h₉₃] at h₉₂
      linarith
    have h₁₀ : x.2.1 = -4 := by
      -- Use linear arithmetic to solve for x.2.1
      have h₁₀₁ : -2 * x.1 + x.2.1 = -12 := h₃
      rw [h₉] at h₁₀₁
      linarith
    have h₁₁ : x.2.2 = -2 := by
      -- Use linear arithmetic to solve for x.2.2
      have h₁₁₁ : 4 * x.1 + x.2.2 = 14 := h₄
      rw [h₉] at h₁₁₁
      linarith
    have h₁₂ : y.1 = 4 := by
      -- Use linear arithmetic to solve for y.1
      have h₁₂₁ : -2 * y.1 + y.2.1 = -12 := h₇
      have h₁₂₂ : -19 * y.1 + 8 * y.2.1 = -108 := h₅
      have h₁₂₃ : y.2.1 = 2 * y.1 - 12 := by linarith
      rw [h₁₂₃] at h₁₂₂
      linarith
    have h₁₃ : y.2.1 = -4 := by
      -- Use linear arithmetic to solve for y.2.1
      have h₁₃₁ : -2 * y.1 + y.2.1 = -12 := h₇
      rw [h₁₂] at h₁₃₁
      linarith
    have h₁₄ : y.2.2 = -2 := by
      -- Use linear arithmetic to solve for y.2.2
      have h₁₄₁ : 4 * y.1 + y.2.2 = 14 := h₈
      rw [h₁₂] at h₁₄₁
      linarith
    -- Conclude that x = y
    have h₁₅ : x = y := by
      ext <;> simp_all [Prod.ext_iff]
      <;> norm_num <;> linarith
    exact h₁₅
  
  obtain ⟨x, hx⟩ := h_exists
  refine' ⟨x, hx, _⟩
  intro y hy
  have h_eq : y = x := h_unique y x hy hx
  rw [h_eq]