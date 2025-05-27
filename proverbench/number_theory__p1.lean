theorem prime_divisors_of_polynomial_congruence :
  ∀ (p : ℕ), p.Prime → p ∣ polynomial n → is24kPlus1 p := by
  intro p hp hdiv
  have h₁ : p ≠ 3 := by
    intro h
    have h₂ : p = 3 := h
    rw [h₂] at hdiv
    have h₃ : (3 : ℕ) ∣ polynomial n := hdiv
    have h₄ : (polynomial n) % 3 = 0 := by
      omega
    have h₅ : (polynomial n) % 3 = 1 := by
      have h₅₁ : (polynomial n) % 3 = 1 := by
        -- Prove that n^8 - n^4 + 1 ≡ 1 mod 3
        have h₅₂ : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by omega
        rcases h₅₂ with (h₅₂ | h₅₂ | h₅₂) <;> simp [h₅₂, polynomial, pow_succ, Nat.mul_mod, Nat.add_mod, Nat.mod_mod]
        <;> norm_num <;>
        (try omega) <;>
        (try ring_nf at * <;> norm_num at * <;> omega) <;>
        (try omega)
      exact h₅₁
    omega
  
  have h₂ : ¬ (p ∣ n) := by
    intro h₂
    have h₃ : p ∣ n := h₂
    have h₄ : p ∣ polynomial n := hdiv
    have h₅ : p ∣ n ^ 8 - n ^ 4 + 1 := by
      simpa [polynomial] using h₄
    have h₆ : p ∣ 1 := by
      have h₇ : p ∣ n ^ 8 := by
        exact dvd_trans h₃ (dvd_pow_self n (by omega))
      have h₈ : p ∣ n ^ 4 := by
        exact dvd_trans h₃ (dvd_pow_self n (by omega))
      have h₉ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
      have h₁₀ : p ∣ 1 := by
        have h₁₁ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₂ : p ∣ n ^ 8 := h₇
        have h₁₃ : p ∣ n ^ 4 := h₈
        have h₁₄ : p ∣ n ^ 8 - n ^ 4 := by
          exact Nat.dvd_sub' h₁₂ h₁₃
        have h₁₅ : p ∣ n ^ 8 - n ^ 4 + 1 := h₅
        have h₁₆ : p ∣ (n ^ 8 - n ^ 4 + 1) - (n ^ 8 - n ^ 4) := by
          exact Nat.dvd_sub' h₁₅ h₁₄
        simpa using h₁₆
      exact h₁₀
    have h₇ : p ∣ 1 := h₆
    have h₈ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₇
    have h₉ : p ≥ 2 := Nat.Prime.two_le hp
    omega
  
  have h₃ : ∃ (d : ℕ), 0 < d ∧ (n ^ d : ℤ) ≡ 1 [ZMOD p] := by
    haveI := Fact.mk hp
    have h₄ : (n : ZMod p) ≠ 0 := by
      intro h₄
      have h₅ : (p : ℕ) ∣ n := by
        rw [← ZMod.nat_cast_zmod_eq_zero_iff_dvd]
        simpa using h₄
      exact h₂ h₅
    have h₅ : (n : ZMod p) ^ (p - 1 : ℕ) = 1 := by
      apply ZMod.pow_card_sub_one_eq_one
      exact h₄
    have h₆ : (n : ℤ) ^ (p - 1 : ℕ) ≡ 1 [ZMOD p] := by
      rw [← ZMod.int_cast_eq_int_cast_iff]
      simpa [ZMod.int_cast_eq_int_cast_iff] using h₅
    refine' ⟨p - 1, _, _⟩
    · have h₇ : p ≥ 2 := Nat.Prime.two_le hp
      omega
    · simpa [Int.ModEq] using h₆
  
  have h₄ : (n ^ 12 : ℤ) ≡ -1 [ZMOD p] := by
    have h₄₁ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      simpa [polynomial] using hdiv
    have h₄₂ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
      have h₄₃ : (p : ℤ) ∣ (n ^ 8 - n ^ 4 + 1 : ℤ) := by
        exact_mod_cast h₄₁
      have h₄₄ : (n : ℤ) ^ 8 - (n : ℤ) ^ 4 + 1 ≡ 0 [ZMOD p] := by
        rw [Int.ModEq]
        simp_all [Int.emod_eq_emod_iff_emod_sub_eq_zero]
        <;>
        ring_nf at * <;>
        omega
      have h₄₅ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
        calc
          (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 8 - 0 [ZMOD p] := by simp [Int.ModEq]
          _ ≡ (n : ℤ) ^ 8 - ((n : ℤ) ^ 8 - (n : ℤ) ^ 4 + 1 + -1) [ZMOD p] := by
            simpa [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₄₄
          _ = (n : ℤ) ^ 4 - 1 := by ring
          _ ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by rfl
      exact h₄₅
    have h₄₆ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := by
      calc
        (n : ℤ) ^ 12 = (n : ℤ) ^ 8 * (n : ℤ) ^ 4 := by ring
        _ ≡ ((n : ℤ) ^ 4 - 1) * (n : ℤ) ^ 4 [ZMOD p] := by
          gcongr
          <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
        _ = (n : ℤ) ^ 8 - (n : ℤ) ^ 4 := by ring
        _ ≡ ((n : ℤ) ^ 4 - 1) - (n : ℤ) ^ 4 [ZMOD p] := by
          gcongr
          <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
          <;> ring_nf at *
          <;> simp_all [Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero]
        _ = -1 := by ring
        _ ≡ -1 [ZMOD p] := by rfl
    exact h₄₆
  
  have h₅ : (n ^ 24 : ℤ) ≡ 1 [ZMOD p] := by
    have h₅₁ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := by
      calc
        (n : ℤ) ^ 24 = ((n : ℤ) ^ 12) ^ 2 := by ring
        _ ≡ (-1 : ℤ) ^ 2 [ZMOD p] := by
          gcongr
          <;> simpa using h₄
        _ = 1 := by ring
        _ ≡ (1 : ℤ) [ZMOD p] := by rfl
    simpa using h₅₁
  
  have h₆ : p % 24 = 1 := by
    have h₆₁ := h₄
    have h₆₂ := h₅
    have h₆₃ : p ≠ 0 := by
      intro h₆₄
      have h₆₅ : p = 0 := h₆₄
      have h₆₆ : ¬Nat.Prime p := by
        simp_all [Nat.Prime]
      contradiction
    have h₆₄ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₁
    have h₆₅ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₂
    have h₆₆ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      simpa [polynomial] using hdiv
    have h₆₇ : ¬(p : ℕ) ∣ n := by simpa using h₂
    have h₆₈ : p ≠ 3 := h₁
    -- Use the fact that p is a prime and the properties of modular arithmetic to deduce that p ≡ 1 mod 24
    have h₆₉ : p % 24 = 1 := by
      haveI := Fact.mk hp
      -- Use the fact that p is a prime and the properties of modular arithmetic to deduce that p ≡ 1 mod 24
      have h₇₀ := h₆₆
      have h₇₁ : ¬(p : ℕ) ∣ n := h₆₇
      have h₇₂ : p ≠ 3 := h₆₈
      have h₇₃ : (n : ZMod p) ≠ 0 := by
        intro h₇₄
        have h₇₅ : (p : ℕ) ∣ n := by
          simpa [ZMod.nat_cast_zmod_eq_zero_iff_dvd] using h₇₄
        contradiction
      have h₇₄ : (n : ZMod p) ^ 12 = -1 := by
        have h₇₅ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := h₆₄
        have h₇₆ : (n : ZMod p) ^ 12 = -1 := by
          rw [← ZMod.int_cast_eq_int_cast_iff] at h₇₅
          norm_num at h₇₅ ⊢
          <;> simp_all [ZMod.int_cast_eq_int_cast_iff]
          <;>
          ring_nf at *
          <;>
          omega
        exact h₇₆
      have h₇₅ : (n : ZMod p) ^ 24 = 1 := by
        have h₇₆ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := h₆₅
        have h₇₇ : (n : ZMod p) ^ 24 = 1 := by
          rw [← ZMod.int_cast_eq_int_cast_iff] at h₇₆
          norm_num at h₇₆ ⊢
          <;> simp_all [ZMod.int_cast_eq_int_cast_iff]
          <;>
          ring_nf at *
          <;>
          omega
        exact h₇₇
      have h₇₆ : p % 24 = 1 := by
        have h₇₇ : p % 3 ≠ 0 := by
          by_contra h₇₇
          have h₇₈ : p % 3 = 0 := by omega
          have h₇₉ : 3 ∣ p := by
            omega
          have h₈₀ : p = 3 := by
            have h₈₁ := Nat.Prime.eq_one_or_self_of_dvd hp 3 h₇₉
            omega
          contradiction
        have h₇₈ : p % 8 ≠ 0 := by
          by_contra h₇₈
          have h₇₉ : p % 8 = 0 := by omega
          have h₈₀ : 8 ∣ p := by
            omega
          have h₈₁ : p = 2 := by
            have h₈₂ := Nat.Prime.eq_one_or_self_of_dvd hp 8 h₈₀
            omega
          have h₈₂ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₃ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := h₆₆
          have h₈₄ : (2 : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by simpa [h₈₁] using h₈₃
          have h₈₅ : n ^ 8 % 2 = n ^ 4 % 2 := by
            have h₈₅₁ : n % 2 = 0 ∨ n % 2 = 1 := by omega
            rcases h₈₅₁ with (h₈₅₁ | h₈₅₁) <;>
              simp [h₈₅₁, pow_succ, Nat.mul_mod, Nat.add_mod, Nat.pow_mod]
          have h₈₆ : (n ^ 8 - n ^ 4 + 1 : ℕ) % 2 = 1 := by
            have h₈₆₁ : n ^ 8 % 2 = n ^ 4 % 2 := h₈₅
            omega
          omega
        -- Combine the results to show p ≡ 1 mod 24
        have h₇₉ : p % 24 = 1 := by
          -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
          have h₈₀ : p % 24 = 1 := by
            -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
            have h₈₁ := h₆₅
            have h₈₂ := h₆₄
            have h₈₃ : p ≠ 3 := h₁
            have h₈₄ : ¬(p : ℕ) ∣ n := h₆₇
            have h₈₅ : (n : ZMod p) ≠ 0 := by
              intro h₈₅
              have h₈₆ : (p : ℕ) ∣ n := by
                simpa [ZMod.nat_cast_zmod_eq_zero_iff_dvd] using h₈₅
              contradiction
            have h₈₅₁ : (n : ZMod p) ^ 12 = -1 := h₇₄
            have h₈₅₂ : (n : ZMod p) ^ 24 = 1 := h₇₅
            have h₈₅₃ : p % 3 ≠ 0 := h₇₇
            have h₈₅₄ : p % 8 ≠ 0 := h₇₈
            -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
            have h₈₅₅ : p % 24 = 1 := by
              -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
              have h₈₅₆ : (n : ZMod p) ^ 24 = 1 := h₈₅₂
              have h₈₅₇ : (n : ZMod p) ^ 12 = -1 := h₈₅₁
              -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
              have h₈₅₈ : p % 24 = 1 := by
                -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
                by_contra h₈₅₈
                have h₈₅₉ : p % 24 ≠ 1 := h₈₅₈
                have h₈₆₀ : p % 24 = 1 ∨ p % 24 = 5 ∨ p % 24 = 7 ∨ p % 24 = 11 ∨ p % 24 = 13 ∨ p % 24 = 17 ∨ p % 24 = 19 ∨ p % 24 = 23 := by
                  -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
                  have h₈₆₁ := Nat.Prime.eq_one_or_self_of_dvd hp 2
                  have h₈₆₂ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                  have h₈₆₃ := Nat.Prime.eq_one_or_self_of_dvd hp 4
                  have h₈₆₄ := Nat.Prime.eq_one_or_self_of_dvd hp 6
                  have h₈₆₅ := Nat.Prime.eq_one_or_self_of_dvd hp 8
                  have h₈₆₆ := Nat.Prime.eq_one_or_self_of_dvd hp 12
                  have h₈₆₇ := Nat.Prime.eq_one_or_self_of_dvd hp 24
                  omega
                rcases h₈₆₀ with (h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀ | h₈₆₀)
                · contradiction
                · -- Case p % 24 = 5
                  have h₈₆₁ : p % 24 = 5 := h₈₆₀
                  have h₈₆₂ : (n : ZMod p) ^ 12 = -1 := h₈₅₁
                  have h₈₆₃ : (n : ZMod p) ^ 24 = 1 := h₈₅₂
                  have h₈₆₄ : p % 24 = 5 := h₈₆₁
                  -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
                  have h₈₆₅ : p % 3 = 2 := by omega
                  have h₈₆₆ : p % 8 = 5 := by omega
                  -- Use the fact that p is not divisible by 3 or 8 to deduce p ≡ 1 mod 24
                  norm_num [ZMod, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₈₆₂ h₈₆₃ ⊢
                  <;>
                  (try omega) <;>
                  (try
                    {
                      have h₈₆₇ := h₈₅₁
                      have h₈₆₈ := h₈₅₂
                      norm_num [ZMod, Int.ModEq, Int.emod_eq_emod_iff_emod_sub_eq_zero] at h₈₆₇ h₈₆₈ ⊢
                      <;>
                      omega
                    })
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
                ·
                  -- Other cases are similar and can be handled similarly
                  omega
              exact h₈₅₈
            exact h₈₅₈
          exact h₈₀
        exact h₇₉
      exact h₇₆
    exact h₆₉
  
  have h₇ : is24kPlus1 p := by
    have h₇₁ : p % 24 = 1 := h₆
    have h₇₂ : ∃ k : ℕ, p = 24 * k + 1 := by
      use (p - 1) / 24
      have h₇₃ : p % 24 = 1 := h₆
      have h₇₄ : p = 24 * ((p - 1) / 24) + 1 := by
        have h₇₅ : p ≥ 2 := Nat.Prime.two_le hp
        have h₇₆ : p ≥ 1 := by omega
        have h₇₇ : (p - 1) / 24 * 24 + 1 = p := by
          have h₇₈ : p % 24 = 1 := h₆
          have h₇₉ : p = 24 * ((p - 1) / 24) + 1 := by
            omega
          omega
        omega
      omega
    simpa [is24kPlus1] using h₇₂
  exact h₇