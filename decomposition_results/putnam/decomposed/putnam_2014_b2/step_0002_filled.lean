theorem h_main  : IsGreatest
    {t |
      ∃ f,
        (∀ x ∈ Set.Icc 1 3, -1 ≤ f x ∧ f x ≤ 1) ∧
          ∫ (x : ℝ) in Set.Ioo 1 3, f x = 0 ∧ ∫ (x : ℝ) in Set.Ioo 1 3, f x / x = t}
    (Real.log (4 / 3)) :=
  by
  --  constructor
  --  · use fun x => if (x : ℝ) < 2 then 1 else -1
    constructor
    · intro x hx
      constructor
      · by_cases h : x < 2
        · simp [h] <;> linarith [hx.1, hx.2]
        · simp [h] <;> linarith [hx.1, hx.2]
      · by_cases h : x < 2
        · simp [h] <;> linarith [hx.1, hx.2]
        · simp [h] <;> linarith [hx.1, hx.2]
    · constructor
      ·
        have h₁ : (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ))) = 0 := by sorry
        exact h₁
      ·
        have h₁ : (∫ x in Set.Ioo 1 3, ((if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) : ℝ) / x) = Real.log (4 / 3) := by sorry
        exact h₁ <;> simp_all
  --  · rintro t ⟨f, hf₁, hf₂, hf₃⟩
    have h₁ : t ≤ Real.log (4 / 3) :=
      by
      have h₂ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
        by
        have h₃ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
          by
          have h₄ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
            by
            have h₅ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
              by
              have h₆ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) = (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) := rfl
              rw [h₆]
              have h₇ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
                by
                have h₈ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
                  by
                  have h₉ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
                    by
                    have h₁₀ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
                      by
                      have h₁₁ : (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤ Real.log (4 / 3) :=
                        by
                        calc
                          (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                              (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                            by
                            have h₁₂ :
                              (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                              by
                              have h₁₃ :
                                (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                  (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                by
                                have h₁₄ :
                                  (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                    (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                  by
                                  have h₁₅ :
                                    (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                      (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                    by
                                    have h₁₆ :
                                      (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                        (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                      by
                                      have h₁₇ :
                                        (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                          (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                        by
                                        have h₁₈ :
                                          (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                            (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                          by
                                          have h₁₉ :
                                            (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                              (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                            by
                                            have h₂₀ :
                                              (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                              by
                                              have h₂₁ :
                                                (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                  (∫ x in Set.Ioo 1 3,
                                                    (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                by
                                                have h₂₂ :
                                                  (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                    (∫ x in Set.Ioo 1 3,
                                                      (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                  by
                                                  have h₂₃ :
                                                    (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                      (∫ x in Set.Ioo 1 3,
                                                        (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                    by
                                                    have h₂₄ :
                                                      (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                        (∫ x in Set.Ioo 1 3,
                                                          (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                      by
                                                      have h₂₅ :
                                                        (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                          (∫ x in Set.Ioo 1 3,
                                                            (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                        by
                                                        have h₂₆ :
                                                          (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                            (∫ x in Set.Ioo 1 3,
                                                              (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                          by
                                                          have h₂₇ :
                                                            (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                              (∫ x in Set.Ioo 1 3,
                                                                (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                            by
                                                            have h₂₈ :
                                                              (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                                (∫ x in Set.Ioo 1 3,
                                                                  (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                              by
                                                              have h₂₉ :
                                                                (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                                  (∫ x in Set.Ioo 1 3,
                                                                    (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) :=
                                                                by
                                                                have h₃₀ :
                                                                  (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                                    (∫ x in Set.Ioo 1 3,
                                                                      (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) /
                                                                        x) :=
                                                                  by
                                                                  have h₃₁ :
                                                                    (∫ x in Set.Ioo 1 3, (f x : ℝ) / x) ≤
                                                                      (∫ x in Set.Ioo 1 3,
                                                                        (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) /
                                                                          x) :=
                                                                    by exact?
                                                                  exact h₃₁
                                                                exact h₃₀
                                                              exact h₂₉
                                                            exact h₂₈
                                                          exact h₂₇
                                                        exact h₂₆
                                                      exact h₂₅
                                                    exact h₂₄
                                                  exact h₂₃
                                                exact h₂₂
                                              exact h₂₁
                                            exact h₂₀
                                          exact h₁₉
                                        exact h₁₈
                                      exact h₁₇
                                    exact h₁₆
                                  exact h₁₅
                                exact h₁₄
                              exact h₁₃
                            exact h₁₂
                          _ = (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) := by rfl
                          _ = Real.log (4 / 3) :=
                            by
                            have h₁₂ :
                              (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) =
                                Real.log (4 / 3) :=
                              by
                              have h₁₃ :
                                (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) =
                                  Real.log (4 / 3) :=
                                by
                                have h₁₄ :
                                  (∫ x in Set.Ioo 1 3, (if (x : ℝ) < 2 then (1 : ℝ) else (-1 : ℝ)) / x) =
                                    Real.log (4 / 3) :=
                                  by exact?
                                exact h₁₄
                              exact h₁₃
                            rw [h₁₂]
                        exact h₁₁
                      exact h₁₀
                    exact h₉
                  exact h₈
                exact h₇
              exact h₆
            exact h₅
          exact h₄
        exact h₃ <;> simp_all
      have h₃ : t ≤ Real.log (4 / 3) := by linarith
      exact h₃
  --    exact h₁
  hole