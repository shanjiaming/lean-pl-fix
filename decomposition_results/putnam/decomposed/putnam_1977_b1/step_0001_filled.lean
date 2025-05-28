theorem putnam_1977_b1  : Tendsto (fun N => ∏ n ∈ Finset.Icc 2 N, (↑n ^ 3 - 1) / (↑n ^ 3 + 1)) atTop (𝓝 (2 / 3)) :=
  by
  have h_main :
    ∀ (N : ℤ),
      N ≥ 2 →
        ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  have h_main_limit : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by sorry
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
  have h_final : Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) := by sorry
have putnam_1977_b1 :
  Tendsto (fun N ↦ ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1)) atTop (𝓝 ((2 / 3) : ℝ)) :=
  by
  have h_main :
    ∀ (N : ℤ),
      N ≥ 2 →
        ∏ n in Finset.Icc (2 : ℤ) N, ((n : ℝ) ^ 3 - 1) / (n ^ 3 + 1) = (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1)) := by sorry
  have h_main_limit : Tendsto (fun (N : ℤ) ↦ (2 : ℝ) * (N ^ 2 + N + 1) / (3 * N * (N + 1))) atTop (𝓝 ((2 / 3 : ℝ))) := by sorry
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