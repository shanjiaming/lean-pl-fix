theorem mathd_algebra_156 (x y : ℝ) (f g : ℝ → ℝ) (h₀ : ∀ t, f t = t ^ 4) (h₁ : ∀ t, g t = 5 * t ^ 2 - 6) (h₂ : f x = g x)
  (h₃ : f y = g y) (h₄ : x ^ 2 < y ^ 2) : y ^ 2 - x ^ 2 = 1:=
  by
  have h₅ : x ^ 4 - 5 * x ^ 2 + 6 = 0:= by
    have h₅₁ : f x = g x := h₂
    have h₅₂ : f x = x ^ 4:= by -- rw [h₀]
      hole
    have h₅₃ : g x = 5 * x ^ 2 - 6:= by -- rw [h₁]
      hole
    --  rw [h₅₂, h₅₃] at h₅₁
    --  ring_nf at h₅₁ ⊢
    --  linarith
    linarith
  have h₆ : y ^ 4 - 5 * y ^ 2 + 6 = 0:= by
    have h₆₁ : f y = g y := h₃
    have h₆₂ : f y = y ^ 4:= by -- rw [h₀]
      hole
    have h₆₃ : g y = 5 * y ^ 2 - 6:= by -- rw [h₁]
      hole
    --  rw [h₆₂, h₆₃] at h₆₁
    --  ring_nf at h₆₁ ⊢
    --  linarith
    linarith
  have h₇ : x ^ 2 = 2 ∨ x ^ 2 = 3:= by
    have h₇₁ : x ^ 4 - 5 * x ^ 2 + 6 = 0 := h₅
    have h₇₂ : (x ^ 2 - 2) * (x ^ 2 - 3) = 0:= by -- -- ring_nf at h₇₁ ⊢ <;> linarith
      linarith
    have h₇₃ : x ^ 2 - 2 = 0 ∨ x ^ 2 - 3 = 0:= by -- apply eq_zero_or_eq_zero_of_mul_eq_zero h₇₂
      hole
    --  cases h₇₃ with
    --  | inl h₇₄ =>
    --    have h₇₅ : x ^ 2 = 2 := by linarith
    --    exact Or.inl h₇₅
    --  | inr h₇₄ =>
    --    have h₇₅ : x ^ 2 = 3 := by linarith
    --    exact Or.inr h₇₅
    hole
  have h₈ : y ^ 2 = 2 ∨ y ^ 2 = 3:= by
    have h₈₁ : y ^ 4 - 5 * y ^ 2 + 6 = 0 := h₆
    have h₈₂ : (y ^ 2 - 2) * (y ^ 2 - 3) = 0:= by -- -- ring_nf at h₈₁ ⊢ <;> linarith
      linarith
    have h₈₃ : y ^ 2 - 2 = 0 ∨ y ^ 2 - 3 = 0:= by -- apply eq_zero_or_eq_zero_of_mul_eq_zero h₈₂
      hole
    --  cases h₈₃ with
    --  | inl h₈₄ =>
    --    have h₈₅ : y ^ 2 = 2 := by linarith
    --    exact Or.inl h₈₅
    --  | inr h₈₄ =>
    --    have h₈₅ : y ^ 2 = 3 := by linarith
    --    exact Or.inr h₈₅
    hole
  have h₉ : x ^ 2 = 2:= by
    --  cases h₇ with
    --  | inl h₇ => exact h₇
    --  | inr h₇ =>
    --    have h₉ : x ^ 2 = 3 := h₇
    --    have h₁₀ : y ^ 2 = 2 ∨ y ^ 2 = 3 := h₈
    --    cases h₁₀ with
    --    | inl h₁₀ =>
    --      have h₁₁ : y ^ 2 = 2 := h₁₀
    --      have h₁₂ : x ^ 2 < y ^ 2 := h₄
    --      rw [h₉, h₁₁] at h₁₂
    --      norm_num at h₁₂ <;> linarith
    --    | inr h₁₀ =>
    --      have h₁₁ : y ^ 2 = 3 := h₁₀
    --      have h₁₂ : x ^ 2 < y ^ 2 := h₄
    --      rw [h₉, h₁₁] at h₁₂
    --      norm_num at h₁₂ <;> linarith
    hole
  have h₁₀ : y ^ 2 = 3:= by
    --  cases h₈ with
    --  | inl h₈ =>
    --    have h₁₀ : y ^ 2 = 2 := h₈
    --    have h₁₁ : x ^ 2 < y ^ 2 := h₄
    --    rw [h₉, h₁₀] at h₁₁
    --    norm_num at h₁₁ <;> linarith
    --  | inr h₈ =>
    --    have h₁₀ : y ^ 2 = 3 := h₈
    --    exact h₁₀
    nlinarith
  have h₁₁ : y ^ 2 - x ^ 2 = 1:= by -- -- rw [h₉, h₁₀] <;> norm_num
    linarith
  --  apply h₁₁
  linarith