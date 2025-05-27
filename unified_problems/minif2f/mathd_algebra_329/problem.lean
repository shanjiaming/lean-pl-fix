theorem mathd_algebra_329 (x y : ℝ) (h₀ : 3 * y = x) (h₁ : 2 * x + 5 * y = 11) : x + y = 4 := by
  have h₂ : y = 1 := by
    have h₂₁ : 11 * y = 11 := by
      calc
        11 * y = 2 * x + 5 * y := by
          -- Substitute x = 3 * y into the expression and simplify
          have h₂₂ : x = 3 * y := by linarith
          rw [h₂₂]
          <;> ring_nf
          <;> linarith
        _ = 11 := by linarith
    linarith
  
  have h₃ : x = 3 := by
    have h₃₁ : x = 3 * y := by linarith
    rw [h₃₁, h₂]
    <;> norm_num
  
  have h₄ : x + y = 4 := by
    rw [h₃, h₂]
    <;> norm_num
  
  exact h₄