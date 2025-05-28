theorem h₆ (S : ℝ → Set (EuclideanSpace ℝ (Fin 2))) (hS : S = fun R => ball 0 R) (I : ℝ → ℝ) (hI :  I = fun R =>    ∫ (p : EuclideanSpace ℝ (Fin 2)) in S R,      (1 + 2 * p 0 ^ 2) / (1 + p 0 ^ 4 + 6 * p 0 ^ 2 * p 1 ^ 2 + p 1 ^ 4) - (1 + p 1 ^ 2) / (2 + p 0 ^ 4 + p 1 ^ 4)) (R : ℝ) (p : EuclideanSpace ℝ (Fin 2)) : (1 + 2 * p 0 ^ 2) / (1 + p 0 ^ 4 + 6 * p 0 ^ 2 * p 1 ^ 2 + p 1 ^ 4) - (1 + p 1 ^ 2) / (2 + p 0 ^ 4 + p 1 ^ 4) = 0 :=
  by
  --  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
  --    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  --  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
  --      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
  --  --      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 1 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 1 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₁₀ : (p 1 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 1 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₉ : (p 1 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          have h₈ : (p 0 : ℝ) = 0 := by sorry
have h₆ :
  (1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
      (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4) =
    0 :=
  by
  by_cases h₇ : (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4 : ℝ) = 0
  ·
    have h₈ : (p 0 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    have h₉ : (p 1 : ℝ) = 0 := by
      nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
    simp_all [h₈, h₉] <;> ring_nf <;> norm_num
  · by_cases h₈ : (2 + (p 0) ^ 4 + (p 1) ^ 4 : ℝ) = 0
    ·
      have h₉ : (p 0 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      have h₁₀ : (p 1 : ℝ) = 0 := by
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2)]
      simp_all [h₉, h₁₀] <;> ring_nf <;> norm_num
    ·
      field_simp at h₇ h₈ ⊢ <;> ring_nf at h₇ h₈ ⊢ <;>
        nlinarith [sq_nonneg (p 0), sq_nonneg (p 1), sq_nonneg ((p 0 : ℝ) ^ 2 - (p 1 : ℝ) ^ 2),
          sq_nonneg ((p 0 : ℝ) ^ 2 + (p 1 : ℝ) ^ 2), sq_nonneg ((p 0 : ℝ) ^ 2 - 1), sq_nonneg ((p 1 : ℝ) ^ 2 - 1)]
  hole