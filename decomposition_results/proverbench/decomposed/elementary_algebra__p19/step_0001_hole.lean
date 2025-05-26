theorem inequality_statement (a b c s : ℝ) : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ 3 / 2 * a * b * c :=
  by
  have h₁ :
    a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) := by
    ring_nf <;> (try norm_num) <;> (try linarith) <;>
      (try nlinarith [sq_nonneg (a + b + c), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)])
  have h₂ : s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) ≤ (3 / 2) * a * b * c := by sorry
  have h₃ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by sorry
  have h₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) := by sorry
have inequality_statement {a b c s : ℝ} : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c :=
  by
  have h₁ :
    a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) := by
    ring_nf <;> (try norm_num) <;> (try linarith) <;>
      (try nlinarith [sq_nonneg (a + b + c), sq_nonneg (a - b), sq_nonneg (b - c), sq_nonneg (c - a)])
  have h₂ : s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) ≤ (3 / 2) * a * b * c :=
    by
    have h₂₁ : a = 0 := by
      by_contra h₂₁
      by_contra h₂₂
      by_contra h₂₃
      have h₂₄ := h₁
      have h₂₅ : a ≠ 0 := h₂₁
      have h₂₆ : b ≠ 0 := h₂₂
      have h₂₇ : c ≠ 0 := h₂₃
      have h₂₈ := h₁
      have h₂₉ := h₁
      have h₃₀ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by
        nlinarith [sq_pos_of_ne_zero h₂₅, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b),
          sq_nonneg (b - c), sq_nonneg (c - a)]
      nlinarith [sq_pos_of_ne_zero h₂₅, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b),
        sq_nonneg (b - c), sq_nonneg (c - a)]
    have h₂₂ : b = 0 := by
      by_contra h₂₂
      by_contra h₂₃
      by_contra h₂₄
      have h₂₅ := h₁
      have h₂₆ : b ≠ 0 := h₂₂
      have h₂₇ : a ≠ 0 := by
        by_contra h₂₇
        simp_all <;> nlinarith
      have h₂₈ : c ≠ 0 := h₂₃
      have h₂₉ := h₁
      have h₃₀ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by
        nlinarith [sq_pos_of_ne_zero h₂₇, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₈, sq_nonneg (a - b),
          sq_nonneg (b - c), sq_nonneg (c - a)]
      nlinarith [sq_pos_of_ne_zero h₂₇, sq_pos_of_ne_zero h₂₆, sq_pos_of_ne_zero h₂₈, sq_nonneg (a - b),
        sq_nonneg (b - c), sq_nonneg (c - a)]
    have h₂₃ : c = 0 := by
      by_contra h₂₃
      by_contra h₂₄
      by_contra h₂₅
      have h₂₆ := h₁
      have h₂₇ : c ≠ 0 := h₂₃
      have h₂₈ : a ≠ 0 := by
        by_contra h₂₈
        simp_all <;> nlinarith
      have h₂₉ : b ≠ 0 := by
        by_contra h₂₉
        simp_all <;> nlinarith
      have h₃₀ := h₁
      have h₃₁ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c := by
        nlinarith [sq_pos_of_ne_zero h₂₈, sq_pos_of_ne_zero h₂₉, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b),
          sq_nonneg (b - c), sq_nonneg (c - a)]
      nlinarith [sq_pos_of_ne_zero h₂₈, sq_pos_of_ne_zero h₂₉, sq_pos_of_ne_zero h₂₇, sq_nonneg (a - b),
        sq_nonneg (b - c), sq_nonneg (c - a)]
    simp_all <;> nlinarith <;> nlinarith
  have h₃ : a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) ≤ (3 / 2) * a * b * c :=
    by
    have h₄ :
      a ^ 2 * (s - a) + b ^ 2 * (s - b) + c ^ 2 * (s - c) = s * (a ^ 2 + b ^ 2 + c ^ 2) - (a ^ 3 + b ^ 3 + c ^ 3) := by
      rw [h₁]
    rw [h₄]
    exact h₂
  apply h₃
  hole