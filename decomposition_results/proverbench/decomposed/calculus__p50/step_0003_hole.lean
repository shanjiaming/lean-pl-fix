theorem h₂ (f : ℝ → ℝ) : ∫ (x : ℝ) in 0 ..π / 2, x * sin x = 1 :=
  by
  rw [intervalIntegral.integral_eq_sub_of_hasDerivAt
      (fun x _ =>
        by
        have h₃ : HasDerivAt (fun x : ℝ => x * sin x) (x * cos x + sin x) x :=
          by
          have h₄ : HasDerivAt (fun x : ℝ => x) 1 x := by simpa using (hasDerivAt_id x)
          have h₅ : HasDerivAt (fun x : ℝ => sin x) (cos x) x := by simpa using (hasDerivAt_sin x)
          have h₆ : HasDerivAt (fun x : ℝ => x * sin x) (x * cos x + sin x) x := by convert h₄.mul h₅ using 1 <;> ring
          exact h₆
        convert h₃ using 1 <;> ring)
      (by
        apply Continuous.continuousOn
        exact by continuity)]
  simp [sin_zero, cos_pi_div_two, sin_pi_div_two, mul_comm] <;> ring_nf <;> field_simp [Real.pi_pos.le] <;> ring_nf <;>
      norm_num <;>
    linarith [Real.pi_gt_three]
  hole