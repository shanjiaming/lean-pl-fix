theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x ^ 2 + 1) (h_odd : Odd d) (h_pos : 0 < d) :
  d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9:=
  by
  have hd_not_div_five : (d : ℤ) % 5 ≠ 0:= by
    --  intro h
    have h₁ : (5 : ℤ) ∣ d:= by -- omega
      omega
    have h₂ : (5 : ℤ) ∣ 5 * x ^ 2 + 1:= by -- exact dvd_trans h₁ hd
      hole
    have h₃ : (5 : ℤ) ∣ 1:= by -- omega
      omega
    --  omega
    omega
  have h_main : (d : ℤ) % 20 = 1 ∨ (d : ℤ) % 20 = 3 ∨ (d : ℤ) % 20 = 7 ∨ (d : ℤ) % 20 = 9:=
    by
    have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9:=
      by
      have h₂ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9:=
        by
        have h₃ : d % 2 = 1:= by
          --  cases' h_odd with k hk
          have : d % 2 = 1:= by -- omega
            omega
          --  exact this
          linarith
        have h₄ : d % 5 ≠ 0:= by -- simpa using hd_not_div_five
          omega
        have h₅ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 ∨ d % 20 = 11 ∨ d % 20 = 13 ∨ d % 20 = 17 ∨ d % 20 = 19:=
          --  by omega
          hole
        --  rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
        --  · exact Or.inl h₅
        --  · exact Or.inr (Or.inl h₅)
        --  · exact Or.inr (Or.inr (Or.inl h₅))
        --  · exact Or.inr (Or.inr (Or.inr h₅))
        --  · exfalso
          have h₆ : (d : ℤ) % 5 = 1:= by -- omega
            omega
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4:= by -- omega
            omega
          have h₈ : ¬((d : ℤ) % 5 = 0):= by -- simpa using hd_not_div_five
            linarith
          have h₉ : ¬((d : ℤ) % 5 = 1):=
            by
            have h₁₀ : (d : ℤ) % 5 ≠ 1:= by
              --  by_contra h₁₀
              have h₁₁ : (d : ℤ) % 5 = 1:= by -- omega
                linarith
              have h₁₂ : (d : ℤ) % 5 = 1:= by -- omega
                linarith
              have h₁₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
              have h₁₄ : (d : ℤ) % 5 = 1:= by -- omega
                linarith
              have h₁₅ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
                by
                have h₁₆ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                  omega
                --  --  rcases h₁₆ with (h₁₆ | h₁₆ | h₁₆ | h₁₆ | h₁₆) <;> simp [h₁₆, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                omega
              have h₁₆ : (d : ℤ) % 5 = 1:= by -- omega
                linarith
              have h₁₇ : (d : ℤ) % 5 = 1:= by -- omega
                linarith
              have h₁₈ : ¬((d : ℤ) % 5 = 1):= by
                --  by_contra h₁₈
                have h₁₉ : (d : ℤ) % 5 = 1:= by -- omega
                  linarith
                have h₂₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
                  by
                  have h₂₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                    omega
                  --  --  rcases h₂₂ with (h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂) <;> simp [h₂₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                  linarith
                have h₂₂ : (d : ℤ) % 5 = 1:= by -- omega
                  linarith
                have h₂₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₄ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
                  by
                  have h₂₅ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                    omega
                  --  --  rcases h₂₅ with (h₂₅ | h₂₅ | h₂₅ | h₂₅ | h₂₅) <;> simp [h₂₅, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                  linarith
                have h₂₅ : (d : ℤ) % 5 = 1:= by -- omega
                  linarith
                have h₂₆ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₇ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
                  by
                  have h₂₈ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                    omega
                  --  --  rcases h₂₈ with (h₂₈ | h₂₈ | h₂₈ | h₂₈ | h₂₈) <;> simp [h₂₈, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                  linarith
                --  omega
                hole
              --  omega
              omega
            --  omega
            omega
        --    omega
        --  · exfalso
          have h₆ : (d : ℤ) % 5 = 3 := by sorry
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by sorry
          have h₈ : ¬((d : ℤ) % 5 = 0) := by sorry
          have h₉ : (d : ℤ) % 5 = 3 := by sorry
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
            by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
              omega
            --  --  rcases h₁₂ with (h₁₂ | h₁₂ | h₁₂ | h₁₂ | h₁₂) <;> simp [h₁₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            omega
          have h₁₂ : (d : ℤ) % 5 = 3:= by -- omega
            linarith
          have h₁₃ : ¬((d : ℤ) % 5 = 3):= by
            --  by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 3:= by -- omega
              linarith
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
              by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                omega
              --  --  rcases h₁₇ with (h₁₇ | h₁₇ | h₁₇ | h₁₇ | h₁₇) <;> simp [h₁₇, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
              linarith
            have h₁₇ : (d : ℤ) % 5 = 3:= by -- omega
              linarith
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1:=
              by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4:= by -- omega
                omega
              --  --  rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;> simp [h₂₀, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
              linarith
            --  omega
            hole
        --    omega
        --  · exfalso
          have h₆ : (d : ℤ) % 5 = 2 := by sorry
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by sorry
          have h₈ : ¬((d : ℤ) % 5 = 0) := by sorry
          have h₉ : (d : ℤ) % 5 = 2 := by sorry
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by sorry
          have h₁₂ : (d : ℤ) % 5 = 2 := by sorry
          have h₁₃ : ¬((d : ℤ) % 5 = 2) := by sorry
        --    omega
        --  · exfalso
          have h₆ : (d : ℤ) % 5 = 4 := by sorry
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by sorry
          have h₈ : ¬((d : ℤ) % 5 = 0) := by sorry
          have h₉ : (d : ℤ) % 5 = 4 := by sorry
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by sorry
          have h₁₂ : (d : ℤ) % 5 = 4 := by sorry
          have h₁₃ : ¬((d : ℤ) % 5 = 4) := by sorry
        --    omega
        hole
      --  exact h₂
      omega
    have h₃ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9:= by -- assumption
      omega
    --  cases h₃ with
    --  | inl h₃ => norm_num [h₃] at * <;> omega
    --  | inr h₃ =>
    --    cases h₃ with
    --    | inl h₃ => norm_num [h₃] at * <;> omega
    --    | inr h₃ =>
    --      cases h₃ with
    --      | inl h₃ => norm_num [h₃] at * <;> omega
    --      | inr h₃ => norm_num [h₃] at * <;> omega
    omega
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9:= by
    --  cases h_main with
    --  | inl h_main => omega
    --  | inr h_main =>
    --    cases h_main with
    --    | inl h_main => omega
    --    | inr h_main =>
    --      cases h_main with
    --      | inl h_main => omega
    --      | inr h_main => omega
    omega
  --  tauto
  omega