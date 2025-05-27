theorem dirichlet_theorem' {α : ℝ} (hα : Irrational α) {n : ℕ} (hn : 0 < n) :
  ∃ p q : ℤ, 0 < q ∧ q ≤ n ∧ |α - p / q| < 1 / ((n + 1) * q):=
  by
  have h_main : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ):=
    by
    have h₁ : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ):=
      by
      have h₂ :
        ∃ (i j : ℕ),
          i < j ∧ j ≤ n ∧ |(j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ) := by sorry
      obtain ⟨i, j, hij, hj, hdiff⟩ := h₂
      by_cases h : i = 0
      · use j, round ((j : ℝ) * α)
        have hj' : 0 < j:= by
          by_contra h₁
          have h₂ : j = 0:= by omega
            hole
          simp_all <;> (try norm_num at * <;> simp_all [abs_mul, abs_of_nonneg, abs_of_nonpos, le_of_lt]) <;> (try linarith)
          hole
        have hj'' : j ≤ n:= by linarith
          hole
        constructor
        · exact_mod_cast hj'
        constructor
        · exact hj''
        · simpa [h, abs_sub_lt_iff] using hdiff
      · use j - i, round ((j : ℝ) * α) - round ((i : ℝ) * α)
        have h₁ : 0 < j - i:= by omega
          hole
        have h₂ :
          ∃ (i j : ℕ),
            i < j ∧ j ≤ n ∧ |(j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ):=
          by
          set f : ℕ → ℝ := fun k => (k : ℝ) * α - round ((k : ℝ) * α)
          have h₃ : ∃ (i j : ℕ), i < j ∧ j ≤ n ∧ |f j - f i| < 1 / (n + 1 : ℝ):= fun k => ↑k * α - ↑(round (↑k * α))) : ∃ i j, i < j ∧ j ≤ n ∧ |f j - f i| < 1 / (↑n + 1) :=
            by
            by_contra h
            push_neg at h
            have h₄ : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (n + 1 : ℝ) ≤ |f j - f i|:= fun k => ↑k * α - ↑(round (↑k * α))) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i| :=
              by
              intro i j hij hjn
              exact h i j hij hjn
              hole
            have h₅ : ∀ k : ℕ, k ≤ n → f k = (k : ℝ) * α - round ((k : ℝ) * α):= fun k => ↑k * α - ↑(round (↑k * α))) (h : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) (h₄ : ∀ (i j : ℕ), i < j → j ≤ n → 1 / (↑n + 1) ≤ |f j - f i|) : ∀ k ≤ n, f k = ↑k * α - ↑(round (↑k * α)) :=
              by
              intro k hk
              rfl
              hole
            have h₆ := h₄ 0 1 (by norm_num) (by linarith)
            have h₇ := h₄ 0 n (by omega) (by linarith)
            have h₈ := h₄ 1 n (by omega) (by linarith)
            norm_num [f] at h₆ h₇ h₈ <;> (try norm_num at h₆ h₇ h₈) <;>
                                                                                                                                                                                            (try
                                                                                                                                                                                                linarith [abs_nonneg
                                                                                                                                                                                                    (α -
                                                                                                                                                                                                      round
                                                                                                                                                                                                        (α :
                                                                                                                                                                                                          ℝ)),
                                                                                                                                                                                                  abs_nonneg
                                                                                                                                                                                                    (n *
                                                                                                                                                                                                        α -
                                                                                                                                                                                                      round
                                                                                                                                                                                                        (n *
                                                                                                                                                                                                            α :
                                                                                                                                                                                                          ℝ))]) <;>
                                                                                                                                                                                          (try
                                                                                                                                                                                              norm_num [round_eq,
                                                                                                                                                                                                  Int.floor_eq_iff,
                                                                                                                                                                                                  Int.ceil_eq_iff,
                                                                                                                                                                                                  sub_eq_add_neg] at
                                                                                                                                                                                                    h₆
                                                                                                                                                                                                    h₇
                                                                                                                                                                                                    h₈
                                                                                                                                                                                                    ⊢ <;>
                                                                                                                                                                                                (try
                                                                                                                                                                                                    nlinarith [Int.floor_le
                                                                                                                                                                                                        (α :
                                                                                                                                                                                                          ℝ),
                                                                                                                                                                                                      Int.le_ceil
                                                                                                                                                                                                        (α :
                                                                                                                                                                                                          ℝ),
                                                                                                                                                                                                      Int.floor_le
                                                                                                                                                                                                        (n *
                                                                                                                                                                                                            α :
                                                                                                                                                                                                          ℝ),
                                                                                                                                                                                                      Int.le_ceil
                                                                                                                                                                                                        (n *
                                                                                                                                                                                                            α :
                                                                                                                                                                                                          ℝ)])) <;>
                                                                                                                                                                                        (try
                                                                                                                                                                                            nlinarith [Int.floor_le
                                                                                                                                                                                                (α :
                                                                                                                                                                                                  ℝ),
                                                                                                                                                                                              Int.le_ceil
                                                                                                                                                                                                (α :
                                                                                                                                                                                                  ℝ),
                                                                                                                                                                                              Int.floor_le
                                                                                                                                                                                                (n *
                                                                                                                                                                                                    α :
                                                                                                                                                                                                  ℝ),
                                                                                                                                                                                              Int.le_ceil
                                                                                                                                                                                                (n *
                                                                                                                                                                                                    α :
                                                                                                                                                                                                  ℝ)]) <;>
                                                                                                                                                                                      (try
                                                                                                                                                                                          omega) <;>
                                                                                                                                                                                    (try
                                                                                                                                                                                        linarith [hα]) <;>
                                                                                                                                                                                  (try
                                                                                                                                                                                      nlinarith [hα]) <;>
                                                                                                                                                                                (try
                                                                                                                                                                                    omega) <;>
                                                                                                                                                                              (try
                                                                                                                                                                                  linarith [hα]) <;>
                                                                                                                                                                            (try
                                                                                                                                                                                nlinarith [hα]) <;>
                                                                                                                                                                          (try
                                                                                                                                                                              omega) <;>
                                                                                                                                                                        (try
                                                                                                                                                                            linarith [hα]) <;>
                                                                                                                                                                      (try
                                                                                                                                                                          nlinarith [hα]) <;>
                                                                                                                                                                    (try
                                                                                                                                                                        omega) <;>
                                                                                                                                                                  (try
                                                                                                                                                                      linarith [hα]) <;>
                                                                                                                                                                (try
                                                                                                                                                                    nlinarith [hα]) <;>
                                                                                                                                                              (try
                                                                                                                                                                  omega) <;>
                                                                                                                                                            (try
                                                                                                                                                                linarith [hα]) <;>
                                                                                                                                                          (try
                                                                                                                                                              nlinarith [hα]) <;>
                                                                                                                                                        (try
                                                                                                                                                            omega) <;>
                                                                                                                                                      (try
                                                                                                                                                          linarith [hα]) <;>
                                                                                                                                                    (try
                                                                                                                                                        nlinarith [hα]) <;>
                                                                                                                                                  (try
                                                                                                                                                      omega) <;>
                                                                                                                                                (try
                                                                                                                                                    linarith [hα]) <;>
                                                                                                                                              (try
                                                                                                                                                  nlinarith [hα]) <;>
                                                                                                                                            (try
                                                                                                                                                omega) <;>
                                                                                                                                          (try
                                                                                                                                              linarith [hα]) <;>
                                                                                                                                        (try
                                                                                                                                            nlinarith [hα]) <;>
                                                                                                                                      (try
                                                                                                                                          omega) <;>
                                                                                                                                    (try
                                                                                                                                        linarith [hα]) <;>
                                                                                                                                  (try
                                                                                                                                      nlinarith [hα]) <;>
                                                                                                                                (try
                                                                                                                                    omega) <;>
                                                                                                                              (try
                                                                                                                                  linarith [hα]) <;>
                                                                                                                            (try
                                                                                                                                nlinarith [hα]) <;>
                                                                                                                          (try
                                                                                                                              omega) <;>
                                                                                                                        (try
                                                                                                                            linarith [hα]) <;>
                                                                                                                      (try
                                                                                                                          nlinarith [hα]) <;>
                                                                                                                    (try
                                                                                                                        omega) <;>
                                                                                                                  (try
                                                                                                                      linarith [hα]) <;>
                                                                                                                (try
                                                                                                                    nlinarith [hα]) <;>
                                                                                                              (try omega) <;>
                                                                                                            (try
                                                                                                                linarith [hα]) <;>
                                                                                                          (try nlinarith [hα]) <;>
                                                                                                        (try omega) <;>
                                                                                                      (try linarith [hα]) <;>
                                                                                                    (try nlinarith [hα]) <;>
                                                                                                  (try omega) <;>
                                                                                                (try linarith [hα]) <;>
                                                                                              (try nlinarith [hα]) <;>
                                                                                            (try omega) <;>
                                                                                          (try linarith [hα]) <;>
                                                                                        (try nlinarith [hα]) <;>
                                                                                      (try omega) <;>
                                                                                    (try linarith [hα]) <;>
                                                                                  (try nlinarith [hα]) <;>
                                                                                (try omega) <;>
                                                                              (try linarith [hα]) <;>
                                                                            (try nlinarith [hα]) <;>
                                                                          (try omega) <;>
                                                                        (try linarith [hα]) <;>
                                                                      (try nlinarith [hα]) <;>
                                                                    (try omega) <;>
                                                                  (try linarith [hα]) <;>
                                                                (try nlinarith [hα]) <;>
                                                              (try omega) <;>
                                                            (try linarith [hα]) <;>
                                                          (try nlinarith [hα]) <;>
                                                        (try omega) <;>
                                                      (try linarith [hα]) <;>
                                                    (try nlinarith [hα]) <;>
                                                  (try omega) <;>
                                                (try linarith [hα]) <;>
                                              (try nlinarith [hα]) <;>
                                            (try omega) <;>
                                          (try linarith [hα]) <;>
                                        (try nlinarith [hα]) <;>
                                      (try omega) <;>
                                    (try linarith [hα]) <;>
                                  (try nlinarith [hα]) <;>
                                (try omega) <;>
                              (try linarith [hα]) <;>
                            (try nlinarith [hα]) <;>
                          (try omega) <;>
                        (try linarith [hα]) <;>
                      (try nlinarith [hα]) <;>
                    (try omega) <;>
                  (try linarith [hα]) <;>
                (try nlinarith [hα]) <;>
              (try omega)
            hole
          obtain ⟨i, j, hij, hjn, hdiff⟩ := h₃
          refine' ⟨i, j, hij, hjn, _⟩
          simp [f] at hdiff ⊢ <;> ring_nf at hdiff ⊢ <;> simpa using hdiff
          hole
        have h₃ : |(j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α))| < 1 / (n + 1 : ℝ):=
          by
          have h₄ : (j : ℝ) * α - (i : ℝ) * α = (j - i : ℝ) * α:= by ring
            hole
          have h₅ :
            (j : ℝ) * α - (i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) =
              (j - i : ℝ) * α - (round ((j : ℝ) * α) - round ((i : ℝ) * α)) := by sorry
          rw [h₅] at hdiff
          simpa [abs_sub_lt_iff] using hdiff
          hole
        constructor
        · exact_mod_cast h₁
        constructor
        · omega
        · simpa [abs_sub_lt_iff] using h₃
      hole
    exact h₁
    hole
  obtain ⟨k, p, hk₀, hk₁, hk₂⟩ := h_main
  have h₁ : ∃ (q : ℤ), 0 < q ∧ q ≤ n ∧ |α - (p : ℝ) / q| < 1 / ((n + 1 : ℝ) * q):=
    by
    have h₂ : (k : ℤ) > 0:= by exact_mod_cast hk₀
      hole
    have h₃ : (k : ℤ) ≤ n:= by exact_mod_cast hk₁
      hole
    have h₄ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := hk₂
    have h₅ : 0 < (k : ℝ):= by exact_mod_cast hk₀
      hole
    have h₆ : (k : ℝ) ≤ n:= by exact_mod_cast hk₁
      hole
    have h₇ : |α - (p : ℝ) / k| < 1 / ((n + 1 : ℝ) * k):=
      by
      have h₇₁ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := hk₂
      have h₇₂ : |α - (p : ℝ) / k| = |(k : ℝ) * α - p| / k:= by
        field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;> ring_nf <;>
              field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;>
            ring_nf at * <;>
          linarith
        hole
      rw [h₇₂]
      have h₇₃ : |(k : ℝ) * α - p| / k < 1 / ((n + 1 : ℝ) * k):=
        by
        have h₇₃₁ : |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := h₇₁
        have h₇₃₂ : 0 < (n + 1 : ℝ):= by positivity
          hole
        have h₇₃₃ : 0 < (k : ℝ):= by exact_mod_cast hk₀
          hole
        have h₇₃₄ : 0 < (n + 1 : ℝ) * k:= by positivity
          hole
        calc
          |(k : ℝ) * α - p| / k < (1 / (n + 1 : ℝ)) / k := by gcongr
          _ = 1 / ((n + 1 : ℝ) * k) := by
            field_simp [h₇₃₂.ne', h₇₃₃.ne'] <;> ring_nf <;> field_simp [h₇₃₂.ne', h₇₃₃.ne'] <;> ring_nf
        hole
      exact h₇₃
      hole
    refine' ⟨k, by exact_mod_cast hk₀, by exact_mod_cast hk₁, _⟩
    simpa [div_eq_mul_inv, mul_assoc] using h₇
    hole
  obtain ⟨q, hq₀, hq₁, hq₂⟩ := h₁
  refine' ⟨p, q, by exact hq₀, by exact_mod_cast hq₁, _⟩
  simpa [div_eq_mul_inv, mul_assoc] using hq₂
  hole