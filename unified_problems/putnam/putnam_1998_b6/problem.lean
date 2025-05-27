theorem putnam_1998_b6
: ∀ a b c : ℤ, ∃ n : ℤ, n > 0 ∧ ¬(∃ k : ℤ, k = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
  intro a b c
  have h_main : ∃ (n : ℤ), n > 0 ∧ ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n^3 + a * n^2 + b * n + c)) := by
    use 4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ)
    constructor
    · -- Prove that n > 0
      norm_num [abs_nonneg, le_max_left, le_max_right, le_refl, le_trans]
      <;>
      positivity
    · -- Prove that no integer k satisfies (k : ℝ) = Real.sqrt (n^3 + a * n^2 + b * n + c)
      intro h
      rcases h with ⟨k, hk⟩
      have h₁ : (k : ℝ) = Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
        simpa using hk
      have h₂ : (k : ℝ) ^ 2 = ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 3 + a * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) ^ 2 + b * ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) : ℝ) + c := by
        rw [h₁]
        have h₃ : 0 ≤ Real.sqrt ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c) := by
          apply Real.sqrt_nonneg
        nlinarith [Real.sq_sqrt (show 0 ≤ ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c : ℝ) by
          have h₄ : ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c : ℝ) ≥ 0 := by
            have h₅ : ((4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c : ℝ) ≥ 0 := by
              norm_cast
              have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by
                have h₇ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
                  exact Int.ofNat_zero_le _
                have h₈ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
                  nlinarith
                nlinarith
              have h₉ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by
                exact h₆
              have h₁₀ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16 := by
                nlinarith
              have h₁₁ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64 := by
                nlinarith
              have h₁₂ : (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
                have h₁₃ : (a : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
                  have h₁₄ : (a : ℤ) ≥ -((abs a : ℤ)) := by
                    cases' abs_cases a with h₁₅ h₁₅ <;> linarith
                  have h₁₅ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
                    exact le_max_left_of_le (le_max_left _ _)
                  linarith
                nlinarith
              have h₁₃ : (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) := by
                have h₁₄ : (b : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
                  have h₁₅ : (b : ℤ) ≥ -((abs b : ℤ)) := by
                    cases' abs_cases b with h₁₆ h₁₆ <;> linarith
                  have h₁₆ : (abs b : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
                    exact le_max_right_of_le (le_max_left _ _)
                  linarith
                nlinarith
              have h₁₄ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
                have h₁₅ : (c : ℤ) ≥ -((abs c : ℤ)) := by
                  cases' abs_cases c with h₁₆ h₁₆ <;> linarith
                have h₁₆ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
                  exact le_max_right _ _
                linarith
              have h₁₅ : (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 + (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 - ((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) - ((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
                nlinarith
              have h₁₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 + (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 + (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + (c : ℤ) ≥ 0 := by
                have h₁₇ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) / 2 := by
                  omega
                nlinarith
              linarith
            exact_mod_cast h₅
          exact_mod_cast h₄
        )]
      have h₃ : (k : ℤ) ^ 2 = (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 3 + a * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) ^ 2 + b * (4 + 2 * (↑(max (max (abs a) (abs b)) (abs c)) : ℤ) : ℤ) + c := by
        norm_cast at h₂ ⊢
        <;>
        (try norm_num) <;>
        (try ring_nf at h₂ ⊢) <;>
        (try simp_all [Complex.ext_iff, pow_two, pow_three]) <;>
        (try nlinarith) <;>
        (try ring_nf at h₂ ⊢) <;>
        (try norm_num at h₂ ⊢) <;>
        (try linarith)
      have h₄ : False := by
        have h₅ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ 4 := by
          have h₆ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            exact Int.ofNat_zero_le _
          have h₇ : (2 : ℤ) * (max (max (abs a) (abs b)) (abs c) : ℤ) ≥ 0 := by
            nlinarith
          nlinarith
        have h₆ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ 16 := by
          nlinarith
        have h₇ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 ≥ 64 := by
          nlinarith
        have h₈ : (a : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₉ : (a : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₀ : (a : ℤ) ≥ -((abs a : ℤ)) := by
              cases' abs_cases a with h₁₁ h₁₁ <;> linarith
            have h₁₁ : (abs a : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              exact le_max_left_of_le (le_max_left _ _)
            linarith
          nlinarith
        have h₉ : (b : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₀ : (b : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
            have h₁₁ : (b : ℤ) ≥ -((abs b : ℤ)) := by
              cases' abs_cases b with h₁₂ h₁₂ <;> linarith
            have h₁₂ : (abs b : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
              exact le_max_right_of_le (le_max_left _ _)
            linarith
          nlinarith
        have h₁₀ : (c : ℤ) ≥ -((max (max (abs a) (abs b)) (abs c)) : ℤ) := by
          have h₁₁ : (c : ℤ) ≥ -((abs c : ℤ)) := by
            cases' abs_cases c with h₁₂ h₁₂ <;> linarith
          have h₁₂ : (abs c : ℤ) ≤ (max (max (abs a) (abs b)) (abs c) : ℤ) := by
            exact le_max_right _ _
          linarith
        have h₁₁ : (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 3 + a * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 + b * (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + c > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          have h₁₂ : (max (max (abs a) (abs b)) (abs c) : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) / 2 := by
            omega
          nlinarith
        have h₁₂ : (k : ℤ) ^ 2 > (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) ^ 2 := by
          nlinarith
        have h₁₃ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          nlinarith
        have h₁₄ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          nlinarith
        have h₁₅ : (k : ℤ) ≤ (4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1 := by
          nlinarith
        have h₁₆ : (k : ℤ) ≥ -((4 + 2 * (max (max (abs a) (abs b)) (abs c)) : ℤ) + 1) := by
          nlinarith
        have h₁₇ : False := by
          nlinarith
        exact h₁₇
      exact h₄
  rcases h_main with ⟨n, hn, hn'⟩
  refine' ⟨n, hn, _⟩
  intro h
  rcases h with ⟨k, hk⟩
  have h₁ : (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c) := by
    simpa using hk
  have h₂ : ¬(∃ (k : ℤ), (k : ℝ) = Real.sqrt (n ^ 3 + a * n ^ 2 + b * n + c)) := by
    exact hn'
  exact h₂ ⟨k, by simpa using h₁⟩