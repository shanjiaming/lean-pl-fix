theorem derivative_f : ∀ x ∈ Set.Ioo 0 8, HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x:=
  by
  --  intro x hx
  have h₁ : 0 < x:= by exact hx.1
    hole
  have h₂ : x < 8:= by exact hx.2
    hole
  have h₃ : 8 * x - x ^ 2 > 0:= by
    have h₃₁ : 0 < x := h₁
    have h₃₂ : x < 8 := h₂
    have h₃₃ : 0 < 8 - x:= by linarith
      hole
    have h₃₄ : 0 < x * (8 - x):= by positivity
      hole
    have h₃₅ : 8 * x - x ^ 2 = x * (8 - x):= by ring
      hole
    rw [h₃₅]
    nlinarith
    hole
  have h₄ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x:=
    by
    have h₄₁ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x:=
      by
      have h₄₂ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x:=
        by
        have h₄₃ : HasDerivAt (fun x : ℝ => (8 * x : ℝ)) 8 x:= by simpa using (hasDerivAt_id x).const_mul 8
          hole
        have h₄₄ : HasDerivAt (fun x : ℝ => (x ^ 2 : ℝ)) (2 * x) x:= by simpa using (hasDerivAt_pow 2 x)
          hole
        have h₄₅ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x:= by convert h₄₃.sub h₄₄ using 1 <;> ring
          hole
        exact h₄₅
        hole
      exact h₄₂
      hole
    exact h₄₁
    hole
  have h₅ : HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x:=
    by
    have h₅₁ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x := h₄
    have h₅₂ : HasDerivAt (fun x : ℝ => (8 * x - x ^ 2 : ℝ)) (8 - 2 * x) x := h₄
    have h₅₃ :
      HasDerivAt (fun y : ℝ => (y : ℝ) ^ (1 / 3 : ℝ)) ((1 / 3 : ℝ) * (8 * x - x ^ 2 : ℝ) ^ (-2 / 3 : ℝ))
        (8 * x - x ^ 2 : ℝ) := by sorry
    have h₅₆ : HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2 : ℝ) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x:=
      by
      have h₅₇ : HasDerivAt f ((1 / 3 : ℝ) * (8 * x - x ^ 2 : ℝ) ^ (-2 / 3 : ℝ) * (8 - 2 * x)) x:= by
        convert HasDerivAt.comp x h₅₃ h₅₁ using 1 <;> simp [f, mul_assoc, mul_comm, mul_left_comm] <;> ring_nf <;>
                field_simp <;>
              ring_nf <;>
            norm_num <;>
          linarith
        hole
      exact h₅₇
      hole
    exact h₅₆
    hole
  --  exact h₅
  hole