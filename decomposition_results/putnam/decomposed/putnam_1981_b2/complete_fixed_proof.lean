theorem putnam_1981_b2 (P : ℝ × ℝ × ℝ → Prop) (hP : P = fun (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4) (f : ℝ × ℝ × ℝ → ℝ)
  (hf : f = fun (r, s, t) => (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2) :
  IsLeast {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} ((12 - 8 * Real.sqrt 2) : ℝ):=
  by
  have h₀ : (12 - 8 * Real.sqrt 2 : ℝ) ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y}:=
    by
    --  rw [Set.mem_setOf_eq]
    --  use Real.sqrt 2, 2, 2 * Real.sqrt 2
    --  constructor
    --  · rw [hP]
    --    constructor
      ·
        have h₁ : (1 : ℝ) ≤ Real.sqrt 2:=
          by
          have h₂ : (1 : ℝ) ≤ Real.sqrt 2:= by -- norm_num [Real.le_sqrt, Real.sqrt_le_sqrt]
            norm_num
          --  linarith
          norm_num
    --      linarith
    --    · constructor
        ·
          have h₂ : Real.sqrt 2 ≤ (2 : ℝ):=
            by
            have h₃ : Real.sqrt 2 ≤ (2 : ℝ):= by -- norm_num [Real.sqrt_le_iff]
              hole
            --  linarith
            linarith
    --        linarith
    --      · constructor
          ·
            have h₃ : (2 : ℝ) ≤ 2 * Real.sqrt 2:=
              by
              have h₄ : (2 : ℝ) ≤ 2 * Real.sqrt 2:= by -- nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by -- norm_num)]
                norm_num
              --  linarith
              norm_num
    --          linarith
          ·
            have h₄ : (2 * Real.sqrt 2 : ℝ) ≤ 4:=
              by
              have h₅ : (2 * Real.sqrt 2 : ℝ) ≤ 4:= by -- nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by -- norm_num)]
                hole
              --  linarith
              linarith
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
  have h₁ : ∀ (y : ℝ), y ∈ {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} → (12 - 8 * Real.sqrt 2 : ℝ) ≤ y:=
    by
    --  intro y hy
    --  rw [Set.mem_setOf_eq] at hy
    --  rcases hy with ⟨r, s, t, hP₁, hP₂⟩
    have h₁ : P (r, s, t) := hP₁
    have h₂ : f (r, s, t) = y := hP₂
    have h₃ : P = fun (r, s, t) => 1 ≤ r ∧ r ≤ s ∧ s ≤ t ∧ t ≤ 4 := hP
    have h₄ : f = fun (r, s, t) => (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 := hf
    --  rw [h₃] at h₁
    --  rw [h₄] at h₂
    --  simp only [Prod.mk.injEq] at h₁ h₂ ⊢
    have h₅ : 1 ≤ r:= by -- tauto
      linarith
    have h₆ : r ≤ s:= by -- tauto
      linarith
    have h₇ : s ≤ t:= by -- tauto
      linarith
    have h₈ : t ≤ 4:= by -- tauto
      linarith
    have h₉ : 0 < r:= by -- linarith
      linarith
    have h₁₀ : 0 < s:= by -- linarith
      linarith
    have h₁₁ : 0 < t:= by -- linarith
      linarith
    have h₁₂ : 0 < r * s:= by -- positivity
      nlinarith
    have h₁₃ : 0 < s * t:= by -- positivity
      nlinarith
    have h₁₄ : 0 < r * t:= by -- positivity
      nlinarith
    have h₁₅ : 0 < r * s * t:= by -- positivity
      nlinarith
    have h₁₆ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
      by
      have h₁₇ : 0 < Real.sqrt 2 := Real.sqrt_pos.mpr (by norm_num)
      have h₁₈ : 0 < Real.sqrt 2 * r:= by -- positivity
        nlinarith
      have h₁₉ : 0 < Real.sqrt 2 * s:= by -- positivity
        nlinarith
      have h₂₀ : 0 < Real.sqrt 2 * t:= by -- positivity
        nlinarith
      have h₂₁ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
        by
        have h₂₂ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
          by
          have h₂₃ : (r - 1) ^ 2 ≥ 0:= by -- positivity
            nlinarith
          have h₂₄ : (s / r - 1) ^ 2 ≥ 0:= by -- positivity
            nlinarith
          have h₂₅ : (t / s - 1) ^ 2 ≥ 0:= by -- positivity
            nlinarith
          have h₂₆ : (4 / t - 1) ^ 2 ≥ 0:= by -- positivity
            nlinarith
          have h₂₇ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
            by
            have h₂₈ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
              by
              --  by_cases h₂₉ : r * s * t = 0
              --  · exfalso
                have h₃₀ : r * s * t > 0:= by -- positivity
                  linarith
              --    linarith
              ·
                have h₃₁ : 0 < r * s * t:= by -- positivity
                  linarith
                have h₃₂ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
                  by
                  have h₃₃ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
                    by
                    have h₃₄ : (r - 1) ^ 2 + (s / r - 1) ^ 2 + (t / s - 1) ^ 2 + (4 / t - 1) ^ 2 ≥ 12 - 8 * Real.sqrt 2:=
                      by
                      --  field_simp [h₉.ne', h₁₀.ne', h₁₁.ne', h₂₉]
                      --  rw [le_div_iff (by positivity)]
                      nlinarith [Real.sqrt_nonneg 2, Real.sq_sqrt (show 0 ≤ 2 by norm_num), sq_nonneg (r - Real.sqrt 2), sq_nonneg (s - 2),
                        sq_nonneg (t - 2 * Real.sqrt 2), sq_nonneg (r - s), sq_nonneg (s - t), sq_nonneg (t - r),
                        mul_nonneg (sub_nonneg.mpr h₅) (sub_nonneg.mpr h₆), mul_nonneg (sub_nonneg.mpr h₆) (sub_nonneg.mpr h₇),
                        mul_nonneg (sub_nonneg.mpr h₇) (sub_nonneg.mpr h₅), mul_nonneg (sq_nonneg (r - Real.sqrt 2)) (sub_nonneg.mpr h₅),
                        mul_nonneg (sq_nonneg (s - 2)) (sub_nonneg.mpr h₆),
                        mul_nonneg (sq_nonneg (t - 2 * Real.sqrt 2)) (sub_nonneg.mpr h₇),
                        mul_nonneg (sq_nonneg (r - s)) (sub_nonneg.mpr h₅), mul_nonneg (sq_nonneg (s - t)) (sub_nonneg.mpr h₆),
                        mul_nonneg (sq_nonneg (t - r)) (sub_nonneg.mpr h₇)]
                      hole
                    --  linarith
                    linarith
                  --  linarith
                  linarith
              --    linarith
              hole
            --  linarith
            linarith
          --  linarith
          linarith
        --  linarith
        linarith
      --  linarith
      linarith
    --  linarith
    hole
  have h₂ : IsLeast {y | ∃ r s t, P (r, s, t) ∧ f (r, s, t) = y} ((12 - 8 * Real.sqrt 2) : ℝ):=
    by
    --  refine' ⟨h₀, _⟩
    --  intro y hy
    have h₃ : (12 - 8 * Real.sqrt 2 : ℝ) ≤ y := h₁ y hy
    --  linarith
    hole
  --  exact h₂
  simpa