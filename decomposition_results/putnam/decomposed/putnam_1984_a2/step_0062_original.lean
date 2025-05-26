theorem h_sum_eq_two (h_main :  ∀ (n : ℕ),    ∑ k ∈ Finset.Icc 1 n, 6 ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k)) =      2 - 2 ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) (h_tendsto : sorry) : ∑' (k : (↑(Set.Ici 1) : Type)),
      6 ^ (↑k : ℕ) / ((3 ^ ((↑k : ℕ) + 1) - 2 ^ ((↑k : ℕ) + 1)) * (3 ^ (↑k : ℕ) - 2 ^ (↑k : ℕ))) =
    2 :=
  by
  have h₁ :
    ∑' k : Set.Ici 1, (6 ^ (k : ℕ) / ((3 ^ ((k : ℕ) + 1) - 2 ^ ((k : ℕ) + 1)) * (3 ^ (k : ℕ) - 2 ^ (k : ℕ)))) =
      ∑' n : ℕ,
        (6 ^ (n + 1 : ℕ) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ)))) := by sorry
  rw [h₁]
  have h₂ :
    ∑' n : ℕ,
        (6 ^ (n + 1 : ℕ) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))) :
          ℚ) =
      2 :=
    by
    have h₃ :
      ∀ n : ℕ,
        (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
          2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
      h_main
    have h₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := h_tendsto
    have h₅ :
      HasSum
        (fun n : ℕ ↦
          (6 : ℚ) ^ (n + 1) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
        2 :=
      by
      have h₆ :
        ∀ n : ℕ,
          (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
            2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
        h_main
      have h₇ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := h_tendsto
      have h₈ :
        HasSum
          (fun n : ℕ ↦
            (6 : ℚ) ^ (n + 1) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
          2 :=
        by
        have h₉ :
          HasSum
            (fun n : ℕ ↦
              (6 : ℚ) ^ (n + 1) /
                ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
            2 :=
          by
          have h₁₀ :
            ∀ n : ℕ,
              (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
                2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
            h_main
          have h₁₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := h_tendsto
          have h₁₂ :
            HasSum
              (fun n : ℕ ↦
                (6 : ℚ) ^ (n + 1) /
                  ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
              2 :=
            by
            have h₁₃ :
              HasSum
                (fun n : ℕ ↦
                  (6 : ℚ) ^ (n + 1) /
                    ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                2 :=
              by
              have h₁₄ :
                ∀ n : ℕ,
                  (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
                    2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
                h_main
              have h₁₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := h_tendsto
              have h₁₆ :
                HasSum
                  (fun n : ℕ ↦
                    (6 : ℚ) ^ (n + 1) /
                      ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                  2 :=
                by
                have h₁₇ :
                  HasSum
                    (fun n : ℕ ↦
                      (6 : ℚ) ^ (n + 1) /
                        ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                    2 :=
                  by
                  have h₁₈ :
                    ∀ n : ℕ,
                      (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
                        2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
                    h_main
                  have h₁₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                    h_tendsto
                  have h₂₀ :
                    HasSum
                      (fun n : ℕ ↦
                        (6 : ℚ) ^ (n + 1) /
                          ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                      2 :=
                    by
                    have h₂₁ :
                      HasSum
                        (fun n : ℕ ↦
                          (6 : ℚ) ^ (n + 1) /
                            ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                        2 :=
                      by
                      have h₂₂ :
                        HasSum
                          (fun n : ℕ ↦
                            (6 : ℚ) ^ (n + 1) /
                              ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                          2 :=
                        by
                        have h₂₃ :
                          HasSum
                            (fun n : ℕ ↦
                              (6 : ℚ) ^ (n + 1) /
                                ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                            2 :=
                          by
                          have h₂₄ :
                            HasSum
                              (fun n : ℕ ↦
                                (6 : ℚ) ^ (n + 1) /
                                  ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) *
                                    (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                              2 :=
                            by
                            have h₂₅ :
                              HasSum
                                (fun n : ℕ ↦
                                  (6 : ℚ) ^ (n + 1) /
                                    ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) *
                                      (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
                                2 :=
                              by convert HasSum.tsum_eq _ <;> simp_all [h₃, h₄] <;> norm_num <;> linarith
                            exact h₂₅
                          exact h₂₄
                        exact h₂₃
                      exact h₂₂
                    exact h₂₁
                  exact h₂₀
                exact h₁₇
              exact h₁₆
            exact h₁₃
          exact h₁₂
        exact h₈
      exact h₅
    have h₆ :
      ∑' n : ℕ,
          (6 ^ (n + 1 : ℕ) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))) :
            ℚ) =
        2 :=
      by
      have h₇ :
        HasSum
          (fun n : ℕ ↦
            (6 : ℚ) ^ (n + 1) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))))
          2 :=
        h₅
      have h₈ :
        ∑' n : ℕ,
            (6 ^ (n + 1 : ℕ) / ((3 ^ ((n + 1 : ℕ) + 1) - 2 ^ ((n + 1 : ℕ) + 1)) * (3 ^ (n + 1 : ℕ) - 2 ^ (n + 1 : ℕ))) :
              ℚ) =
          2 :=
        by convert h₇.tsum_eq <;> simp_all
      exact h₈
    exact h₆
  rw [h₂] <;> norm_num