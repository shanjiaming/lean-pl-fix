theorem h₄ (n✝ n : ℕ) (h₂ :  ∀ k ≥ 1,    6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 ^ k / (3 ^ k - 2 ^ k) - 2 ^ (k + 1) / (3 ^ (k + 1) - 2 ^ (k + 1))) : ∀ (n : ℕ),
    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =
      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
  by
  intro n
  induction n with
  | zero => norm_num [Finset.sum_Icc_succ_top]
  | succ n ih =>
    rw [Finset.sum_Icc_succ_top (by norm_num : 1 ≤ n.succ + 1)]
    rw [ih]
    have h₅ := h₂ (n + 1) (by omega)
    have h₆ := h₂ (n + 2) (by omega)
    simp_all [Finset.sum_Icc_succ_top, pow_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero, Nat.cast_succ] <;>
                field_simp at * <;>
              ring_nf at * <;>
            norm_num at * <;>
          (try omega) <;>
        (try
            {by_cases h₇ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) = 0 <;> by_cases h₈ : (3 : ℚ) ^ (n + 2) - 2 ^ (n + 2) = 0 <;>
                    by_cases h₉ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0 <;>
                  by_cases h₁₀ : (3 : ℚ) ^ (n + 2) - 2 ^ (n + 2) > 0 <;>
                simp_all [sub_eq_zero, sub_pos] <;>
              nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) (n + 1), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 1),
                pow_pos (by norm_num : (0 : ℚ) < 2) (n + 2), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 2)]
          }) <;>
      (try
          {ring_nf at * <;> field_simp at * <;>
            nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) (n + 1), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 1),
              pow_pos (by norm_num : (0 : ℚ) < 2) (n + 2), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 2)]
        })
  hole