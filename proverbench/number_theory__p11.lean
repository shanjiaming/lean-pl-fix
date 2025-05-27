theorem exists_ab_mod_p (p : ℕ) (hp : Nat.Prime p) :
  ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
  have h_main : p = 2 ∨ p ≠ 2 := by
    by_cases h : p = 2
    · exact Or.inl h
    · exact Or.inr h
  
  have h_case_p_eq_2 : p = 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_eq_2
    have h₁ : (1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 = 2 := by norm_num
    have h₂ : ((1 : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
      rw [h_p_eq_2]
      <;> norm_num
    refine' ⟨1, 0, _⟩
    simpa using h₂
  
  have h_case_p_ne_2 : p ≠ 2 → ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    intro h_p_ne_2
    haveI := Fact.mk hp
    have h₁ : p ≠ 2 := h_p_ne_2
    have h₂ : p % 4 = 1 ∨ p % 4 = 3 := by
      have h₃ := Nat.Prime.eq_one_or_self_of_dvd hp 2
      have h₄ := Nat.Prime.eq_one_or_self_of_dvd hp 4
      have h₅ : p % 2 = 1 := by
        by_contra h₅
        have h₆ : p % 2 = 0 := by omega
        have h₇ : 2 ∣ p := by
          omega
        have h₈ : p = 2 := by
          omega
        contradiction
      have h₆ := h₃
      have h₇ : p % 4 = 1 ∨ p % 4 = 3 := by
        omega
      exact h₇
    have h₃ : p % 4 = 1 ∨ p % 4 = 3 := h₂
    cases h₃ with
    | inl h₃ =>
      -- Case: p ≡ 1 mod 4
      have h₄ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
        -- Use the fact that there exists an integer a such that a^2 ≡ -1 mod p
        have h₅ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
          -- Use the Legendre symbol to find such an a
          have h₆ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
            -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
            have h₇ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
              -- Use Euler's criterion to find such an a
              have h₈ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
                have h₉ : p % 4 = 1 := h₃
                -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
                have h₁₀ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                  -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
                  have h₁₁ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                    -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
                    have h₁₂ : ∃ (a : ℤ), (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                      -- Use the fact that -1 is a quadratic residue modulo p when p ≡ 1 mod 4
                      use (Nat.gcdA (p : ℕ) 4)
                      have h₁₃ : (Nat.gcdA (p : ℕ) 4 : ℤ) ^ 2 ≡ -1 [ZMOD p] := by
                        -- Prove that (Nat.gcdA (p : ℕ) 4 : ℤ) ^ 2 ≡ -1 [ZMOD p]
                        have h₁₄ := Nat.xgcd_gcdA (p : ℕ) 4
                        have h₁₅ := Nat.xgcd_gcdB (p : ℕ) 4
                        have h₁₆ := Nat.xgcd_gcdA (p : ℕ) 4
                        have h₁₇ := Nat.xgcd_gcdB (p : ℕ) 4
                        norm_num at h₁₄ h₁₅ h₁₆ h₁₇ ⊢
                        <;>
                        (try omega) <;>
                        (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]) <;>
                        (try omega)
                        <;>
                        (try
                          {
                            have h₁₈ := h₉
                            have h₁₉ : p % 4 = 1 := by omega
                            omega
                          })
                        <;>
                        (try omega)
                        <;>
                        (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero])
                      exact h₁₃
                    exact h₁₂
                  exact h₁₁
                exact h₁₀
              exact h₈
            exact h₇
          exact h₆
        exact h₅
      obtain ⟨a, ha⟩ := h₄
      have h₅ : (a : ℤ) ^ 2 ≡ -1 [ZMOD p] := ha
      have h₆ : (a : ℤ) ^ 2 % (p : ℤ) = (-1 : ℤ) % (p : ℤ) := by
        rw [Int.ModEq] at h₅
        exact h₅
      use a, 0
      have h₇ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
        have h₈ : ((a : ℤ) ^ 2 + (0 : ℤ) ^ 2 + 1 : ℤ) % p = (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p := by
          ring_nf
          <;> simp [Int.add_emod, Int.mul_emod, pow_two]
          <;> norm_num
        rw [h₈]
        have h₉ : ((a : ℤ) ^ 2 : ℤ) % p = (-1 : ℤ) % p := by
          simpa [Int.ModEq] using h₅
        have h₁₀ : (((a : ℤ) ^ 2 : ℤ) + 1 : ℤ) % p = ((-1 : ℤ) + 1 : ℤ) % p := by
          rw [← Int.emod_add_ediv ((a : ℤ) ^ 2 : ℤ) p]
          rw [← Int.emod_add_ediv ((-1 : ℤ) : ℤ) p]
          simp [h₉, Int.add_emod, Int.mul_emod, pow_two]
          <;> ring_nf at *
          <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
          <;> omega
        rw [h₁₀]
        have h₁₁ : ((-1 : ℤ) + 1 : ℤ) % p = 0 := by
          norm_num
          <;>
          (try omega) <;>
          (try
            {
              have h₁₂ : (p : ℕ) > 0 := Nat.Prime.pos hp
              have h₁₃ : (p : ℤ) > 0 := by exact_mod_cast h₁₂
              have h₁₄ : ((-1 : ℤ) + 1 : ℤ) = 0 := by norm_num
              rw [h₁₄]
              <;> simp [Int.emod_emod, Int.emod_eq_zero_of_dvd]
              <;>
              (try omega) <;>
              (try
                {
                  have h₁₅ : (p : ℕ) > 0 := Nat.Prime.pos hp
                  have h₁₆ : (p : ℤ) > 0 := by exact_mod_cast h₁₅
                  omega
                })
            })
        rw [h₁₁]
        <;> simp [Int.emod_emod, Int.emod_eq_zero_of_dvd]
        <;>
        (try omega) <;>
        (try
          {
            have h₁₂ : (p : ℕ) > 0 := Nat.Prime.pos hp
            have h₁₃ : (p : ℤ) > 0 := by exact_mod_cast h₁₂
            omega
          })
      exact h₇
    | inr h₃ =>
      -- Case: p ≡ 3 mod 4
      have h₄ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
        -- Use the fact that for any prime p ≡ 3 mod 4, there exist integers a and b such that a^2 + b^2 + 1 ≡ 0 mod p
        have h₅ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
          -- Use the fact that for any prime p ≡ 3 mod 4, there exist integers a and b such that a^2 + b^2 + 1 ≡ 0 mod p
          have h₆ : p > 2 := by
            have h₇ := Nat.Prime.two_le hp
            omega
          -- Use the fact that for any prime p ≡ 3 mod 4, there exist integers a and b such that a^2 + b^2 + 1 ≡ 0 mod p
          have h₇ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
            -- Use the fact that for any prime p ≡ 3 mod 4, there exist integers a and b such that a^2 + b^2 + 1 ≡ 0 mod p
            have h₈ : ∃ (a b : ℤ), (a ^ 2 + b ^ 2 + 1 : ℤ) % p = 0 := by
              -- Use the fact that for any prime p ≡ 3 mod 4, there exist integers a and b such that a^2 + b^2 + 1 ≡ 0 mod p
              use 0, (p - 1 : ℤ)
              have h₉ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) % p = 0 := by
                have h₁₀ : ((0 : ℤ) ^ 2 + (p - 1 : ℤ) ^ 2 + 1 : ℤ) = (p : ℤ) * (p - 2 : ℤ) + 2 := by
                  ring_nf
                  <;> cases p with
                  | zero => contradiction
                  | succ p =>
                    cases p with
                    | zero => contradiction
                    | succ p =>
                      simp [Nat.cast_add, Nat.cast_one, Nat.cast_mul, Nat.cast_zero]
                      <;> ring_nf
                      <;> norm_num
                      <;> omega
                rw [h₁₀]
                have h₁₁ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                  have h₁₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                    have h₁₃ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                      have h₁₄ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = (2 : ℤ) % p := by
                        simp [Int.add_emod, Int.mul_emod, pow_two, Int.emod_emod]
                        <;>
                        (try omega) <;>
                        (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]) <;>
                        (try omega)
                      exact h₁₄
                    exact h₁₃
                  have h₁₅ : (2 : ℤ) % p = 2 % (p : ℤ) := by norm_num
                  have h₁₆ : (2 : ℤ) % (p : ℤ) = 2 := by
                    have h₁₇ : (2 : ℤ) % (p : ℤ) = 2 := by
                      have h₁₈ : (p : ℤ) > 2 := by exact_mod_cast h₆
                      have h₁₉ : (2 : ℤ) < (p : ℤ) := by linarith
                      have h₂₀ : (2 : ℤ) % (p : ℤ) = 2 := by
                        rw [Int.emod_eq_of_lt]
                        <;> omega
                      exact h₂₀
                    exact h₁₇
                  have h₂₁ : (2 : ℤ) % p = 2 := by
                    rw [h₁₅]
                    exact h₁₆
                  have h₂₂ : ((p : ℤ) * (p - 2 : ℤ) + 2 : ℤ) % p = 0 := by
                    rw [h₁₂]
                    have h₂₃ : (p : ℤ) > 2 := by exact_mod_cast h₆
                    have h₂₄ : (2 : ℤ) < (p : ℤ) := by linarith
                    have h₂₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      rw [Int.emod_eq_of_lt]
                      <;> omega
                    have h₂₆ : (p : ℤ) ∣ 2 → False := by
                      intro h₂₆
                      have h₂₇ : (p : ℤ) ∣ 2 := h₂₆
                      have h₂₈ : (p : ℕ) ∣ 2 := by
                        exact_mod_cast h₂₇
                      have h₂₉ : p ≤ 2 := Nat.le_of_dvd (by norm_num) h₂₈
                      have h₃₀ : p = 2 := by
                        omega
                      contradiction
                    have h₃₁ : ¬(p : ℤ) ∣ 2 := by
                      intro h₃₁
                      have h₃₂ : (p : ℤ) ∣ 2 := h₃₁
                      exact h₂₆ h₃₂
                    have h₃₃ : ((p : ℤ) : ℤ) > 2 := by exact_mod_cast h₆
                    have h₃₄ : (2 : ℤ) < (p : ℤ) := by linarith
                    have h₃₅ : (2 : ℤ) % (p : ℤ) = 2 := by
                      rw [Int.emod_eq_of_lt]
                      <;> omega
                    simp [h₃₅, Int.emod_eq_of_lt] <;>
                    (try omega) <;>
                    (try ring_nf at * <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]) <;>
                    (try omega)
                  exact h₂₂
                exact h₁₁
              exact h₉
            exact h₈
          exact h₇
        exact h₅
      obtain ⟨a, b, h₅⟩ := h₄
      refine' ⟨a, b, _⟩
      exact h₅
  have h_final : ∃ (a b : ℤ), (a^2 + b^2 + 1) % p = 0 := by
    cases h_main with
    | inl h₁ =>
      -- If p = 2, use the first case
      exact h_case_p_eq_2 h₁
    | inr h₁ =>
      -- If p ≠ 2, use the second case
      exact h_case_p_ne_2 h₁
  
  exact h_final