theorem putnam_1980_a4
    (abcvals : ℤ → ℤ → ℤ → Prop)
    (habcvals : ∀ a b c : ℤ, abcvals a b c ↔ (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000) :
    (∃ a b c : ℤ,
      abcvals a b c ∧
      |a + b * Real.sqrt 2 + c * Real.sqrt 3| < 10 ^ (-(11 : ℝ))) ∧
      (∀ a b c : ℤ, abcvals a b c → |a + b * Real.sqrt 2 + c * Real.sqrt 3| > 10 ^ (-(21 : ℝ))) := by
  have h_main₁ : ∃ a b c : ℤ, abcvals a b c ∧ |(a : ℝ) + (b : ℝ) * Real.sqrt 2 + (c : ℝ) * Real.sqrt 3| < (10 : ℝ) ^ (-(11 : ℝ)) := by
    refine' ⟨0, 0, 0, _⟩
    have h₁ : abcvals 0 0 0 := by
      rw [habcvals]
      norm_num [abs_of_nonneg, abs_of_nonpos, Int.cast_zero]
    have h₂ : |(0 : ℝ) + (0 : ℝ) * Real.sqrt 2 + (0 : ℝ) * Real.sqrt 3| < (10 : ℝ) ^ (-(11 : ℝ)) := by
      have h₃ : (10 : ℝ) ^ (-(11 : ℝ)) > 0 := by positivity
      have h₄ : |(0 : ℝ) + (0 : ℝ) * Real.sqrt 2 + (0 : ℝ) * Real.sqrt 3| = 0 := by
        norm_num [abs_of_nonneg, Real.sqrt_nonneg, add_assoc]
      rw [h₄]
      linarith
    exact ⟨h₁, by simpa using h₂⟩
  
  have h_main₂ : False := by
    obtain ⟨a, b, c, h₁, h₂⟩ := h_main₁
    have h₃ : a = 0 ∧ b = 0 ∧ c = 0 := by
      have h₄ : (a = 0 ∧ b = 0 ∧ c = 0) ∧ |a| < 1000000 ∧ |b| < 1000000 ∧ |c| < 1000000 := by
        simpa [habcvals] using h₁
      exact h₄.1
    have h₄ : |(a : ℝ) + (b : ℝ) * Real.sqrt 2 + (c : ℝ) * Real.sqrt 3| = 0 := by
      have h₅ : (a : ℝ) = 0 := by exact_mod_cast h₃.1
      have h₆ : (b : ℝ) = 0 := by exact_mod_cast h₃.2.1
      have h₇ : (c : ℝ) = 0 := by exact_mod_cast h₃.2.2
      rw [h₅, h₆, h₇]
      norm_num [abs_of_nonneg, Real.sqrt_nonneg, add_assoc]
    have h₅ : |(a : ℝ) + (b : ℝ) * Real.sqrt 2 + (c : ℝ) * Real.sqrt 3| < (10 : ℝ) ^ (-(11 : ℝ)) := by simpa using h₂
    rw [h₄] at h₅
    have h₆ : (10 : ℝ) ^ (-(11 : ℝ)) > 0 := by
      positivity
    linarith
  
  exfalso
  exact h_main₂