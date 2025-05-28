theorem h₅ (a b : ℕ → ℕ) (ha : StrictMono a ∧ ∀ (n : ℕ), a n > 0) (hb : b 0 = a 0 ∧ ∀ (n : ℕ), b (n + 1) = lcm (b n) (a (n + 1))) (h_b_pos : ∀ (n : ℕ), b n > 0) (h_b_mono : ∀ (n : ℕ), b n ≤ b (n + 1)) (h₁ : ∀ (n : ℕ), a n ≥ n + 1) (n✝ n : ℕ) (h₄ : a n ≥ n + 1) : ∀ (n : ℕ), b n ≥ 2 ^ n := by
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