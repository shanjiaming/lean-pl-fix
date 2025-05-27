theorem perfect_square_condition {m : ℤ} (h : m = 2 + 2 * Real.sqrt (28 * n ^ 2 + 1))
  (h_int : ∃ k : ℤ, Real.sqrt (28 * n ^ 2 + 1) = k) : ∃ k : ℤ, m = k ^ 2:=
  by
  have h_main : ∃ (t : ℤ), m = t ^ 2:= by
    --  obtain ⟨k, hk⟩ := h_int
    have h₁ : (k : ℝ) = Real.sqrt (28 * (n : ℝ) ^ 2 + 1):= by
      --  norm_num [hk] at hk ⊢ <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;> ring_nf at * <;> nlinarith
      linarith
    have h₂ : (k : ℝ) ^ 2 = (28 * (n : ℝ) ^ 2 + 1 : ℝ):= by
      --  rw [h₁]
      rw [Real.sq_sqrt (by positivity)] <;> ring_nf <;> nlinarith
      hole
    have h₃ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1:=
      by
      have h₃₁ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1:= by -- -- -- norm_cast at h₂ ⊢ <;> ring_nf at h₂ ⊢ <;> nlinarith
        hole
      --  exact h₃₁
      hole
    have h₄ : m = 2 + 2 * k:=
      by
      have h₄₁ : (m : ℝ) = 2 + 2 * Real.sqrt (28 * (n : ℝ) ^ 2 + 1):= by
        --  norm_num [h] <;> ring_nf at * <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;> nlinarith
        hole
      have h₄₂ : (m : ℝ) = 2 + 2 * (k : ℝ):= by
        --  rw [h₄₁, h₁] <;> ring_nf at * <;> simp_all [Real.sqrt_eq_iff_sq_eq] <;> nlinarith
        hole
      have h₄₃ : m = 2 + 2 * k:= by
        --  norm_cast at h₄₂ ⊢ <;> ring_nf at h₄₂ ⊢ <;> simp_all [Complex.ext_iff, pow_two] <;> nlinarith
        hole
      --  exact h₄₃
      hole
    have h₅ : k ≥ 0:= by
      --  by_contra h₅₁
      have h₅₂ : k < 0:= by -- linarith
        hole
      have h₅₃ : (k : ℝ) < 0:= by -- exact_mod_cast h₅₂
        hole
      have h₅₄ : Real.sqrt (28 * (n : ℝ) ^ 2 + 1) > 0:= by -- positivity
        hole
      have h₅₅ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1):= by
        --  nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
        hole
      have h₅₆ : (k : ℝ) < Real.sqrt (28 * (n : ℝ) ^ 2 + 1):= by
        --  nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
        hole
      have h₅₇ : (k : ℝ) ≠ Real.sqrt (28 * (n : ℝ) ^ 2 + 1):= by -- linarith
        hole
      have h₅₈ : False:= by
        --  simp_all [hk, h₁, h₂, h₃, h₄] <;>
          nlinarith [Real.sqrt_nonneg (28 * (n : ℝ) ^ 2 + 1), Real.sq_sqrt (by positivity : (0 : ℝ) ≤ 28 * (n : ℝ) ^ 2 + 1)]
        hole
      --  exact h₅₈
      hole
    have h₆ : ∃ (t : ℤ), m = t ^ 2:= by
      have h₆₁ : m = 2 + 2 * k:= by -- exact h₄
        hole
      have h₆₂ : (k : ℤ) ^ 2 = 28 * n ^ 2 + 1:= by -- exact h₃
        hole
      have h₆₃ : (k : ℤ) ≥ 0:= by -- exact_mod_cast h₅
        hole
      have h₆₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2:=
        by
        have h₆₄₁ : (k - 1 : ℤ) % 2 = 0:=
          by
          have h₆₄₂ : (k : ℤ) % 2 = 1:= by
            --  by_contra h₆₄₃
            have h₆₄₄ : (k : ℤ) % 2 = 0:= by -- omega
              hole
            have h₆₄₅ : (k : ℤ) ^ 2 % 4 = 0:=
              by
              have h₆₄₆ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2:= by -- omega
                hole
              --  --  rcases h₆₄₆ with (h₆₄₆ | h₆₄₆) <;> simp [h₆₄₆, pow_two, Int.mul_emod, Int.add_emod]
              hole
            have h₆₄₆ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1:=
              by
              have h₆₄₇ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1:=
                by
                have h₆₄₈ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3:= by -- omega
                  hole
                --  --  rcases h₆₄₈ with (h₆₄₈ | h₆₄₈ | h₆₄₈ | h₆₄₈) <;> simp [h₆₄₈, pow_two, Int.mul_emod, Int.add_emod]
                hole
              --  --  rcases h₆₄₇ with (h₆₄₇ | h₆₄₇) <;> simp [h₆₄₇, Int.add_emod, Int.mul_emod, pow_two]
              hole
            --  omega
            hole
          --  omega
          hole
        have h₆₄₂ : (k + 1 : ℤ) % 2 = 0:=
          by
          have h₆₄₃ : (k : ℤ) % 2 = 1:= by
            --  by_contra h₆₄₄
            have h₆₄₅ : (k : ℤ) % 2 = 0:= by -- omega
              hole
            have h₆₄₆ : (k : ℤ) ^ 2 % 4 = 0:=
              by
              have h₆₄₇ : (k : ℤ) % 4 = 0 ∨ (k : ℤ) % 4 = 2:= by -- omega
                hole
              --  --  rcases h₆₄₇ with (h₆₄₇ | h₆₄₇) <;> simp [h₆₄₇, pow_two, Int.mul_emod, Int.add_emod]
              hole
            have h₆₄₇ : (28 * n ^ 2 + 1 : ℤ) % 4 = 1:=
              by
              have h₆₄₈ : (n : ℤ) ^ 2 % 4 = 0 ∨ (n : ℤ) ^ 2 % 4 = 1:=
                by
                have h₆₄₉ : (n : ℤ) % 4 = 0 ∨ (n : ℤ) % 4 = 1 ∨ (n : ℤ) % 4 = 2 ∨ (n : ℤ) % 4 = 3:= by -- omega
                  hole
                --  --  rcases h₆₄₉ with (h₆₄₉ | h₆₄₉ | h₆₄₉ | h₆₄₉) <;> simp [h₆₄₉, pow_two, Int.mul_emod, Int.add_emod]
                hole
              --  --  rcases h₆₄₈ with (h₆₄₈ | h₆₄₈) <;> simp [h₆₄₈, Int.add_emod, Int.mul_emod, pow_two]
              hole
            --  omega
            hole
          --  omega
          hole
        have h₆₄₃ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2:=
          by
          have h₆₄₄ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
            by
            have h₆₄₅ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ):= by -- omega
              hole
            have h₆₄₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
              by
              have h₆₄₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                by
                have h₆₄₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ):= by -- omega
                  hole
                have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                  by
                  have h₆₄₁₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2:=
                    by
                    have h₆₄₁₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1:= by -- exact h₃
                      hole
                    --  nlinarith
                    hole
                  have h₆₄₁₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                    by
                    have h₆₄₁₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                      by
                      have h₆₄₁₄ : (k - 1 : ℤ) % 2 = 0:= by -- omega
                        hole
                      have h₆₄₁₅ : (k + 1 : ℤ) % 2 = 0:= by -- omega
                        hole
                      have h₆₄₁₆ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                        by
                        have h₆₄₁₇ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                          by
                          have h₆₄₁₈ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ):= by -- omega
                            hole
                          have h₆₄₁₉ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ):= by -- omega
                            hole
                          have h₆₄₂₀ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2:=
                            by
                            have h₆₄₂₁ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1:= by -- exact h₃
                              hole
                            --  nlinarith
                            hole
                          have h₆₄₂₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:=
                            by
                            have h₆₄₂₃ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ):= by -- omega
                              hole
                            have h₆₄₂₄ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ):= by -- omega
                              hole
                            have h₆₄₂₅ : (k - 1 : ℤ) * (k + 1 : ℤ) = 4 * 7 * (n : ℤ) ^ 2:=
                              by
                              have h₆₄₂₆ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1:= by -- exact h₃
                                hole
                              --  nlinarith
                              hole
                            --  nlinarith
                            hole
                          --  exact h₆₄₂₂
                          hole
                        --  exact h₆₄₁₇
                        hole
                      --  exact h₆₄₁₆
                      hole
                    --  exact h₆₄₁₃
                    hole
                  --  exact h₆₄₁₂
                  hole
                --  exact h₆₄₉
                hole
              --  exact h₆₄₇
              hole
            --  exact h₆₄₆
            hole
          have h₆₄₅ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2:=
            by
            have h₆₄₆ : (k - 1 : ℤ) / 2 ≥ 0:= by
              --  by_contra h₆₄₇
              have h₆₄₈ : (k - 1 : ℤ) / 2 < 0:= by -- linarith
                hole
              have h₆₄₉ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) < 0:= by -- nlinarith
                hole
              have h₆₅₀ : 7 * (n : ℤ) ^ 2 ≥ 0:= by -- positivity
                hole
              --  nlinarith
              hole
            have h₆₅₁ : (k + 1 : ℤ) / 2 ≥ 0:= by
              --  by_contra h₆₅₂
              have h₆₅₃ : (k + 1 : ℤ) / 2 < 0:= by -- linarith
                hole
              have h₆₅₄ : (k + 1 : ℤ) / 2 ≤ 0:= by -- linarith
                hole
              have h₆₅₅ : (k + 1 : ℤ) ≤ 0:= by
                have h₆₅₆ : (k + 1 : ℤ) / 2 * 2 ≤ 0:= by -- nlinarith
                  hole
                --  omega
                hole
              have h₆₅₆ : (k : ℤ) ≤ -1:= by -- linarith
                hole
              have h₆₅₇ : (k : ℤ) ^ 2 ≥ 1:= by -- nlinarith
                hole
              have h₆₅₈ : 28 * (n : ℤ) ^ 2 + 1 ≥ 1:= by -- nlinarith
                hole
              have h₆₅₉ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1:= by -- exact h₃
                hole
              --  nlinarith
              hole
            have h₆₅₂ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2:=
              by
              have h₆₅₃ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2:= by -- omega
                hole
              have h₆₅₄ : ∃ (a b : ℤ), (k - 1) / 2 = 7 * a ^ 2 ∧ (k + 1) / 2 = b ^ 2:=
                by
                have h₆₅₅ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2:=
                  by
                  have h₆₅₆ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1):= by -- use (n : ℤ) ^ 2 <;> linarith
                    hole
                  have h₆₅₇ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1):=
                    by
                    have h₆₅₈ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1):= by -- exact h₆₅₆
                      hole
                    have h₆₅₉ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1):=
                      by
                      have h₆₅₁₀ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1):= by -- exact h₆₅₈
                        hole
                      have h₆₅₁₁ : 7 ∣ (k - 1 : ℤ) / 2 ∨ 7 ∣ ((k - 1 : ℤ) / 2 + 1):=
                        by
                        have h₆₅₁₂ : 7 ∣ (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1):= by -- exact h₆₅₈
                          hole
                        --  exact (Int.prime_iff_natAbs_prime.mpr (by decide)).dvd_mul.mp h₆₅₁₂
                        hole
                      --  exact h₆₅₁₁
                      hole
                    --  exact h₆₅₉
                    hole
                  --  cases h₆₅₇ with
                  --  | inl h₆₅₇ =>
                  --    obtain ⟨a, ha⟩ := h₆₅₇
                  --    use a <;> (try omega) <;> (try nlinarith) <;> (try ring_nf at ha ⊢ <;> nlinarith)
                  --  | inr h₆₅₇ =>
                  --    have h₆₅₈ : (k - 1 : ℤ) / 2 ≥ 0 := by omega
                  --    have h₆₅₉ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 :=
                  --      by
                  --      have h₆₅₁₀ : 7 ∣ ((k - 1 : ℤ) / 2 + 1) := h₆₅₇
                  --      have h₆₅₁₁ : ∃ (a : ℤ), (k - 1) / 2 = 7 * a ^ 2 :=
                  --        by
                  --        by_contra h₆₅₁₂
                  --        exfalso
                  --        have h₆₅₁₃ := h₆₅₁₀
                  --        omega
                  --      exact h₆₅₁₁
                  --    obtain ⟨a, ha⟩ := h₆₅₉
                  --    use a <;> (try omega) <;> (try nlinarith) <;> (try ring_nf at ha ⊢ <;> nlinarith)
                  hole
                --  obtain ⟨a, ha⟩ := h₆₅₅
                have h₆₅₆ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 :=
                  by
                  have h₆₅₇ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                  have h₆₅₈ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                    by_contra h₆₅₉
                    push_neg at h₆₅₉
                    have h₆₅₁₀ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by omega
                    have h₆₅₁₁ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                    have h₆₅₁₂ : (k - 1 : ℤ) / 2 * ((k - 1 : ℤ) / 2 + 1) = 7 * (n : ℤ) ^ 2 := by omega
                    have h₆₅₁₃ : 7 * a ^ 2 + 1 ≥ 0 := by nlinarith
                    have h₆₅₁₄ : (k + 1 : ℤ) / 2 ≥ 0 := by omega
                    have h₆₅₁₅ : (k + 1 : ℤ) / 2 = ((k + 1 : ℤ) / 2) := by rfl
                    have h₆₅₁₆ : (k + 1 : ℤ) / 2 > 0 := by
                      by_contra h₆₅₁₇
                      have h₆₅₁₈ : (k + 1 : ℤ) / 2 ≤ 0 := by linarith
                      have h₆₅₁₉ : (k + 1 : ℤ) ≤ 0 := by omega
                      have h₆₅₂₀ : (k : ℤ) ≤ -1 := by linarith
                      have h₆₅₂₁ : (k : ℤ) ^ 2 ≥ 1 := by nlinarith
                      have h₆₅₂₂ : 28 * (n : ℤ) ^ 2 + 1 ≥ 1 := by nlinarith
                      have h₆₅₂₃ : (k : ℤ) ^ 2 = 28 * (n : ℤ) ^ 2 + 1 := by omega
                      nlinarith
                    have h₆₅₂₄ : (k + 1 : ℤ) / 2 > 0 := by omega
                    have h₆₅₂₅ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                    have h₆₅₂₆ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 :=
                      by
                      have h₆₅₂₇ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                      have h₆₅₂₈ : (k + 1 : ℤ) / 2 ≥ 1 := by omega
                      have h₆₅₂₉ : ∃ (b : ℤ), (k + 1) / 2 = b ^ 2 := by
                        by_contra h₆₅₃₀
                        push_neg at h₆₅₃₀
                        have h₆₅₃₁ : ∀ (b : ℤ), (k + 1) / 2 ≠ b ^ 2 := by exact h₆₅₃₀
                        have h₆₅₃₂ := h₆₅₃₁ 0
                        have h₆₅₃₃ := h₆₅₃₁ 1
                        have h₆₅₃₄ := h₆₅₃₁ (-1)
                        have h₆₅₃₅ : (k + 1 : ℤ) / 2 ≠ 0 ^ 2 := by omega
                        have h₆₅₃₆ : (k + 1 : ℤ) / 2 ≠ 1 ^ 2 := by omega
                        have h₆₅₃₇ : (k + 1 : ℤ) / 2 ≠ (-1) ^ 2 := by omega
                        omega
                      exact h₆₅₂₉
                    exact h₆₅₂₆
                  exact h₆₅₈
                --  obtain ⟨b, hb⟩ := h₆₅₆
                --  --  refine' ⟨a, b, _⟩ <;> simp_all [ha, hb] <;> ring_nf at * <;> omega
                hole
              --  exact h₆₅₄
              hole
            --  exact h₆₅₂
            hole
          --  exact h₆₄₅
          hole
        --  exact h₆₄₃
        hole
      --  obtain ⟨a, b, h₆₅, h₆₆⟩ := h₆₄₃
      have h₆₇ : m = (2 * b) ^ 2 := by
        have h₆₇₁ : m = 2 + 2 * k := by exact h₄
        have h₆₇₂ : (k + 1 : ℤ) / 2 = b ^ 2 := by omega
        have h₆₇₃ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by omega
        have h₆₇₄ : m = (2 * b) ^ 2 := by
          have h₆₇₅ : (k + 1 : ℤ) / 2 = b ^ 2 := by omega
          have h₆₇₆ : (k - 1 : ℤ) / 2 = 7 * a ^ 2 := by omega
          have h₆₇₇ : m = 2 + 2 * k := by omega
          have h₆₇₈ : (2 * b : ℤ) ^ 2 = 4 * b ^ 2 := by ring
          have h₆₇₉ : (k + 1 : ℤ) / 2 * 2 = (k + 1 : ℤ) :=
            by
            have h₆₈₀ : (k + 1 : ℤ) % 2 = 0 :=
              by
              have h₆₈₁ : (k - 1 : ℤ) % 2 = 0 := by omega
              omega
            omega
          have h₆₈₀ : (k - 1 : ℤ) / 2 * 2 = (k - 1 : ℤ) :=
            by
            have h₆₈₁ : (k - 1 : ℤ) % 2 = 0 := by omega
            omega
          have h₆₈₁ : m = (2 * b) ^ 2 := by nlinarith
          exact h₆₈₁
        exact h₆₇₄
      refine' ⟨2 * b, _⟩
      rw [h₆₇] <;> simp [sq] <;> ring_nf at * <;> omega
      hole
    --  obtain ⟨t, ht⟩ := h₆
    --  refine' ⟨t, _⟩
    --  linarith
    hole
  --  obtain ⟨t, ht⟩ := h_main
  --  exact ⟨t, by simp_all [sq]⟩
  simpa