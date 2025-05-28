theorem h₅₄ (a : ℕ → ℕ → ℝ) (ha : ∀ (i j : ℕ), a i j ∈ Icc 0 1) (m n : ℕ) (mnpos : m > 0 ∧ n > 0) (h₁ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≤ ↑m * ↑i) (h₂ : ∀ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i ≤ ↑m) (h₃ : ∑ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i ≤ ↑m * ↑n) (h₄ : (∑ i ∈ Finset.Icc 1 n, ∑ j ∈ Finset.Icc 1 (m * i), a i j / ↑i) ^ 2 ≤ (↑m * ↑n) ^ 2) (h₅₁ : ↑m ≥ 1) (h₅₂ : ↑n ≥ 1) : ∀ k ≥ 1, ∑ i ∈ Finset.Icc 1 k, ∑ j ∈ Finset.Icc 1 (m * i), a i j ≥ ↑m * ↑k * ↑k / 2 :=
  by
  intro k hk
  induction' hk with k hk IH
  · norm_num [Finset.sum_Icc_succ_top, Finset.sum_range_succ] at *
    have h₅₅ := ha 1 1
    have h₅₆ := ha 1 0
    norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ ⊢ <;> (try norm_num at h₅₅ h₅₆ ⊢) <;> (try linarith) <;>
                      (try nlinarith) <;>
                    (try ring_nf at h₅₅ h₅₆ ⊢) <;>
                  (try norm_cast at h₅₅ h₅₆ ⊢) <;>
                (try linarith) <;>
              (try nlinarith) <;>
            (try ring_nf at h₅₅ h₅₆ ⊢) <;>
          (try norm_cast at h₅₅ h₅₆ ⊢) <;>
        (try linarith) <;>
      (try nlinarith)
  ·
    simp_all [Finset.sum_Icc_succ_top, Finset.sum_range_succ, Nat.cast_add, Nat.cast_one, Nat.cast_zero] <;>
                                  norm_num at * <;>
                                (try linarith) <;>
                              (try nlinarith) <;>
                            (try ring_nf at *) <;>
                          (try norm_cast at *) <;>
                        (try linarith) <;>
                      (try nlinarith) <;>
                    (try ring_nf at *) <;>
                  (try norm_cast at *) <;>
                (try linarith) <;>
              (try nlinarith) <;>
            (try {
                have h₅₅ := ha (k + 1) 0
                have h₅₆ := ha (k + 1) 1
                have h₅₇ := ha (k + 1) (m * (k + 1))
                norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
                            (try linarith) <;>
                          (try nlinarith) <;>
                        (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
                      (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
                    (try linarith) <;>
                  (try nlinarith)
              }) <;>
          (try {
              have h₅₅ := ha (k + 1) 0
              have h₅₆ := ha (k + 1) 1
              have h₅₇ := ha (k + 1) (m * (k + 1))
              norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
                          (try linarith) <;>
                        (try nlinarith) <;>
                      (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
                    (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
                  (try linarith) <;>
                (try nlinarith)
            }) <;>
        (try {
            have h₅₅ := ha (k + 1) 0
            have h₅₆ := ha (k + 1) 1
            have h₅₇ := ha (k + 1) (m * (k + 1))
            norm_num [Finset.mem_Icc, Finset.mem_singleton] at h₅₅ h₅₆ h₅₇ ⊢ <;> (try norm_num at h₅₅ h₅₆ h₅₇ ⊢) <;>
                        (try linarith) <;>
                      (try nlinarith) <;>
                    (try ring_nf at h₅₅ h₅₆ h₅₇ ⊢) <;>
                  (try norm_cast at h₅₅ h₅₆ h₅₇ ⊢) <;>
                (try linarith) <;>
              (try nlinarith)
          }) <;>
      linarith