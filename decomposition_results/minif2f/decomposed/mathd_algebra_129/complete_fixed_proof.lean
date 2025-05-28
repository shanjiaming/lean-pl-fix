theorem mathd_algebra_129 (a : ℝ) (h₀ : a ≠ 0) (h₁ : 8⁻¹ / 4⁻¹ - a⁻¹ = 1) : a = -2:=
  by
  have h₂ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ = 1 / 2:= by
    --  --  --  --  norm_num [div_eq_mul_inv, mul_inv_rev, mul_assoc] <;> ring_nf at * <;> norm_num <;> linarith
    hole
  have h₃ : (1 : ℝ) / 2 - a⁻¹ = 1 :=
    by
    have h₃₁ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ - a⁻¹ = 1 := h₁
    rw [h₂] at h₃₁
    exact h₃₁
  have h₄ : -a⁻¹ = 1 / 2:= by
    have h₄₁ : (1 : ℝ) / 2 - a⁻¹ = 1 := h₃
    have h₄₂ : -a⁻¹ = 1 / 2:= by -- linarith
      hole
    --  exact h₄₂
    hole
  have h₅ : a⁻¹ = -(1 / 2):= by
    have h₅₁ : -a⁻¹ = 1 / 2 := h₄
    have h₅₂ : a⁻¹ = -(1 / 2):= by
      have h₅₃ : -a⁻¹ = 1 / 2 := h₄
      have h₅₄ : a⁻¹ = -(1 / 2):= by -- linarith
        hole
      --  exact h₅₄
      hole
    --  exact h₅₂
    hole
  have h₆ : a = -2:= by
    have h₆₁ : a⁻¹ = -(1 / 2) := h₅
    have h₆₂ : a = -2:= by
      have h₆₃ : a ≠ 0 := h₀
      have h₆₄ : a⁻¹ = -(1 / 2) := h₅
      have h₆₅ : a = -2:= by
        have h₆₆ : a⁻¹ = -(1 / 2) := h₆₄
        have h₆₇ : a = -2:= by
          have h₆₈ : a ≠ 0 := h₆₃
          have h₆₉ : a * a⁻¹ = 1:= by -- field_simp [h₆₈]
            hole
          --  rw [h₆₆] at h₆₉
          have h₇₀ : a * (-(1 / 2 : ℝ)) = 1:= by -- linarith
            hole
          have h₇₁ : a = -2:= by
            --  apply_fun (fun x => x * (-2)) at h₇₀
            --  ring_nf at h₇₀ ⊢
            --  nlinarith
            hole
          --  exact h₇₁
          hole
        --  exact h₆₇
        hole
      --  exact h₆₅
      hole
    --  exact h₆₂
    hole
  have h₃ : (1 : ℝ) / 2 - a⁻¹ = 1:= by
    have h₃₁ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ - a⁻¹ = 1 := h₁
    --  rw [h₂] at h₃₁
    exact h₃₁
    hole
have mathd_algebra_129 (a : ℝ) (h₀ : a ≠ 0) (h₁ : 8⁻¹ / 4⁻¹ - a⁻¹ = 1) : a = -2 :=
  by
  have h₂ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ = 1 / 2 := by sorry
  have h₃ : (1 : ℝ) / 2 - a⁻¹ = 1 :=
    by
    have h₃₁ : (8 : ℝ)⁻¹ / (4 : ℝ)⁻¹ - a⁻¹ = 1 := h₁
    rw [h₂] at h₃₁
    exact h₃₁
  have h₄ : -a⁻¹ = 1 / 2 := by
    have h₄₁ : (1 : ℝ) / 2 - a⁻¹ = 1 := h₃
    have h₄₂ : -a⁻¹ = 1 / 2 := by linarith
    exact h₄₂
  have h₅ : a⁻¹ = -(1 / 2) := by
    have h₅₁ : -a⁻¹ = 1 / 2 := h₄
    have h₅₂ : a⁻¹ = -(1 / 2) := by
      have h₅₃ : -a⁻¹ = 1 / 2 := h₄
      have h₅₄ : a⁻¹ = -(1 / 2) := by linarith
      exact h₅₄
    exact h₅₂
  have h₆ : a = -2 := by
    have h₆₁ : a⁻¹ = -(1 / 2) := h₅
    have h₆₂ : a = -2 := by
      have h₆₃ : a ≠ 0 := h₀
      have h₆₄ : a⁻¹ = -(1 / 2) := h₅
      have h₆₅ : a = -2 := by
        have h₆₆ : a⁻¹ = -(1 / 2) := h₆₄
        have h₆₇ : a = -2 := by
          have h₆₈ : a ≠ 0 := h₆₃
          have h₆₉ : a * a⁻¹ = 1 := by field_simp [h₆₈]
          rw [h₆₆] at h₆₉
          have h₇₀ : a * (-(1 / 2 : ℝ)) = 1 := by linarith
          have h₇₁ : a = -2 := by
            apply_fun (fun x => x * (-2)) at h₇₀
            ring_nf at h₇₀ ⊢
            nlinarith
          exact h₇₁
        exact h₆₇
      exact h₆₅
    exact h₆₂
  rw [h₆] <;> norm_num
  hole