theorem odd_divisors_of_polynomial_congruence_mod_20 (d x : ℤ) (hd : d ∣ 5 * x^2 + 1) (h_odd : Odd d) (h_pos : 0 < d) :
  d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
  have hd_not_div_five : (d : ℤ) % 5 ≠ 0 := by
    -- Assume for contradiction that `d % 5 = 0`
    intro h
    have h₁ : (5 : ℤ) ∣ d := by
      omega
    -- Since `d` divides `5 * x^2 + 1`, and `5` divides `d`, `5` divides `5 * x^2 + 1`
    have h₂ : (5 : ℤ) ∣ 5 * x ^ 2 + 1 := by
      exact dvd_trans h₁ hd
    -- Simplify the expression to show a contradiction
    have h₃ : (5 : ℤ) ∣ 1 := by
      -- Since `5` divides `5 * x^2 + 1`, we can write `5 * x^2 + 1 = 5 * k` for some integer `k`
      -- This implies `1 = 5 * (k - x^2)`, so `5` divides `1`, which is a contradiction.
      omega
    -- `5` does not divide `1`, so we have a contradiction
    omega
  
  have h_main : (d : ℤ) % 20 = 1 ∨ (d : ℤ) % 20 = 3 ∨ (d : ℤ) % 20 = 7 ∨ (d : ℤ) % 20 = 9 := by
    have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
      have h₂ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
        -- We use the fact that d is odd and not divisible by 5
        have h₃ : d % 2 = 1 := by
          cases' h_odd with k hk
          have : d % 2 = 1 := by
            omega
          exact this
        have h₄ : d % 5 ≠ 0 := by simpa using hd_not_div_five
        -- We now consider all possible residues of d modulo 20
        have h₅ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 ∨ d % 20 = 11 ∨ d % 20 = 13 ∨ d % 20 = 17 ∨ d % 20 = 19 := by
          omega
        -- We eliminate the cases that are impossible due to our conditions
        rcases h₅ with (h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅ | h₅)
        · -- Case d % 20 = 1
          exact Or.inl h₅
        · -- Case d % 20 = 3
          exact Or.inr (Or.inl h₅)
        · -- Case d % 20 = 7
          exact Or.inr (Or.inr (Or.inl h₅))
        · -- Case d % 20 = 9
          exact Or.inr (Or.inr (Or.inr h₅))
        · -- Case d % 20 = 11
          exfalso
          have h₆ : (d : ℤ) % 5 = 1 := by
            omega
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by
            omega
          have h₈ : ¬((d : ℤ) % 5 = 0) := by simpa using hd_not_div_five
          have h₉ : ¬((d : ℤ) % 5 = 1) := by
            have h₁₀ : (d : ℤ) % 5 ≠ 1 := by
              by_contra h₁₀
              have h₁₁ : (d : ℤ) % 5 = 1 := by omega
              have h₁₂ : (d : ℤ) % 5 = 1 := by omega
              -- Use the fact that d divides 5 * x ^ 2 + 1 to derive a contradiction
              have h₁₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
              have h₁₄ : (d : ℤ) % 5 = 1 := by omega
              have h₁₅ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                have h₁₆ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
                rcases h₁₆ with (h₁₆ | h₁₆ | h₁₆ | h₁₆ | h₁₆) <;> simp [h₁₆, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
              have h₁₆ : (d : ℤ) % 5 = 1 := by omega
              have h₁₇ : (d : ℤ) % 5 = 1 := by omega
              -- Since d % 5 = 1, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
              have h₁₈ : ¬((d : ℤ) % 5 = 1) := by
                by_contra h₁₈
                have h₁₉ : (d : ℤ) % 5 = 1 := by omega
                have h₂₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
                  rcases h₂₂ with (h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂) <;> simp [h₂₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                have h₂₂ : (d : ℤ) % 5 = 1 := by omega
                have h₂₃ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₄ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₅ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
                  rcases h₂₅ with (h₂₅ | h₂₅ | h₂₅ | h₂₅ | h₂₅) <;> simp [h₂₅, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                -- Since d % 5 = 1, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
                have h₂₅ : (d : ℤ) % 5 = 1 := by omega
                have h₂₆ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
                have h₂₇ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
                  have h₂₈ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
                  rcases h₂₈ with (h₂₈ | h₂₈ | h₂₈ | h₂₈ | h₂₈) <;> simp [h₂₈, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
                -- Since d % 5 = 1, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
                omega
              omega
            omega
          omega
        · -- Case d % 20 = 13
          exfalso
          have h₆ : (d : ℤ) % 5 = 3 := by omega
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by omega
          have h₈ : ¬((d : ℤ) % 5 = 0) := by simpa using hd_not_div_five
          have h₉ : (d : ℤ) % 5 = 3 := by omega
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
            rcases h₁₂ with (h₁₂ | h₁₂ | h₁₂ | h₁₂ | h₁₂) <;> simp [h₁₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
          have h₁₂ : (d : ℤ) % 5 = 3 := by omega
          -- Derive a contradiction using the properties of d and the fact that it divides 5 * x ^ 2 + 1
          have h₁₃ : ¬((d : ℤ) % 5 = 3) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 3 := by omega
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₁₇ with (h₁₇ | h₁₇ | h₁₇ | h₁₇ | h₁₇) <;> simp [h₁₇, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            -- Since d % 5 = 3, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
            have h₁₇ : (d : ℤ) % 5 = 3 := by omega
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;> simp [h₂₀, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            -- Since d % 5 = 3, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
            omega
          omega
        · -- Case d % 20 = 17
          exfalso
          have h₆ : (d : ℤ) % 5 = 2 := by omega
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by omega
          have h₈ : ¬((d : ℤ) % 5 = 0) := by simpa using hd_not_div_five
          have h₉ : (d : ℤ) % 5 = 2 := by omega
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
            rcases h₁₂ with (h₁₂ | h₁₂ | h₁₂ | h₁₂ | h₁₂) <;> simp [h₁₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
          have h₁₂ : (d : ℤ) % 5 = 2 := by omega
          have h₁₃ : ¬((d : ℤ) % 5 = 2) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 2 := by omega
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₁₇ with (h₁₇ | h₁₇ | h₁₇ | h₁₇ | h₁₇) <;> simp [h₁₇, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            -- Use the fact that d % 5 = 2 to derive a contradiction
            have h₁₇ : (d : ℤ) % 5 = 2 := by omega
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;> simp [h₂₀, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            -- Since d % 5 = 2, we have a contradiction because d cannot divide 5 * x ^ 2 + 1
            omega
          omega
        · -- Case d % 20 = 19
          exfalso
          have h₆ : (d : ℤ) % 5 = 4 := by omega
          have h₇ : (d : ℤ) % 5 = 0 ∨ (d : ℤ) % 5 = 1 ∨ (d : ℤ) % 5 = 2 ∨ (d : ℤ) % 5 = 3 ∨ (d : ℤ) % 5 = 4 := by omega
          have h₈ : ¬((d : ℤ) % 5 = 0) := by simpa using hd_not_div_five
          have h₉ : (d : ℤ) % 5 = 4 := by omega
          have h₁₀ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
          have h₁₁ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
            have h₁₂ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
            rcases h₁₂ with (h₁₂ | h₁₂ | h₁₂ | h₁₂ | h₁₂) <;> simp [h₁₂, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
          have h₁₂ : (d : ℤ) % 5 = 4 := by omega
          have h₁₃ : ¬((d : ℤ) % 5 = 4) := by
            by_contra h₁₃
            have h₁₄ : (d : ℤ) % 5 = 4 := by omega
            have h₁₅ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₆ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₁₇ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₁₇ with (h₁₇ | h₁₇ | h₁₇ | h₁₇ | h₁₇) <;> simp [h₁₇, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            have h₁₇ : (d : ℤ) % 5 = 4 := by omega
            have h₁₈ : (d : ℤ) ∣ 5 * x ^ 2 + 1 := hd
            have h₁₉ : (5 * x ^ 2 + 1 : ℤ) % 5 = 1 := by
              have h₂₀ : (x : ℤ) % 5 = 0 ∨ (x : ℤ) % 5 = 1 ∨ (x : ℤ) % 5 = 2 ∨ (x : ℤ) % 5 = 3 ∨ (x : ℤ) % 5 = 4 := by omega
              rcases h₂₀ with (h₂₀ | h₂₀ | h₂₀ | h₂₀ | h₂₀) <;> simp [h₂₀, pow_two, Int.mul_emod, Int.add_emod, Int.emod_emod]
            -- We have a contradiction because d cannot divide 5 * x ^ 2 + 1 if d % 5 = 4
            omega
          omega
      exact h₂
    -- Now, we handle the case where d is negative by ensuring d is positive
    have h₃ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by assumption
    cases h₃ with
    | inl h₃ =>
      norm_num [h₃] at *
      <;> omega
    | inr h₃ =>
      cases h₃ with
      | inl h₃ =>
        norm_num [h₃] at *
        <;> omega
      | inr h₃ =>
        cases h₃ with
        | inl h₃ =>
          norm_num [h₃] at *
          <;> omega
        | inr h₃ =>
          norm_num [h₃] at *
          <;> omega
  
  -- Since we have already established that d > 0 and d is odd, we can directly use the main result to conclude.
  have h₁ : d % 20 = 1 ∨ d % 20 = 3 ∨ d % 20 = 7 ∨ d % 20 = 9 := by
    cases h_main with
    | inl h_main =>
      -- If d % 20 = 1, then we are done.
      omega
    | inr h_main =>
      cases h_main with
      | inl h_main =>
        -- If d % 20 = 3, then we are done.
        omega
      | inr h_main =>
        cases h_main with
        | inl h_main =>
          -- If d % 20 = 7, then we are done.
          omega
        | inr h_main =>
          -- If d % 20 = 9, then we are done.
          omega
  
  -- Finally, use Aesop to conclude the proof, as we have already established the required conditions.
  tauto