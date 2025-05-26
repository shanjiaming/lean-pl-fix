theorem putnam_1984_a2 :
  ∑' k : Set.Ici 1, (6 ^ (k : ℕ) / ((3 ^ ((k : ℕ) + 1) - 2 ^ ((k : ℕ) + 1)) * (3 ^ (k : ℕ) - 2 ^ (k : ℕ)))) =
    ((2) : ℚ):=
  by
  have h_main :
    ∀ n : ℕ,
      (∑ k in Finset.Icc 1 n, (6 : ℚ) ^ k / ((3 ^ (k + 1) - 2 ^ (k + 1)) * (3 ^ k - 2 ^ k))) =
        2 - (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) := by sorry
  have h_tendsto : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
    by
    have h₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
      by
      have h₂ :
        ∀ n : ℕ, (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) = (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
        by
        intro n
        rfl
      have h₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
        by
        have h₄ : ∀ n : ℕ, (n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1):=
          by
          --  intro n hn
          have h₅ : (3 : ℚ) ^ n ≥ 2 ^ n + 1:=
            by
            have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1:=
              by
              have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
                by
                intro n hn
                induction' hn with n hn IH
                · norm_num
                ·
                  cases n with
                  | zero => norm_num at hn ⊢
                  | succ n =>
                    simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
              have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1:= by
                --  intro n hn
                --  induction' hn with n hn IH
                --  · norm_num
                ·
                --    cases n with
                --    | zero => norm_num at hn ⊢
                --    | succ n =>
                --      simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
                hole
            have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
              by
              have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
                by
                intro n hn
                induction' hn with n hn IH
                · norm_num
                ·
                  cases n with
                  | zero => norm_num at hn ⊢
                  | succ n =>
                    simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
              exact h₇ n hn
              hole
            --  exact h₆
            hole
          --  exact h₅
          hole
        have h₅ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n - 2 ^ n ≥ 1 :=
          by
          intro n hn
          have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 := h₄ n hn
          linarith
        have h₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1:=
          by
          --  intro n hn
          have h₇ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1:=
            by
            have h₈ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1:=
              by
              have h₉ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1:=
                by
                --  intro n hn
                --  induction' hn with n hn IH
                --  · norm_num
                ·
                --    cases n with
                --    | zero => norm_num at hn ⊢
                --    | succ n =>
                --      simp_all [pow_succ] <;> nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
                hole
              --  exact h₉ n hn
              hole
            --  exact h₈
            hole
          --  linarith
          hole
        have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1:=
          by
          --  intro n hn
          --  exact h₆ n hn
          simpa
        have h₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1):=
          by
          --  intro n hn
          have h₉ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 := h₇ n hn
          have h₁₀ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1):=
            by
            have h₁₁ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0:= by -- linarith
              linarith
            have h₁₂ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1):=
              by
              --  rw [div_le_iff (by positivity)]
              nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) (n + 1), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 1)]
              hole
            --  exact h₁₂
            hole
          --  exact h₁₀
          hole
        have h₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0):=
          by
          have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0):=
            by
            have h₁₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0):=
              by
              have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0):=
                by
                have h₁₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0):= by
                  --  simpa [div_eq_mul_inv] using tendsto_pow_atTop_nhds_0_of_lt_1 (by norm_num) (by norm_num)
                  hole
                --  exact h₁₃
                hole
              --  exact h₁₂
              hole
            --  exact h₁₁
            hole
          --  exact h₁₀
          hole
        have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
          by
          have h₁₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1):=
            by
            --  intro n hn
            --  exact h₈ n hn
            simpa
          have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
            by
            have h₁₃ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0:=
              by
              --  intro n hn
              have h₁₄ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0:=
                by
                have h₁₅ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1):=
                  by
                  have h₁₆ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1):= by
                    --  calc
                    --    (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) := by exact pow_lt_pow_of_lt_left (by norm_num) (by norm_num) (by omega)
                    --    _ = 2 ^ (n + 1) := by rfl
                    hole
                  --  exact h₁₆
                  hole
                --  linarith
                hole
              have h₁₅ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0:= by -- positivity
                norm_num
              --  exact h₁₅
              hole
            have h₁₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
              by
              have h₁₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
              have h₁₆ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                by
                have h₁₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                have h₁₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                have h₁₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                  by
                  have h₂₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                    by
                    have h₂₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                    have h₂₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                    have h₂₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                      by
                      have h₂₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                      have h₂₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                        by
                        have h₂₆ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                        have h₂₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                        have h₂₈ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                          by
                          have h₂₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                          have h₃₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):=
                            by
                            have h₃₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                            have h₃₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                            have h₃₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0):= by
                              --  exact
                              --    tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds h₂₄
                              --      (eventually_of_forall fun n => by
                              --        cases n with
                              --        | zero => norm_num
                              --        | succ n =>
                              --          exact
                              --            by
                              --            have h₃₄ : (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≥ 0 := by
                              --              exact h₁₃ (n.succ) (by simp)
                              --            linarith [h₃₄, h₁₁ (n.succ) (by simp)])
                              --      (eventually_of_forall fun n => by
                              --        cases n with
                              --        | zero => norm_num
                              --        | succ n =>
                              --          exact
                              --            by
                              --            have h₃₄ : (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≤ (2 : ℚ) ^ (n.succ + 1) := by
                              --              exact h₁₁ (n.succ) (by simp)
                              --            linarith [h₃₄, h₁₃ (n.succ) (by simp)])
                              hole
                            --  exact h₃₃
                            hole
                          --  exact h₃₀
                          hole
                        --  exact h₂₈
                        hole
                      --  exact h₂₅
                      hole
                    --  exact h₂₃
                    hole
                  --  exact h₂₀
                  hole
                --  exact h₁₉
                hole
              --  exact h₁₆
              hole
            --  exact h₁₄
            hole
          --  exact h₁₂
          hole
        have h₅ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n - 2 ^ n ≥ 1:= by
          --  intro n hn
          have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 := h₄ n hn
          --  linarith
          hole
      have h₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
        by
        have h₄ : ∀ n : ℕ, (n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1) := by sorry
        have h₅ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n - 2 ^ n ≥ 1 :=
          by
          intro n hn
          have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 := h₄ n hn
          linarith
        have h₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 :=
          by
          intro n hn
          have h₇ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
            by
            have h₈ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
              by
              have h₉ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
                by
                intro n hn
                induction' hn with n hn IH
                · norm_num
                ·
                  cases n with
                  | zero => norm_num at hn ⊢
                  | succ n =>
                    simp_all [pow_succ] <;>
                      nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
              exact h₉ n hn
            exact h₈
          linarith
        have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 :=
          by
          intro n hn
          exact h₆ n hn
        have h₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
          by
          intro n hn
          have h₉ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 := h₇ n hn
          have h₁₀ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
            by
            have h₁₁ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0 := by linarith
            have h₁₂ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
              by
              rw [div_le_iff (by positivity)]
              nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) (n + 1), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 1)]
            exact h₁₂
          exact h₁₀
        have h₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
          by
          have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
            by
            have h₁₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
              by
              have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
                by
                have h₁₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := by
                  simpa [div_eq_mul_inv] using tendsto_pow_atTop_nhds_0_of_lt_1 (by norm_num) (by norm_num)
                exact h₁₃
              exact h₁₂
            exact h₁₁
          exact h₁₀
        have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
          by
          have h₁₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
            by
            intro n hn
            exact h₈ n hn
          have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
            by
            have h₁₃ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 :=
              by
              intro n hn
              have h₁₄ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0 :=
                by
                have h₁₅ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) :=
                  by
                  have h₁₆ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) := by
                    calc
                      (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) := by exact pow_lt_pow_of_lt_left (by norm_num) (by norm_num) (by omega)
                      _ = 2 ^ (n + 1) := by rfl
                  exact h₁₆
                linarith
              have h₁₅ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := by positivity
              exact h₁₅
            have h₁₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
              by
              have h₁₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
              have h₁₆ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                by
                have h₁₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                have h₁₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                have h₁₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                  by
                  have h₂₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                    by
                    have h₂₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                    have h₂₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                    have h₂₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                      by
                      have h₂₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                      have h₂₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                        by
                        have h₂₆ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                        have h₂₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                        have h₂₈ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                          by
                          have h₂₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                          have h₃₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                            by
                            have h₃₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
                              h₁₁
                            have h₃₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                            have h₃₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) := by
                              exact
                                tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds h₂₄
                                  (eventually_of_forall fun n => by
                                    cases n with
                                    | zero => norm_num
                                    | succ n =>
                                      exact
                                        by
                                        have h₃₄ : (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≥ 0 := by
                                          exact h₁₃ (n.succ) (by simp)
                                        linarith [h₃₄, h₁₁ (n.succ) (by simp)])
                                  (eventually_of_forall fun n => by
                                    cases n with
                                    | zero => norm_num
                                    | succ n =>
                                      exact
                                        by
                                        have h₃₄ :
                                          (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≤
                                            (2 : ℚ) ^ (n.succ + 1) :=
                                          by exact h₁₁ (n.succ) (by simp)
                                        linarith [h₃₄, h₁₃ (n.succ) (by simp)])
                            exact h₃₃
                          exact h₃₀
                        exact h₂₈
                      exact h₂₅
                    exact h₂₃
                  exact h₂₀
                exact h₁₉
              exact h₁₆
            exact h₁₄
          exact h₁₂
        exact h₁₀
        hole
      have h₂ : ∀ n : ℕ, (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) = (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)):=
        by
        --  intro n
        --  rfl
        norm_num
    have h₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
      by
      have h₂ :
        ∀ n : ℕ, (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) = (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) :=
        by
        intro n
        rfl
      have h₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
        by
        have h₄ : ∀ n : ℕ, (n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1) :=
          by
          intro n hn
          have h₅ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
            by
            have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
              by
              have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n ≥ 2 ^ n + 1 :=
                by
                intro n hn
                induction' hn with n hn IH
                · norm_num
                ·
                  cases n with
                  | zero => norm_num at hn ⊢
                  | succ n =>
                    simp_all [pow_succ] <;>
                      nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
              exact h₇ n hn
            exact h₆
          exact h₅
        have h₅ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ n - 2 ^ n ≥ 1 :=
          by
          intro n hn
          have h₆ : (3 : ℚ) ^ n ≥ 2 ^ n + 1 := h₄ n hn
          linarith
        have h₆ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 :=
          by
          intro n hn
          have h₇ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
            by
            have h₈ : (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
              by
              have h₉ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) ≥ 2 ^ (n + 1) + 1 :=
                by
                intro n hn
                induction' hn with n hn IH
                · norm_num
                ·
                  cases n with
                  | zero => norm_num at hn ⊢
                  | succ n =>
                    simp_all [pow_succ] <;>
                      nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) n, pow_pos (by norm_num : (0 : ℚ) < 3) n]
              exact h₉ n hn
            exact h₈
          linarith
        have h₇ : ∀ n : ℕ, n ≥ 1 → (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 :=
          by
          intro n hn
          exact h₆ n hn
        have h₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
          by
          intro n hn
          have h₉ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) ≥ 1 := h₇ n hn
          have h₁₀ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
            by
            have h₁₁ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0 := by linarith
            have h₁₂ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
              by
              rw [div_le_iff (by positivity)]
              nlinarith [pow_pos (by norm_num : (0 : ℚ) < 2) (n + 1), pow_pos (by norm_num : (0 : ℚ) < 3) (n + 1)]
            exact h₁₂
          exact h₁₀
        have h₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
          by
          have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
            by
            have h₁₁ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
              by
              have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) :=
                by
                have h₁₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := by
                  simpa [div_eq_mul_inv] using tendsto_pow_atTop_nhds_0_of_lt_1 (by norm_num) (by norm_num)
                exact h₁₃
              exact h₁₂
            exact h₁₁
          exact h₁₀
        have h₁₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
          by
          have h₁₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
            by
            intro n hn
            exact h₈ n hn
          have h₁₂ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
            by
            have h₁₃ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 :=
              by
              intro n hn
              have h₁₄ : (3 : ℚ) ^ (n + 1) - 2 ^ (n + 1) > 0 :=
                by
                have h₁₅ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) :=
                  by
                  have h₁₆ : (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) := by
                    calc
                      (3 : ℚ) ^ (n + 1) > 2 ^ (n + 1) := by
                        exact pow_lt_pow_of_lt_left (by norm_num) (by norm_num) (by omega)
                      _ = 2 ^ (n + 1) := by rfl
                  exact h₁₆
                linarith
              have h₁₅ : (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := by positivity
              exact h₁₅
            have h₁₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
              by
              have h₁₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
              have h₁₆ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                by
                have h₁₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                have h₁₈ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                have h₁₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                  by
                  have h₂₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                    by
                    have h₂₁ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                    have h₂₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                    have h₂₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                      by
                      have h₂₄ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                      have h₂₅ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                        by
                        have h₂₆ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) :=
                          h₁₁
                        have h₂₇ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                        have h₂₈ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                          by
                          have h₂₉ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1)) atTop (𝓝 0) := h₉
                          have h₃₀ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                            by
                            have h₃₁ :
                              ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≤ (2 : ℚ) ^ (n + 1) := h₁₁
                            have h₃₂ : ∀ n : ℕ, n ≥ 1 → (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1)) ≥ 0 := h₁₃
                            have h₃₃ : Tendsto (fun n : ℕ ↦ (2 : ℚ) ^ (n + 1) / (3 ^ (n + 1) - 2 ^ (n + 1))) atTop (𝓝 0) :=
                              by
                              exact
                                tendsto_of_tendsto_of_tendsto_of_le_of_le' tendsto_const_nhds h₂₄
                                  (eventually_of_forall fun n => by
                                    cases n with
                                    | zero => norm_num
                                    | succ n =>
                                      exact
                                        by
                                        have h₃₄ : (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≥ 0 := by
                                          exact h₁₃ (n.succ) (by simp)
                                        linarith [h₃₄, h₁₁ (n.succ) (by simp)])
                                  (eventually_of_forall fun n => by
                                    cases n with
                                    | zero => norm_num
                                    | succ n =>
                                      exact
                                        by
                                        have h₃₄ :
                                          (2 : ℚ) ^ (n.succ + 1) / (3 ^ (n.succ + 1) - 2 ^ (n.succ + 1)) ≤
                                            (2 : ℚ) ^ (n.succ + 1) :=
                                          by exact h₁₁ (n.succ) (by simp)
                                        linarith [h₃₄, h₁₃ (n.succ) (by simp)])
                            exact h₃₃
                          exact h₃₀
                        exact h₂₈
                      exact h₂₅
                    exact h₂₃
                  exact h₂₀
                exact h₁₉
              exact h₁₆
            exact h₁₄
          exact h₁₂
        exact h₁₀
      exact h₃
      hole
    --  exact h₁
    hole
  have h_sum_eq_two :
    ∑' k : Set.Ici 1, (6 ^ (k : ℕ) / ((3 ^ ((k : ℕ) + 1) - 2 ^ ((k : ℕ) + 1)) * (3 ^ (k : ℕ) - 2 ^ (k : ℕ)))) =
      ((2) : ℚ) := by sorry
  --  exact h_sum_eq_two
  hole