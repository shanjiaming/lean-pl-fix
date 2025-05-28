theorem h₀ (P : ℝ × ℝ × ℝ → Prop) (hP :  P = fun x =>    match x with    | (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4) (f : ℝ × ℝ × ℝ → ℝ) (hf :  f = fun x =>    match x with    | (r, s, t) => (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2) : 12 - 8 * √2 ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} :=
  by
  --  rw [Set.mem_setOf_eq]
  --  use Real.sqrt 2, 2, 2 * Real.sqrt 2
  --  constructor
  --  · rw [hP]
  --    constructor
    ·
      have h₁ : (1 : ℝ) ≤ Real.sqrt 2 := by sorry
  --      linarith
  --    · constructor
      ·
        have h₂ : Real.sqrt 2 ≤ (2 : ℝ) := by sorry
  --        linarith
  --      · constructor
        ·
          have h₃ : (2 : ℝ) ≤ 2 * Real.sqrt 2 := by sorry
  --          linarith
        ·
          have h₄ : (2 * Real.sqrt 2 : ℝ) ≤ 4 := by sorry
  --          linarith
  --  · rw [hf]
    have h₁ : (Real.sqrt 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by sorry
    have h₂ : ((2 : ℝ) / Real.sqrt 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by sorry
    have h₃ : ((2 * Real.sqrt 2 : ℝ) / 2 - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by sorry
    have h₄ : ((4 : ℝ) / (2 * Real.sqrt 2) - 1 : ℝ) ^ 2 = 3 - 2 * Real.sqrt 2 := by sorry
    have h₅ :
      ((Real.sqrt 2 - 1 : ℝ) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1 : ℝ) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1 : ℝ) ^ 2 +
            ((4 : ℝ) / (2 * Real.sqrt 2) - 1 : ℝ) ^ 2 :
          ℝ) =
        12 - 8 * Real.sqrt 2 := by sorry
    have h₆ :
      ((Real.sqrt 2 : ℝ) - 1) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1) ^ 2 +
          ((4 : ℝ) / (2 * Real.sqrt 2) - 1) ^ 2 =
        12 - 8 * Real.sqrt 2 := by sorry
    have h₇ :
      ((Real.sqrt 2 : ℝ) - 1) ^ 2 + ((2 : ℝ) / Real.sqrt 2 - 1) ^ 2 + ((2 * Real.sqrt 2 : ℝ) / 2 - 1) ^ 2 +
          ((4 : ℝ) / (2 * Real.sqrt 2) - 1) ^ 2 =
        12 - 8 * Real.sqrt 2 := by sorry
  --    simp_all [h₁, h₂, h₃, h₄, h₅, h₆, h₇] <;> ring_nf at * <;> norm_num at * <;>
      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num)]
  hole