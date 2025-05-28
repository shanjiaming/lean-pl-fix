theorem h_main  : ∀ N ≥ 2, ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1) = 2 * (↑N ^ 2 + ↑N + 1) / (3 * ↑N * (↑N + 1)) :=
  by
  --  intro N hN
  have h₁ :
    ∀ (n : ℤ),
      n ≥ 2 →
        ((n : ℝ) ^ 3 - 1 : ℝ) / ((n : ℝ) ^ 3 + 1 : ℝ) =
          ((n : ℝ) - 1) / ((n : ℝ) + 1) * (((n : ℝ) + 1) ^ 2 - ((n : ℝ) + 1) + 1) / ((n : ℝ) ^ 2 - (n : ℝ) + 1) := by sorry
  have h₂ :
    ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  --  exact h₂ <;>
      (try {simp_all
        }) <;>
    (try
        {field_simp <;> ring_nf <;> norm_cast <;>
                  simp_all [Int.toNat_of_nonneg, Int.toNat_of_nonpos, Int.ofNat_le, Int.ofNat_lt, Int.ofNat_zero,
                    Int.ofNat_succ, Int.emod_eq_of_lt] <;>
                (try omega) <;>
              (try {norm_num at * <;> omega
                }) <;>
            (try {linarith
              }) <;>
          (try {ring_nf at * <;> omega
            })
      })
  hole