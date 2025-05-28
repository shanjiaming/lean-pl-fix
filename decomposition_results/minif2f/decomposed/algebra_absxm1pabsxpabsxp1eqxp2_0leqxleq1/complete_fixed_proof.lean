theorem algebra_absxm1pabsxpabsxp1eqxp2_0leqxleq1 (x : ℝ) (h₀ : abs (x - 1) + abs x + abs (x + 1) = x + 2) :
  0 ≤ x ∧ x ≤ 1:=
  by
  have h₁ : 0 ≤ x:= by
    --  by_contra h
    have h₂ : x < 0:= by -- linarith
      linarith
    --  by_cases h₃ : x < -1
    ·
      have h₄ : abs (x - 1) = -(x - 1):= by -- rw [abs_of_neg (by linarith)] <;> linarith
        hole
      have h₅ : abs x = -x:= by -- rw [abs_of_neg (by linarith)]
        hole
      have h₆ : abs (x + 1) = -(x + 1):= by -- rw [abs_of_neg (by linarith)] <;> linarith
        hole
    --    rw [h₄, h₅, h₆] at h₀
      have h₇ : -(x - 1) + -x + -(x + 1) = x + 2:= by -- linarith
        linarith
      have h₈ : x = -1 / 2:= by -- linarith
        linarith
    --    linarith
    ·
      have h₄ : x ≥ -1 := by sorry
      have h₅ : abs (x - 1) = -(x - 1) := by sorry
      have h₆ : abs x = -x := by sorry
      have h₇ : abs (x + 1) = x + 1 := by sorry
    --    rw [h₅, h₆, h₇] at h₀
      have h₈ : -(x - 1) + -x + (x + 1) = x + 2 := by sorry
      have h₉ : x = 0:= by -- linarith
        linarith
    --    linarith
    hole
  have h₂ : x ≤ 1:= by
    --  by_contra h
    have h₃ : x > 1:= by -- linarith
      linarith
    have h₄ : abs (x - 1) = x - 1:= by -- rw [abs_of_nonneg (by linarith)]
      hole
    have h₅ : abs x = x:= by -- rw [abs_of_nonneg (by linarith)]
      simpa
    have h₆ : abs (x + 1) = x + 1:= by -- rw [abs_of_nonneg (by linarith)]
      hole
    --  rw [h₄, h₅, h₆] at h₀
    have h₇ : x = 1:= by -- linarith
      linarith
    --  linarith
    linarith
  have h₃ : 0 ≤ x ∧ x ≤ 1:= by -- exact ⟨h₁, h₂⟩
    norm_cast
  --  exact h₃
  simpa