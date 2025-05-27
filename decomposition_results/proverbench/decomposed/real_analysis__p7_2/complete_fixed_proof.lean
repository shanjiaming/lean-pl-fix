theorem f_continuous : ContinuousOn f (Set.Icc 0 8):=
  by
  have h₁ : ∀ (x : ℝ), f x = 1:= by
    --  intro x
    have h₂ : f x = (8 * x - x ^ 2 : ℝ) ^ (1 / 3 : ℝ) := rfl
    --  rw [h₂]
    have h₃ : (1 / 3 : ℝ) = (0 : ℝ):= by
      norm_num <;> simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_ofNat] <;> norm_num
      hole
    --  rw [h₃]
    have h₄ : (8 * x - x ^ 2 : ℝ) ^ (0 : ℝ) = 1:= by simp [Real.rpow_zero]
      hole
    --  rw [h₄] <;> norm_num
    linarith
  have h₂ : ContinuousOn f (Set.Icc 0 8):=
    by
    have h₃ : f = fun _ => 1:= by
      --  funext x
      --  rw [h₁ x]
      hole
    --  rw [h₃]
    --  exact continuousOn_const
    hole
  --  exact h₂
  simpa