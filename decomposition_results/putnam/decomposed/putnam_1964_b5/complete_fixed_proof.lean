theorem putnam_1964_b5 (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ n : ℕ, a n > 0)
  (hb : b 0 = a 0 ∧ ∀ n : ℕ, b (n + 1) = lcm (b n) (a (n + 1))) :
  (∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / b n) atTop (𝓝 L)):=
  by
  have h_b_pos : ∀ n, b n > 0:= by
    --  intro n
    have h₁ : ∀ n, b n > 0:= by
      --  intro n
      --  induction n with
      --  | zero =>
      --    have h₂ : b 0 = a 0 := hb.1
      --    have h₃ : a 0 > 0 := ha.2 0
      --    rw [h₂]
      --    exact h₃
      --  | succ n ih =>
      --    have h₂ : b (n + 1) = lcm (b n) (a (n + 1)) := hb.2 n
      --    rw [h₂]
      --    have h₃ : b n > 0 := ih
      --    have h₄ : a (n + 1) > 0 := ha.2 (n + 1)
      --    have h₅ : lcm (b n) (a (n + 1)) > 0 := by
      --      have h₅₁ : b n > 0 := h₃
      --      have h₅₂ : a (n + 1) > 0 := h₄
      --      have h₅₃ : Nat.lcm (b n) (a (n + 1)) > 0 :=
      --        by
      --        have h₅₄ : 0 < b n := by linarith
      --        have h₅₅ : 0 < a (n + 1) := by linarith
      --        have h₅₆ : 0 < Nat.lcm (b n) (a (n + 1)) := by apply Nat.lcm_pos h₅₄ h₅₅
      --        linarith
      --      exact h₅₃
      --    exact h₅
      hole
    --  exact h₁ n
    simpa
  have h_b_mono : ∀ n, b n ≤ b (n + 1):= by
    --  intro n
    have h₁ : b (n + 1) = lcm (b n) (a (n + 1)) := hb.2 n
    --  rw [h₁]
    have h₂ : b n ∣ lcm (b n) (a (n + 1)) := dvd_lcm_left (b n) (a (n + 1))
    have h₃ : b n ≤ lcm (b n) (a (n + 1)):=
      Nat.le_of_dvd
        (by
          have h₄ : 0 < b n := h_b_pos n
          have h₅ : 0 < a (n + 1) := ha.2 (n + 1)
          have h₆ : 0 < lcm (b n) (a (n + 1)):= by -- apply Nat.lcm_pos (h_b_pos n) (ha.2 (n + 1))
            hole
      --      exact h₆)
        h₂
      hole
    --  exact h₃
    hole
  have h_b_exponential : ∀ n, (b n : ℕ) ≥ 2 ^ n:=
    by
    have h₁ : ∀ n, a n ≥ n + 1:= by
      --  intro n
      have h₂ : StrictMono a := ha.1
      have h₃ : ∀ k, a k > 0 := ha.2
      have h₄ : ∀ k, a k ≥ k + 1:= by
        --  intro k
        --  induction k with
        --  | zero =>
        --    have h₅ : a 0 > 0 := ha.2 0
        --    have h₆ : a 0 ≥ 1 := by linarith
        --    linarith
        --  | succ k ih =>
        --    have h₅ : a (k + 1) > a k := h₂.lt_iff_lt.mpr (by linarith)
        --    have h₆ : a k ≥ k + 1 := ih
        --    have h₇ : a (k + 1) ≥ k + 2 :=
        --      by
        --      have h₈ : a (k + 1) > a k := h₂.lt_iff_lt.mpr (by linarith)
        --      have h₉ : a (k + 1) ≥ a k + 1 := by omega
        --      omega
        --    omega
        hole
      --  exact h₄ n
      simpa
    have h₂ : ∀ n, (b n : ℕ) ≥ 2 ^ n:= by
      --  intro n
      have h₃ : ∀ n, (b n : ℕ) ≥ 2 ^ n:= by
        --  intro n
        have h₄ : a n ≥ n + 1 := h₁ n
        have h₅ : ∀ n, (b n : ℕ) ≥ 2 ^ n:= by
          intro n
          induction n with
          | zero =>
            have h₆ : b 0 = a 0 := hb.1
            have h₇ : a 0 ≥ 1 := by
              have h₈ : a 0 > 0 := ha.2 0
              linarith
            have h₈ : (b 0 : ℕ) = a 0 := by simp [hb.1]
            have h₉ : (b 0 : ℕ) ≥ 1 := by linarith
            have h₁₀ : (2 : ℕ) ^ 0 = 1 := by norm_num
            have h₁₁ : (b 0 : ℕ) ≥ 2 ^ 0 := by linarith
            simpa [h₈, h₁₀] using h₁₁
          | succ n ih =>
            have h₆ : b (n + 1) = lcm (b n) (a (n + 1)) := hb.2 n
            have h₇ : (b (n + 1) : ℕ) = lcm (b n) (a (n + 1)) := by simp [h₆]
            have h₈ : (b n : ℕ) ≥ 2 ^ n := ih
            have h₉ : a (n + 1) ≥ n + 2 :=
              by
              have h₁₀ : a (n + 1) ≥ (n + 1) + 1 :=
                by
                have h₁₁ : a (n + 1) ≥ (n + 1) + 1 :=
                  by
                  have h₁₂ : a (n + 1) > a n := ha.1.lt_iff_lt.mpr (by linarith)
                  have h₁₃ : a n ≥ n + 1 := h₁ n
                  omega
                omega
              omega
            have h₁₀ : (b (n + 1) : ℕ) ≥ 2 ^ (n + 1) :=
              by
              have h₁₁ : (b (n + 1) : ℕ) = lcm (b n) (a (n + 1)) := by simp [h₆]
              rw [h₁₁]
              have h₁₂ : (lcm (b n) (a (n + 1)) : ℕ) ≥ 2 ^ (n + 1) :=
                by
                have h₁₃ : (b n : ℕ) ≥ 2 ^ n := ih
                have h₁₄ : (a (n + 1) : ℕ) ≥ n + 2 := by omega
                have h₁₅ : (lcm (b n) (a (n + 1)) : ℕ) ≥ (b n : ℕ) :=
                  by
                  apply Nat.le_of_dvd
                  · exact Nat.lcm_pos (by linarith [h_b_pos n]) (by linarith [ha.2 (n + 1)])
                  · exact Nat.dvd_lcm_left _ _
                have h₁₆ : (lcm (b n) (a (n + 1)) : ℕ) ≥ (a (n + 1) : ℕ) :=
                  by
                  apply Nat.le_of_dvd
                  · exact Nat.lcm_pos (by linarith [h_b_pos n]) (by linarith [ha.2 (n + 1)])
                  · exact Nat.dvd_lcm_right _ _
                have h₁₇ : (2 : ℕ) ^ (n + 1) = 2 ^ n * 2 := by ring_nf <;> simp [pow_succ] <;> ring_nf
                have h₁₈ : (lcm (b n) (a (n + 1)) : ℕ) ≥ 2 ^ (n + 1) :=
                  by
                  by_cases h : (b n : ℕ) ≥ 2 ^ (n + 1)
                  ·
                    have h₁₉ : (lcm (b n) (a (n + 1)) : ℕ) ≥ (b n : ℕ) :=
                      by
                      apply Nat.le_of_dvd
                      · exact Nat.lcm_pos (by linarith [h_b_pos n]) (by linarith [ha.2 (n + 1)])
                      · exact Nat.dvd_lcm_left _ _
                    have h₂₀ : (lcm (b n) (a (n + 1)) : ℕ) ≥ 2 ^ (n + 1) := by linarith
                    exact h₂₀
                  ·
                    have h₁₉ : (b n : ℕ) < 2 ^ (n + 1) := by omega
                    have h₂₀ : (a (n + 1) : ℕ) ≥ n + 2 := by omega
                    have h₂₁ : (lcm (b n) (a (n + 1)) : ℕ) ≥ (a (n + 1) : ℕ) :=
                      by
                      apply Nat.le_of_dvd
                      · exact Nat.lcm_pos (by linarith [h_b_pos n]) (by linarith [ha.2 (n + 1)])
                      · exact Nat.dvd_lcm_right _ _
                    have h₂₂ : (a (n + 1) : ℕ) ≥ 2 ^ (n + 1) :=
                      by
                      have h₂₃ : a (n + 1) ≥ n + 2 := by omega
                      have h₂₄ : (n + 2 : ℕ) ≥ 2 ^ (n + 1) :=
                        by
                        have h₂₅ : n + 2 ≥ 2 ^ (n + 1) :=
                          by
                          have h₂₆ : n + 2 ≥ 2 ^ (n + 1) :=
                            by
                            have h₂₇ : n + 2 ≥ 2 ^ (n + 1) :=
                              by
                              clear h₁ h₂ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁
                              have h₂₈ : n + 2 ≥ 2 ^ (n + 1) :=
                                by
                                have h₂₉ : ∀ k : ℕ, k + 2 ≥ 2 ^ (k + 1) := by
                                  intro k
                                  induction k with
                                  | zero => norm_num
                                  | succ k ih => simp_all [Nat.pow_succ, Nat.mul_succ] <;> nlinarith
                                exact h₂₉ n
                              exact h₂₈
                            exact h₂₇
                          exact h₂₆
                        exact h₂₅
                      omega
                    omega <;> omega
                exact h₁₈
              exact h₁₂
            omega <;> simp_all [Nat.pow_succ, Nat.mul_succ] <;> nlinarith
          hole
        --  exact h₅ n
        simpa
      --  exact h₃ n
      simpa
    --  exact h₂
    simpa
  have h_sum_converges : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / b n) atTop (𝓝 L):=
    by
    have h₁ : ∀ n : ℕ, (b n : ℝ) ≥ (2 : ℝ) ^ n:= by
      --  intro n
      have h₂ : (b n : ℕ) ≥ 2 ^ n := h_b_exponential n
      have h₃ : (b n : ℝ) ≥ (2 : ℝ) ^ n:= by
        --  norm_cast at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try ring_nf at h₂ ⊢) <;> (try norm_num at h₂ ⊢) <;>
          (try linarith)
        hole
      --  exact h₃
      hole
    have h₂ : Summable (fun n : ℕ ↦ (1 : ℝ) / b n):=
      by
      have h₃ : ∀ n : ℕ, (1 : ℝ) / b n ≤ (1 : ℝ) / (2 ^ n : ℝ):=
        by
        --  intro n
        have h₄ : (b n : ℝ) ≥ (2 : ℝ) ^ n := h₁ n
        have h₅ : (b n : ℝ) > 0:= by
          have h₅₁ : (b n : ℕ) > 0 := h_b_pos n
          --  exact_mod_cast h₅₁
          linarith
        have h₆ : (1 : ℝ) / b n ≤ (1 : ℝ) / (2 ^ n : ℝ):=
          by
          have h₇ : (b n : ℝ) ≥ (2 : ℝ) ^ n := h₁ n
          have h₈ : (1 : ℝ) / b n ≤ (1 : ℝ) / (2 ^ n : ℝ):=
            by
            --  apply one_div_le_one_div_of_le
            · positivity
            · linarith
            hole
          --  exact h₈
          hole
        --  exact h₆
        hole
      have h₄ : Summable (fun n : ℕ ↦ (1 : ℝ) / (2 ^ n : ℝ)):=
        by
        have h₅ : Summable (fun n : ℕ ↦ (1 : ℝ) / (2 ^ n : ℝ)):=
          by
          have h₅₁ : Summable (fun n : ℕ ↦ (1 : ℝ) / (2 ^ n : ℝ)):=
            by
            have h₅₂ : Summable (fun n : ℕ ↦ (1 : ℝ) / (2 ^ n : ℝ)):= by
              --  simpa [div_eq_mul_inv] using Summable.comp_injective (summable_geometric_two) (fun _ _ h => by simpa using h)
              hole
            --  exact h₅₂
            hole
          --  exact h₅₁
          hole
        --  exact h₅
        hole
      have h₅ : Summable (fun n : ℕ ↦ (1 : ℝ) / b n):=
        by
        have h₅₁ : Summable (fun n : ℕ ↦ (1 : ℝ) / b n):=
          by
          --  refine' Summable.of_nonneg_of_le (fun n ↦ _) (fun n ↦ _) h₄
          ·
            have h₅₂ : (0 : ℝ) ≤ 1 / b n:=
              by
              have h₅₃ : (b n : ℝ) > 0:= by
                have h₅₄ : (b n : ℕ) > 0 := h_b_pos n
                --  exact_mod_cast h₅₄
                linarith
              --  positivity
              norm_num
            exact h₅₂
          ·
            have h₅₂ : (1 : ℝ) / b n ≤ (1 : ℝ) / (2 ^ n : ℝ) := h₃ n
            exact h₅₂
          hole
        --  exact h₅₁
        hole
      --  exact h₅
      hole
    have h₃ : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / b n) atTop (𝓝 L):=
      by
      have h₄ : Summable (fun n : ℕ ↦ (1 : ℝ) / b n) := h₂
      have h₅ : ∃ L : ℝ, Tendsto (fun N ↦ ∑ n in Finset.range N, (1 : ℝ) / b n) atTop (𝓝 L):= by
        --  exact ⟨∑' n : ℕ, (1 : ℝ) / b n, h₄.hasSum.tendsto_sum_nat⟩
        hole
      --  exact h₅
      hole
    --  exact h₃
    hole
  --  exact h_sum_converges
  hole