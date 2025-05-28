theorem putnam_1977_b1 :
  Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)):=
  by
  have h_main :
    ∀ (N : ℤ),
      N ≥ 2 →
        ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  have h_main :
    ∀ (N : ℤ),
      N ≥ 2 →
        ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)):=
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
  have h_final :
    Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
    by
    have h₂ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
      by
      have h₃ :
        ∀ᶠ (N : ℤ) in atTop,
          ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) =
            (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) :=
        by
        filter_upwards [eventually_ge_atTop (2 : ℤ)] with N hN
        exact h_main N hN
      have h₄ :
        Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
        by
        have h₅ :
          Tendsto (fun (N : ℤ) ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop
            (𝓝 ((2 / 3 : ℝ))) :=
          by
          apply Tendsto.congr' _ h_main_limit
          apply h₃.mono
          intro N hN
          rw [hN]
        exact h₅
      exact h₄
    exact h₂
  have h_final : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)):=
    by
    have h₂ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)):=
      by
      have h₃ :
        ∀ᶠ (N : ℤ) in atTop,
          ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
      have h₄ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)):=
        by
        have h₅ :
          Tendsto (fun (N : ℤ) ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3 : ℝ))) := by sorry
        --  exact h₅
        hole
      --  exact h₄
      hole
    --  exact h₂
    hole
have putnam_1977_b1 :
  Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
  by
  have h_main :
    ∀ (N : ℤ),
      N ≥ 2 →
        ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  have h_main_limit : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
    by
    have h₁ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
      by
      have h₂ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
        by
        have h₃ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
          by
          have h₄ : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
            by
            have h₅ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
              by
              have h₆ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                by
                have h₇ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                  by
                  have h₈ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                    by
                    have h₉ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                      by
                      have h₁₀ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                        by
                        have h₁₁ :
                          (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) =
                            (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) :=
                          rfl
                        --  rw [h₁₁]
                        have h₁₂ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                          by
                          have h₁₃ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                            by
                            have h₁₄ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):=
                              by
                              have h₁₅ : Tendsto (fun (N : ℤ) => (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))):= by
                                --  convert Tendsto.const_mul (2 / 3 : ℝ) (tendsto_const_nhds : Tendsto (fun (N : ℤ) => (1 : ℝ)) atTop (𝓝 1)) using 1 <;>
                                --                    simp [mul_comm] <;>
                                --                  field_simp <;>
                                              ring_nf <;>
                                            norm_num <;>
                                          simp_all [mul_comm] <;>
                                        norm_num <;>
                                      simp_all [mul_comm] <;>
                                    norm_num <;>
                                  linarith
                                hole
                              --  exact h₁₅
                              hole
                            --  exact h₁₄
                            hole
                          --  exact h₁₃
                          hole
                        exact h₁₂
                        hole
                      --  exact h₁₀
                      hole
                    --  exact h₉
                    hole
                  --  exact h₈
                  hole
                --  exact h₇
                hole
              --  exact h₆
              hole
            --  exact h₅
            hole
          --  exact h₄
          hole
        --  exact h₃
        hole
      --  exact h₂
      hole
    --  exact h₁
    hole
  have h_final :
    Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
    by
    have h₂ : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
      by
      have h₃ :
        ∀ᶠ (N : ℤ) in atTop,
          ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) =
            (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) :=
        by
        filter_upwards [eventually_ge_atTop (2 : ℤ)] with N hN
        exact h_main N hN
      have h₄ :
        Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
        by
        have h₅ :
          Tendsto (fun (N : ℤ) ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop
            (𝓝 ((2 / 3 : ℝ))) :=
          by
          apply Tendsto.congr' _ h_main_limit
          apply h₃.mono
          intro N hN
          rw [hN]
        exact h₅
      exact h₄
    exact h₂
  exact h_final
  hole