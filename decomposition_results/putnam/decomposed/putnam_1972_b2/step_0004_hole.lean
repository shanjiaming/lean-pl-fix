theorem h₂ (s v : ℝ) (hs : s > 0) (hv : v > 0) (valid : ℝ → (ℝ → ℝ) → Prop) (hvalid :  ∀ (t : ℝ) (x : ℝ → ℝ),    valid t x ↔      DifferentiableOn ℝ x (Set.Icc 0 t) ∧        DifferentiableOn ℝ (deriv x) (Set.Icc 0 t) ∧          AntitoneOn (deriv (deriv x)) (Set.Icc 0 t) ∧ deriv x 0 = 0 ∧ deriv x t = v ∧ x t - x 0 = s) : valid (2 * s / v) fun u => v ^ 2 / (4 * s) * u ^ 2 :=
  by
  --  rw [hvalid]
  --  constructor
  --  · apply DifferentiableOn.mul
  --    · exact differentiableOn_const _
  --    · exact differentiableOn_pow 2
  --  · constructor
    ·
      have h₃ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by sorry
  --      rw [h₃]
  --      apply DifferentiableOn.mul
  --      · exact differentiableOn_const _
  --      · exact DifferentiableOn.mul (differentiableOn_const _) differentiableOn_id
  --    · constructor
      ·
        have h₄ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by sorry
        have h₅ : deriv (deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2)) = fun u => (v ^ 2 / (4 * s)) * 2 := by sorry
  --        rw [h₅]
  --        intro x hx y hy hxy
  --        simp_all [AntitoneOn, Set.mem_Icc] <;> norm_num <;> linarith
  --      · constructor
        ·
          have h₆ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0 = 0 := by sorry
  --          exact h₆
  --        · constructor
          ·
            have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) = v := by sorry
  --            exact h₇
          ·
            have h₈ :
              ((fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) - (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0) = s :=
              by
              have h₉ : (v ^ 2 / (4 * s)) * (2 * s / v) ^ 2 - (v ^ 2 / (4 * s)) * 0 ^ 2 = s := by
                field_simp [mul_comm] <;> ring_nf <;> field_simp [mul_comm] <;> ring_nf <;> nlinarith
              simpa using h₉
            have h₈ : ((fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) - (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0) = s := by sorry
have h₂ : valid (2 * s / v) (fun u => (v ^ 2 / (4 * s)) * u ^ 2) :=
  by
  rw [hvalid]
  constructor
  · apply DifferentiableOn.mul
    · exact differentiableOn_const _
    · exact differentiableOn_pow 2
  · constructor
    ·
      have h₃ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by sorry
      rw [h₃]
      apply DifferentiableOn.mul
      · exact differentiableOn_const _
      · exact DifferentiableOn.mul (differentiableOn_const _) differentiableOn_id
    · constructor
      ·
        have h₄ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) = fun u => (v ^ 2 / (4 * s)) * (2 * u) := by sorry
        have h₅ : deriv (deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2)) = fun u => (v ^ 2 / (4 * s)) * 2 := by sorry
        rw [h₅]
        intro x hx y hy hxy
        simp_all [AntitoneOn, Set.mem_Icc] <;> norm_num <;> linarith
      · constructor
        ·
          have h₆ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0 = 0 := by sorry
          exact h₆
        · constructor
          ·
            have h₇ : deriv (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) = v := by sorry
            exact h₇
          ·
            have h₈ :
              ((fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) (2 * s / v) - (fun u : ℝ => (v ^ 2 / (4 * s)) * u ^ 2) 0) = s :=
              by
              have h₉ : (v ^ 2 / (4 * s)) * (2 * s / v) ^ 2 - (v ^ 2 / (4 * s)) * 0 ^ 2 = s := by
                field_simp [mul_comm] <;> ring_nf <;> field_simp [mul_comm] <;> ring_nf <;> nlinarith
              simpa using h₉
            exact h₈
  hole