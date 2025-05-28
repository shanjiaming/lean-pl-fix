theorem amc12b_2021_p4 (m a : ℕ) (h₀ : 0 < m ∧ 0 < a) (h₁ : ↑m / ↑a = (3 : ℝ) / 4) :
  (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ):=
  by
  have h₂ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ):=
    by
    have h₂₁ : (m : ℝ) / (a : ℝ) = (3 : ℝ) / 4 := h₁
    have h₂₂ : (a : ℝ) ≠ 0:= by
      have h₂₂₁ : 0 < a := h₀.2
      --  exact_mod_cast (by linarith)
      linarith
    have h₂₃ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ):= by -- field_simp at h₂₁ <;> ring_nf at h₂₁ ⊢ <;> nlinarith
      hole
    --  exact h₂₃
    hole
  have h₃ : (4 : ℕ) * m = (3 : ℕ) * a:=
    by
    have h₃₁ : (4 : ℕ) * m = (3 : ℕ) * a:= by
      --  norm_cast at h₂ ⊢ <;> (try norm_num) <;> (try ring_nf at h₂ ⊢) <;> (try field_simp at h₂ ⊢) <;>
                    (try norm_cast at h₂ ⊢) <;>
                  (try ring_nf at h₂ ⊢) <;>
                (try norm_num at h₂ ⊢) <;>
              (try nlinarith) <;>
            (try omega) <;>
          (try {
              have h₃₂ : a > 0 := by linarith
              have h₃₃ : m > 0 := by linarith
              norm_cast at h₂ ⊢ <;> ring_nf at h₂ ⊢ <;> norm_num at h₂ ⊢ <;> nlinarith
            }) <;>
        (try {norm_num at h₂ ⊢ <;> nlinarith
          })
      hole
    --  exact h₃₁
    linarith
  have h₄ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)):=
    by
    have h₄₁ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := h₂
    have h₄₂ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)):=
      by
      have h₄₃ : (a : ℝ) = (4 : ℝ) * (m : ℝ) / 3:=
        by
        have h₄₄ : (4 : ℝ) * (m : ℝ) = (3 : ℝ) * (a : ℝ) := h₂
        --  linarith
        hole
      --  rw [h₄₃]
      ring_nf <;> field_simp <;> ring_nf at h₄₁ ⊢ <;> nlinarith
      hole
    --  exact h₄₂
    hole
  have h₅ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ):=
    by
    have h₅₁ : (m : ℝ) + (a : ℝ) ≠ 0:=
      by
      have h₅₂ : 0 < (m : ℝ):= by -- exact_mod_cast h₀.1
        linarith
      have h₅₃ : 0 < (a : ℝ):= by -- exact_mod_cast h₀.2
        linarith
      have h₅₄ : 0 < (m : ℝ) + (a : ℝ):= by -- linarith
        linarith
      --  exact ne_of_gt h₅₄
      linarith
    have h₅₂ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ):=
      by
      have h₅₃ : (84 : ℝ) * (m : ℝ) + (70 : ℝ) * (a : ℝ) = (76 : ℝ) * ((m : ℝ) + (a : ℝ)) := h₄
      have h₅₄ : (84 * ↑m + 70 * ↑a) / (↑m + ↑a) = (76 : ℝ):=
        by
        --  rw [show (84 * ↑m + 70 * ↑a : ℝ) = (76 : ℝ) * ((↑m + ↑a : ℝ)) by linarith]
        field_simp [h₅₁] <;> ring_nf <;> field_simp [h₅₁] <;> linarith
        hole
      --  exact h₅₄
      hole
    --  exact h₅₂
    hole
  --  exact h₅
  hole