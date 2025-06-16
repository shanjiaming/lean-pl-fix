theorem putnam_1988_b3
    (r : ℤ → ℝ)
    (hr : ∀ n ≥ 1,
      (∃ c d : ℤ,
        (c ≥ 0 ∧ d ≥ 0) ∧
        c + d = n ∧ r n = |c - d * Real.sqrt 3|) ∧
      (∀ c d : ℤ, (c ≥ 0 ∧ d ≥ 0 ∧ c + d = n) → |c - d * Real.sqrt 3| ≥ r n))
    : IsLeast {g : ℝ | g > 0 ∧ (∀ n : ℤ, n ≥ 1 → r n ≤ g)} (((1 + Real.sqrt 3) / 2) : ℝ ) := by
  have h₁ : 0 < (1 + Real.sqrt 3) / 2 := by
    have h₂ : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
    have h₃ : 0 < 1 + Real.sqrt 3 := by linarith
    positivity
  
  have h₂ : ∀ (n : ℤ), n ≥ 1 → r n ≤ (1 + Real.sqrt 3) / 2 := by
    intro n hn
    have h₃ : 0 < (1 + Real.sqrt 3) / 2 := h₁
    -- For any positive integer n, we need to show that r_n ≤ (1 + sqrt(3)) / 2.
    have h₄ : (n : ℤ) ≥ 1 := hn
    have h₅ : (n : ℤ) ≥ 1 := hn
    have h₆ : (∃ (c d : ℤ), (c ≥ 0 ∧ d ≥ 0) ∧ (c + d = n) ∧ (r n = |(c : ℝ) - d * Real.sqrt 3|)) ∧ (∀ (c d : ℤ), (c ≥ 0 ∧ d ≥ 0 ∧ c + d = n) → |(c : ℝ) - d * Real.sqrt 3| ≥ r n) := hr n (by exact_mod_cast hn)
    obtain ⟨⟨c, d, ⟨hc, hd⟩, hcd, hr₁⟩, h₂⟩ := h₆
    -- We have the existence of c, d such that r_n = |c - d sqrt(3)| and the minimum property.
    have h₇ : (c : ℤ) + d = n := by linarith
    -- We need to find the minimal value of |c - d sqrt(3)| for c + d = n.
    have h₈ : r n = |(c : ℝ) - d * Real.sqrt 3| := by
      simpa [hr₁] using hr₁
    -- We need to show that |c - d sqrt(3)| ≤ (1 + sqrt(3)) / 2.
    have h₉ : |(c : ℝ) - d * Real.sqrt 3| ≤ (1 + Real.sqrt 3) / 2 := by
      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
      have h₁₀ : 0 ≤ (n : ℝ) := by positivity
      have h₁₁ : 0 ≤ Real.sqrt 3 := Real.sqrt_nonneg 3
      have h₁₂ : 0 ≤ Real.sqrt 3 := Real.sqrt_nonneg 3
      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
      have h₁₃ : (n : ℝ) = c + d := by
        norm_cast
        <;> linarith
      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
      have h₁₄ : |(c : ℝ) - d * Real.sqrt 3| ≤ (1 + Real.sqrt 3) / 2 := by
        -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
        have h₁₅ : (c : ℝ) - d * Real.sqrt 3 = (n : ℝ) - d * (1 + Real.sqrt 3) := by
          have h₁₆ : (n : ℝ) = c + d := by
            norm_cast
            <;> linarith
          rw [h₁₆]
          ring_nf
          <;>
          simp_all [add_assoc]
          <;>
          ring_nf at *
          <;>
          linarith
        rw [h₁₅]
        -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
        have h₁₆ : |(n : ℝ) - d * (1 + Real.sqrt 3)| ≤ (1 + Real.sqrt 3) / 2 := by
          -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
          have h₁₇ : |(n : ℝ) - d * (1 + Real.sqrt 3)| ≤ (1 + Real.sqrt 3) / 2 := by
            -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
            have h₁₈ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := by
              -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
              have h₁₉ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := by
                -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                have h₂₀ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := by
                  -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                  have h₂₁ : (n : ℝ) / (1 + Real.sqrt 3) - d = (n : ℝ) / (1 + Real.sqrt 3) - d := by rfl
                  rw [h₂₁]
                  -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                  have h₂₂ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := by
                    -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                    have h₂₃ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := by
                      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                      -- This is a geometric argument based on the irrationality of sqrt(3).
                      have h₂₄ : 0 < Real.sqrt 3 := Real.sqrt_pos.mpr (by norm_num)
                      have h₂₅ : 0 < 1 + Real.sqrt 3 := by positivity
                      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                      have h₂₆ : 0 < 1 + Real.sqrt 3 := by positivity
                      -- We use the fact that the distance between n and d (1 + sqrt(3)) is at most (1 + sqrt(3)) / 2.
                      rw [abs_le]
                      constructor <;>
                      (try norm_num) <;>
                      (try ring_nf) <;>
                      (try field_simp [h₂₄, h₂₅, h₂₆]) <;>
                      (try rw [div_le_div_iff (by positivity) (by positivity)]) <;>
                      (try norm_num) <;>
                      (try nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num)]) <;>
                      (try
                        {
                          nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num),
                            sq_nonneg (c - d), sq_nonneg (c + d),
                            sq_nonneg (c - d - 1), sq_nonneg (c - d + 1)]
                        })
                    exact h₂₃
                  exact h₂₂
                exact h₂₀
              exact h₁₉
            have h₂₇ : |(n : ℝ) - d * (1 + Real.sqrt 3)| ≤ (1 + Real.sqrt 3) / 2 := by
              have h₂₈ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := h₁₈
              have h₂₉ : |(n : ℝ) - d * (1 + Real.sqrt 3)| = (1 + Real.sqrt 3) * |(n : ℝ) / (1 + Real.sqrt 3) - d| := by
                have h₃₀ : 0 < 1 + Real.sqrt 3 := by positivity
                have h₃₁ : |(n : ℝ) - d * (1 + Real.sqrt 3)| = (1 + Real.sqrt 3) * |(n : ℝ) / (1 + Real.sqrt 3) - d| := by
                  calc
                    |(n : ℝ) - d * (1 + Real.sqrt 3)| = |(1 + Real.sqrt 3) * ((n : ℝ) / (1 + Real.sqrt 3) - d)| := by
                      field_simp [h₃₀.ne']
                      <;> ring_nf
                      <;> simp [abs_mul, abs_of_pos, h₃₀]
                      <;> field_simp [h₃₀.ne']
                      <;> ring_nf
                    _ = (1 + Real.sqrt 3) * |(n : ℝ) / (1 + Real.sqrt 3) - d| := by
                      rw [abs_mul, abs_of_pos (by positivity : (0 : ℝ) < 1 + Real.sqrt 3)]
                      <;> ring_nf
                      <;> simp [abs_mul, abs_of_pos, h₃₀]
                      <;> field_simp [h₃₀.ne']
                      <;> ring_nf
                      <;> simp [abs_mul, abs_of_pos, h₃₀]
                exact h₃₁
              rw [h₂₉]
              have h₃₂ : (0 : ℝ) ≤ 1 + Real.sqrt 3 := by positivity
              have h₃₃ : 0 ≤ (1 + Real.sqrt 3) := by positivity
              have h₃₄ : |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ 1 / 2 := h₁₈
              have h₃₅ : (1 + Real.sqrt 3) * |(n : ℝ) / (1 + Real.sqrt 3) - d| ≤ (1 + Real.sqrt 3) * (1 / 2) := by
                gcongr
              nlinarith [Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
            exact h₂₇
          exact h₁₇
        exact h₁₆
      -- We have shown that |c - d sqrt(3)| ≤ (1 + sqrt(3)) / 2.
      have h₂₀ : |(c : ℝ) - d * Real.sqrt 3| ≤ (1 + Real.sqrt 3) / 2 := h₁₄
      linarith
    -- We have shown that r_n ≤ (1 + sqrt(3)) / 2.
    have h₂₁ : r n ≤ (1 + Real.sqrt 3) / 2 := by
      rw [h₈]
      exact h₉
    exact h₂₁
  
  have h₃ : IsLeast {g : ℝ | g > 0 ∧ (∀ n : ℤ, n ≥ 1 → r n ≤ g)} (((1 + Real.sqrt 3) / 2) : ℝ) := by
    refine' ⟨⟨h₁, _⟩, _⟩
    · intro n hn
      exact h₂ n hn
    · rintro g ⟨hg₁, hg₂⟩
      by_contra h
      -- We will show that if g < (1 + Real.sqrt 3) / 2, then g cannot be in the set.
      have h₄ : g > 0 := hg₁
      have h₅ : ∀ (n : ℤ), n ≥ 1 → r n ≤ g := hg₂
      -- We need to show that (1 + Real.sqrt 3) / 2 ≤ g.
      have h₆ : (1 + Real.sqrt 3) / 2 ≤ g := by
        by_contra h₆
        -- If g < (1 + Real.sqrt 3) / 2, then we can find a contradiction.
        have h₇ : g < (1 + Real.sqrt 3) / 2 := by linarith
        -- We have a contradiction because g cannot be both less than and greater than or equal to (1 + Real.sqrt 3) / 2.
        have h₈ : ∃ (n : ℤ), n ≥ 1 ∧ r n > g := by
          use 1
          constructor
          · norm_num
          · have h₉ := hr 1 (by norm_num)
            obtain ⟨⟨c, d, ⟨hc, hd⟩, hcd, hr₁⟩, h₂⟩ := h₉
            have h₁₀ : r 1 = |(c : ℝ) - d * Real.sqrt 3| := by simpa [hr₁] using hr₁
            have h₁₁ : (c : ℤ) + d = 1 := by linarith
            have h₁₂ : (c : ℤ) ≥ 0 := by linarith
            have h₁₃ : (d : ℤ) ≥ 0 := by linarith
            have h₁₄ : (c : ℤ) = 1 ∧ (d : ℤ) = 0 ∨ (c : ℤ) = 0 ∧ (d : ℤ) = 1 := by
              have h₁₅ : (c : ℤ) + d = 1 := by linarith
              have h₁₆ : (c : ℤ) ≥ 0 := by linarith
              have h₁₇ : (d : ℤ) ≥ 0 := by linarith
              have h₁₈ : (c : ℤ) ≤ 1 := by
                nlinarith
              have h₁₉ : (d : ℤ) ≤ 1 := by
                nlinarith
              have h₂₀ : (c : ℤ) = 1 ∧ (d : ℤ) = 0 ∨ (c : ℤ) = 0 ∧ (d : ℤ) = 1 := by
                omega
              exact h₂₀
            cases h₁₄ with
            | inl h₁₄ =>
              -- Case: c = 1, d = 0
              have h₂₁ : (c : ℤ) = 1 := h₁₄.1
              have h₂₂ : (d : ℤ) = 0 := h₁₄.2
              have h₂₃ : r 1 = |(c : ℝ) - d * Real.sqrt 3| := by simpa [hr₁] using hr₁
              have h₂₄ : r 1 = 1 := by
                rw [h₂₃]
                have h₂₅ : (c : ℝ) = 1 := by norm_cast <;> simp_all
                have h₂₆ : (d : ℝ) = 0 := by norm_cast <;> simp_all
                rw [h₂₅, h₂₆]
                norm_num [abs_of_pos]
                <;>
                simp_all [Real.sqrt_eq_iff_sq_eq] <;>
                nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
            | inr h₁₄ =>
              -- Case: c = 0, d = 1
              have h₂₁ : (c : ℤ) = 0 := h₁₄.1
              have h₂₂ : (d : ℤ) = 1 := h₁₄.2
              have h₂₃ : r 1 = |(c : ℝ) - d * Real.sqrt 3| := by simpa [hr₁] using hr₁
              have h₂₄ : r 1 = Real.sqrt 3 := by
                rw [h₂₃]
                have h₂₅ : (c : ℝ) = 0 := by norm_cast <;> simp_all
                have h₂₆ : (d : ℝ) = 1 := by norm_cast <;> simp_all
                rw [h₂₅, h₂₆]
                norm_num [abs_of_pos, Real.sqrt_pos, Real.sqrt_nonneg]
                <;>
                simp_all [Real.sqrt_eq_iff_sq_eq] <;>
                nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              have h₂₅ : Real.sqrt 3 > g := by
                nlinarith [Real.sqrt_nonneg 3, Real.sq_sqrt (show 0 ≤ 3 by norm_num)]
              linarith
        obtain ⟨n, hn₁, hn₂⟩ := h₈
        have h₉ : r n ≤ g := h₅ n hn₁
        linarith
      linarith
  exact h₃