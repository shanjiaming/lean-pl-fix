theorem prime_divisors_of_polynomial_form (p : ℕ) (hp : Nat.Prime p) (h : p ∣ Polynomialn n) :
  ∃ k : ℕ, p = 24 * k + 1 := by
  have h₁ : n ≤ 1 → False := by
    intro hn
    have h₂ : n ≤ 1 := hn
    have h₃ : Polynomialn n = 1 := by
      have h₄ : n ≤ 1 := h₂
      have h₅ : n = 0 ∨ n = 1 := by
        omega
      cases h₅ with
      | inl h₅ =>
        rw [h₅]
        rfl
      | inr h₅ =>
        rw [h₅]
        rfl
    have h₆ : p ∣ 1 := by
      simpa [h₃] using h
    have h₇ : p ≤ 1 := Nat.le_of_dvd (by norm_num) h₆
    have h₈ : p ≥ 2 := Nat.Prime.two_le hp
    linarith
    <;> simp_all (config := {decide := true})
  
  have h₂ : n ≥ 2 := by
    by_contra h₂
    -- If n is not ≥ 2, then n ≤ 1
    have h₃ : n ≤ 1 := by
      omega
    -- Use the contradiction from h₁ to conclude the proof
    have h₄ : False := h₁ h₃
    exact h₄
  
  have h₃ : p ≠ 2 := by
    by_contra h₃
    have h₄ : p = 2 := by tauto
    have h₅ : p ∣ Polynomialn n := h
    have h₆ : Polynomialn n = n^8 - n^4 + 1 := rfl
    rw [h₆] at h₅
    -- We use the fact that if a prime p divides a number, it must divide any combination of its factors
    have h₇ : 2 ∣ n^8 - n^4 + 1 := by simpa [h₄] using h₅
    -- We know that n is at least 2, so we can use this fact to show that n^8 - n^4 + 1 is odd
    have h₈ : n ≥ 2 := h₂
    have h₉ : n^8 % 2 = n^4 % 2 := by
      have h₁₀ : n % 2 = 0 ∨ n % 2 = 1 := by omega
      rcases h₁₀ with (h₁₀ | h₁₀)
      · -- Case n ≡ 0 mod 2
        simp [h₁₀, Nat.pow_mod, Nat.mul_mod, Nat.add_mod]
      · -- Case n ≡ 1 mod 2
        simp [h₁₀, Nat.pow_mod, Nat.mul_mod, Nat.add_mod]
    have h₁₀ : (n^8 - n^4 + 1) % 2 = 1 := by
      have h₁₁ : n^8 % 2 = n^4 % 2 := h₉
      have h₁₂ : (n^8 - n^4 + 1) % 2 = 1 := by
        have h₁₃ : n^8 % 2 = n^4 % 2 := h₉
        have h₁₄ : n^4 % 2 = 0 ∨ n^4 % 2 = 1 := by omega
        rcases h₁₄ with (h₁₄ | h₁₄) <;> simp [h₁₄, h₁₃, Nat.add_mod, Nat.mul_mod, Nat.pow_mod, Nat.sub_eq_zero_iff_le]
        <;> omega
      exact h₁₂
    have h₁₁ : 2 ∣ n^8 - n^4 + 1 := h₇
    have h₁₂ : (n^8 - n^4 + 1) % 2 = 0 := by
      omega
    omega
    <;> omega
    <;> omega
  
  have h₄ : p ≠ 3 := by
    have h₄₁ : p ∣ Polynomialn n := h
    have h₄₂ : Polynomialn n = n ^ 8 - n ^ 4 + 1 := rfl
    rw [h₄₂] at h₄₁
    intro h₄₃
    have h₄₄ : p = 3 := by tauto
    have h₄₅ : (3 : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by simpa [h₄₄] using h₄₁
    have h₄₆ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
      have h₄₇ : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by omega
      rcases h₄₇ with (h₄₇ | h₄₇ | h₄₇)
      · -- Case n ≡ 0 mod 3
        have h₄₈ : n % 3 = 0 := h₄₇
        have h₄₉ : n ^ 8 % 3 = 0 := by
          have h₄₁₀ : n % 3 = 0 := h₄₈
          have h₄₁₁ : n ^ 8 % 3 = 0 := by
            have h₄₁₂ : n % 3 = 0 := h₄₁₀
            have h₄₁₃ : n ^ 8 % 3 = 0 := by
              calc
                n ^ 8 % 3 = (n % 3) ^ 8 % 3 := by
                  simp [Nat.pow_mod]
                _ = 0 ^ 8 % 3 := by rw [h₄₁₂]
                _ = 0 := by norm_num
                _ = 0 := by rfl
            exact h₄₁₃
          exact h₄₁₁
        have h₄₁₄ : n ^ 4 % 3 = 0 := by
          have h₄₁₅ : n % 3 = 0 := h₄₈
          have h₄₁₆ : n ^ 4 % 3 = 0 := by
            have h₄₁₇ : n % 3 = 0 := h₄₁₅
            have h₄₁₈ : n ^ 4 % 3 = 0 := by
              calc
                n ^ 4 % 3 = (n % 3) ^ 4 % 3 := by simp [Nat.pow_mod]
                _ = 0 ^ 4 % 3 := by rw [h₄₁₇]
                _ = 0 := by norm_num
                _ = 0 := by rfl
            exact h₄₁₈
          exact h₄₁₆
        have h₄₁₉ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
          have h₄₂₀ : n ^ 8 % 3 = 0 := h₄₉
          have h₄₂₁ : n ^ 4 % 3 = 0 := h₄₁₄
          have h₄₂₂ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
            omega
          exact h₄₂₂
        exact h₄₁₉
      · -- Case n ≡ 1 mod 3
        have h₄₈ : n % 3 = 1 := h₄₇
        have h₄₉ : n ^ 8 % 3 = 1 := by
          have h₄₁₀ : n % 3 = 1 := h₄₈
          have h₄₁₁ : n ^ 8 % 3 = 1 := by
            have h₄₁₂ : n % 3 = 1 := h₄₁₀
            have h₄₁₃ : n ^ 8 % 3 = 1 := by
              calc
                n ^ 8 % 3 = (n % 3) ^ 8 % 3 := by simp [Nat.pow_mod]
                _ = 1 ^ 8 % 3 := by rw [h₄₁₂]
                _ = 1 := by norm_num
                _ = 1 := by rfl
            exact h₄₁₃
          exact h₄₁₁
        have h₄₁₄ : n ^ 4 % 3 = 1 := by
          have h₄₁₅ : n % 3 = 1 := h₄₈
          have h₄₁₆ : n ^ 4 % 3 = 1 := by
            have h₄₁₇ : n % 3 = 1 := h₄₁₅
            have h₄₁₈ : n ^ 4 % 3 = 1 := by
              calc
                n ^ 4 % 3 = (n % 3) ^ 4 % 3 := by simp [Nat.pow_mod]
                _ = 1 ^ 4 % 3 := by rw [h₄₁₇]
                _ = 1 := by norm_num
                _ = 1 := by rfl
            exact h₄₁₈
          exact h₄₁₆
        have h₄₁₉ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
          have h₄₂₀ : n ^ 8 % 3 = 1 := h₄₉
          have h₄₂₁ : n ^ 4 % 3 = 1 := h₄₁₄
          have h₄₂₂ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
            omega
          exact h₄₂₂
        exact h₄₁₉
      · -- Case n ≡ 2 mod 3
        have h₄₈ : n % 3 = 2 := h₄₇
        have h₄₉ : n ^ 2 % 3 = 1 := by
          have h₄₁₀ : n % 3 = 2 := h₄₈
          have h₄₁₁ : n ^ 2 % 3 = 1 := by
            have h₄₁₂ : n % 3 = 2 := h₄₁₀
            have h₄₁₃ : n ^ 2 % 3 = 1 := by
              calc
                n ^ 2 % 3 = (n % 3) ^ 2 % 3 := by simp [Nat.pow_mod]
                _ = 2 ^ 2 % 3 := by rw [h₄₁₂]
                _ = 1 := by norm_num
                _ = 1 := by rfl
            exact h₄₁₃
          exact h₄₁₁
        have h₄₁₄ : n ^ 4 % 3 = 1 := by
          have h₄₁₅ : n ^ 2 % 3 = 1 := h₄₉
          have h₄₁₆ : n ^ 4 % 3 = 1 := by
            have h₄₁₇ : n ^ 2 % 3 = 1 := h₄₁₅
            have h₄₁₈ : n ^ 4 % 3 = 1 := by
              calc
                n ^ 4 % 3 = (n ^ 2) ^ 2 % 3 := by ring_nf
                _ = 1 ^ 2 % 3 := by rw [h₄₁₇]
                _ = 1 := by norm_num
                _ = 1 := by rfl
            exact h₄₁₈
          exact h₄₁₆
        have h₄₁₉ : n ^ 8 % 3 = 1 := by
          have h₄₂₀ : n ^ 2 % 3 = 1 := h₄₉
          have h₄₂₁ : n ^ 8 % 3 = 1 := by
            have h₄₂₂ : n ^ 2 % 3 = 1 := h₄₂₀
            have h₄₂₃ : n ^ 8 % 3 = 1 := by
              calc
                n ^ 8 % 3 = (n ^ 2) ^ 4 % 3 := by ring_nf
                _ = 1 ^ 4 % 3 := by rw [h₄₂₂]
                _ = 1 := by norm_num
                _ = 1 := by rfl
            exact h₄₂₃
          exact h₄₂₁
        have h₄₂₀ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
          have h₄₂₁ : n ^ 8 % 3 = 1 := h₄₁₉
          have h₄₂₂ : n ^ 4 % 3 = 1 := h₄₁₄
          have h₄₂₃ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
            omega
          exact h₄₂₃
        exact h₄₂₀
    -- Use the fact that 3 does not divide n^8 - n^4 + 1 to get a contradiction
    have h₄₇ : ¬(3 : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by
      omega
    omega
  
  have h₅ : p ≥ 5 := by
    have h₅₁ := hp.two_le
    have h₅₂ : p ≠ 2 := h₃
    have h₅₃ : p ≠ 3 := h₄
    by_contra h₅₄
    have h₅₅ : p < 5 := by linarith
    have h₅₆ : p ≤ 4 := by linarith
    interval_cases p <;> norm_num [Nat.Prime] at hp <;> (try omega) <;> (try contradiction) <;> (try omega)
    <;> (try
      {
        have h₅₇ : 2 ∣ Polynomialn n := by simpa [h] using h
        have h₅₈ : 2 ∣ Polynomialn n := by simpa [h] using h
        have h₅₉ : Polynomialn n % 2 = 0 := by omega
        have h₅₁₀ : (n ^ 8 - n ^ 4 + 1) % 2 = 0 := by
          simpa [Polynomialn] using h₅₉
        have h₅₁₁ : n % 2 = 0 ∨ n % 2 = 1 := by omega
        rcases h₅₁₁ with (h₅₁₁ | h₅₁₁)
        · -- Case n is even
          have h₅₁₂ : n % 2 = 0 := h₅₁₁
          have h₅₁₃ : (n ^ 8 - n ^ 4 + 1) % 2 = 1 := by
            have h₅₁₄ : n ^ 4 % 2 = 0 := by
              have h₅₁₅ : n % 2 = 0 := h₅₁₂
              have h₅₁₆ : n ^ 4 % 2 = 0 := by
                calc
                  n ^ 4 % 2 = (n % 2) ^ 4 % 2 := by
                    simp [Nat.pow_mod]
                  _ = 0 ^ 4 % 2 := by rw [h₅₁₅]
                  _ = 0 := by norm_num
              exact h₅₁₆
            have h₅₁₇ : n ^ 8 % 2 = 0 := by
              have h₅₁₈ : n % 2 = 0 := h₅₁₂
              have h₅₁₉ : n ^ 8 % 2 = 0 := by
                calc
                  n ^ 8 % 2 = (n % 2) ^ 8 % 2 := by
                    simp [Nat.pow_mod]
                  _ = 0 ^ 8 % 2 := by rw [h₅₁₈]
                  _ = 0 := by norm_num
              exact h₅₁₉
            omega
          omega
        ·
          -- Case n is odd
          have h₅₁₂ : n % 2 = 1 := h₅₁₁
          have h₅₁₃ : (n ^ 8 - n ^ 4 + 1) % 2 = 1 := by
            have h₅₁₄ : n ^ 4 % 2 = 1 := by
              have h₅₁₅ : n % 2 = 1 := h₅₁₂
              have h₅₁₆ : n ^ 4 % 2 = 1 := by
                calc
                  n ^ 4 % 2 = (n % 2) ^ 4 % 2 := by
                    simp [Nat.pow_mod]
                  _ = 1 ^ 4 % 2 := by rw [h₅₁₅]
                  _ = 1 := by norm_num
              exact h₅₁₆
            have h₅₁₇ : n ^ 8 % 2 = 1 := by
              have h₅₁₈ : n % 2 = 1 := h₅₁₂
              have h₅₁₉ : n ^ 8 % 2 = 1 := by
                calc
                  n ^ 8 % 2 = (n % 2) ^ 8 % 2 := by
                    simp [Nat.pow_mod]
                  _ = 1 ^ 8 % 2 := by rw [h₅₁₈]
                  _ = 1 := by norm_num
              exact h₅₁₉
            omega
          omega
      }) <;>
      (try
        {
          have h₅₇ : 3 ∣ Polynomialn n := by simpa [h] using h
          have h₅₈ : 3 ∣ Polynomialn n := by simpa [h] using h
          have h₅₉ : Polynomialn n % 3 = 0 := by omega
          have h₅₁₀ : (n ^ 8 - n ^ 4 + 1) % 3 = 0 := by
            simpa [Polynomialn] using h₅₉
          have h₅₁₁ : n % 3 = 0 ∨ n % 3 = 1 ∨ n % 3 = 2 := by omega
          rcases h₅₁₁ with (h₅₁₁ | h₅₁₁ | h₅₁₁)
          · -- Case n ≡ 0 mod 3
            have h₅₁₂ : n % 3 = 0 := h₅₁₁
            have h₅₁₃ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
              have h₅₁₄ : n ^ 4 % 3 = 0 := by
                have h₅₁₅ : n % 3 = 0 := h₅₁₂
                have h₅₁₆ : n ^ 4 % 3 = 0 := by
                  calc
                    n ^ 4 % 3 = (n % 3) ^ 4 % 3 := by simp [Nat.pow_mod]
                    _ = 0 ^ 4 % 3 := by rw [h₅₁₅]
                    _ = 0 := by norm_num
                exact h₅₁₆
              have h₅₁₇ : n ^ 8 % 3 = 0 := by
                have h₅₁₈ : n % 3 = 0 := h₅₁₂
                have h₅₁₉ : n ^ 8 % 3 = 0 := by
                  calc
                    n ^ 8 % 3 = (n % 3) ^ 8 % 3 := by simp [Nat.pow_mod]
                    _ = 0 ^ 8 % 3 := by rw [h₅₁₈]
                    _ = 0 := by norm_num
                exact h₅₁₉
              omega
            omega
          ·
            -- Case n ≡ 1 mod 3
            have h₅₁₂ : n % 3 = 1 := h₅₁₁
            have h₅₁₃ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
              have h₅₁₄ : n ^ 4 % 3 = 1 := by
                have h₅₁₅ : n % 3 = 1 := h₅₁₂
                have h₅₁₆ : n ^ 4 % 3 = 1 := by
                  calc
                    n ^ 4 % 3 = (n % 3) ^ 4 % 3 := by simp [Nat.pow_mod]
                    _ = 1 ^ 4 % 3 := by rw [h₅₁₅]
                    _ = 1 := by norm_num
                exact h₅₁₆
              have h₅₁₇ : n ^ 8 % 3 = 1 := by
                have h₅₁₈ : n % 3 = 1 := h₅₁₂
                have h₅₁₉ : n ^ 8 % 3 = 1 := by
                  calc
                    n ^ 8 % 3 = (n % 3) ^ 8 % 3 := by simp [Nat.pow_mod]
                    _ = 1 ^ 8 % 3 := by rw [h₅₁₈]
                    _ = 1 := by norm_num
                exact h₅₁₉
              omega
            omega
          ·
            -- Case n ≡ 2 mod 3
            have h₅₁₂ : n % 3 = 2 := h₅₁₁
            have h₅₁₃ : (n ^ 8 - n ^ 4 + 1) % 3 = 1 := by
              have h₅₁₄ : n ^ 2 % 3 = 1 := by
                have h₅₁₅ : n % 3 = 2 := h₅₁₂
                have h₅₁₆ : n ^ 2 % 3 = 1 := by
                  calc
                    n ^ 2 % 3 = (n % 3) ^ 2 % 3 := by simp [Nat.pow_mod]
                    _ = 2 ^ 2 % 3 := by rw [h₅₁₅]
                    _ = 4 % 3 := by norm_num
                    _ = 1 := by norm_num
                exact h₅₁₆
              have h₅₁₇ : n ^ 4 % 3 = 1 := by
                have h₅₁₈ : n ^ 2 % 3 = 1 := h₅₁₄
                have h₅₁₉ : n ^ 4 % 3 = 1 := by
                  calc
                    n ^ 4 % 3 = (n ^ 2) ^ 2 % 3 := by ring_nf
                    _ = 1 ^ 2 % 3 := by rw [h₅₁₈]
                    _ = 1 := by norm_num
                exact h₅₁₉
              have h₅₂₀ : n ^ 8 % 3 = 1 := by
                have h₅₂₁ : n ^ 2 % 3 = 1 := h₅₁₄
                have h₅₂₂ : n ^ 8 % 3 = 1 := by
                  calc
                    n ^ 8 % 3 = (n ^ 2) ^ 4 % 3 := by ring_nf
                    _ = 1 ^ 4 % 3 := by rw [h₅₂₁]
                    _ = 1 := by norm_num
                exact h₅₂₂
              omega
            omega
        })
    <;> omega
  
  have h₆ : ¬(p ∣ n) := by
    intro h₆
    have h₇ : p ∣ Polynomialn n := h
    have h₈ : p ∣ n := h₆
    have h₉ : p ∣ n ^ 8 := by
      exact dvd_trans h₈ (dvd_pow_self n (by linarith))
    have h₁₀ : p ∣ n ^ 4 := by
      exact dvd_trans h₈ (dvd_pow_self n (by linarith))
    have h₁₁ : p ∣ n ^ 8 - n ^ 4 := by
      have h₁₂ : p ∣ n ^ 8 := h₉
      have h₁₃ : p ∣ n ^ 4 := h₁₀
      exact Nat.dvd_sub' h₁₂ h₁₃
    have h₁₂ : p ∣ n ^ 8 - n ^ 4 + 1 := by
      simpa [Polynomialn, Nat.dvd_add_right h₁₁] using h₇
    have h₁₃ : p ∣ 1 := by
      simpa [Nat.dvd_add_right h₁₁] using Nat.dvd_sub' h₁₂ h₁₁
    have h₁₄ : p = 1 := by
      exact Nat.dvd_one.mp h₁₃
    have h₁₅ : p ≥ 2 := Nat.Prime.two_le hp
    linarith
  
  have h₇ : 24 ∣ p - 1 := by
    have h₇₁ : p ∣ Polynomialn n := h
    have h₇₂ : Polynomialn n = n ^ 8 - n ^ 4 + 1 := rfl
    rw [h₇₂] at h₇₁
    haveI := Fact.mk hp
    have h₇₃ : (p : ℕ) ∣ n ^ 8 - n ^ 4 + 1 := by exact_mod_cast h₇₁
    -- Use Fermat's Little Theorem to simplify the problem
    have h₇₄ : p ∣ n ^ 8 - n ^ 4 + 1 := by exact_mod_cast h₇₁
    have h₇₅ : ¬(p ∣ n) := h₆
    -- Use the fact that p does not divide n to simplify the problem
    have h₇₆ : (n : ℕ) ^ 24 % p = 1 % p := by
      haveI := Fact.mk hp
      have h₇₇ : (n : ℤ) ^ 24 % p = 1 % p := by
        -- Use the fact that p divides n^8 - n^4 + 1 to derive a contradiction
        have h₇₈ : (n : ℤ) ^ 8 ≡ (n : ℤ) ^ 4 - 1 [ZMOD p] := by
          rw [Int.ModEq]
          have h₇₉ : (p : ℤ) ∣ (n : ℤ) ^ 8 - (n : ℤ) ^ 4 + 1 := by
            exact_mod_cast h₇₄
          omega
        have h₇₉₁ : (n : ℤ) ^ 12 ≡ -1 [ZMOD p] := by
          calc
            (n : ℤ) ^ 12 = (n : ℤ) ^ 8 * (n : ℤ) ^ 4 := by ring
            _ ≡ ((n : ℤ) ^ 4 - 1) * (n : ℤ) ^ 4 [ZMOD p] := by
              gcongr <;> simpa [Int.ModEq] using h₇₈
            _ = (n : ℤ) ^ 8 - (n : ℤ) ^ 4 := by ring
            _ ≡ (n : ℤ) ^ 4 - 1 - (n : ℤ) ^ 4 [ZMOD p] := by
              gcongr <;> simpa [Int.ModEq] using h₇₈
            _ = -1 := by
              ring
              <;> omega
            _ ≡ -1 [ZMOD p] := by rfl
        have h₇₉₂ : (n : ℤ) ^ 24 ≡ 1 [ZMOD p] := by
          calc
            (n : ℤ) ^ 24 = ((n : ℤ) ^ 12) ^ 2 := by ring
            _ ≡ (-1 : ℤ) ^ 2 [ZMOD p] := by
              gcongr <;> simpa [Int.ModEq] using h₇₉₁
            _ = 1 := by ring
            _ ≡ 1 [ZMOD p] := by rfl
        have h₇₉₃ : (n : ℤ) ^ 24 % p = 1 % p := by
          rw [Int.ModEq] at h₇₉₂
          exact h₇₉₂
        exact_mod_cast h₇₉₃
      exact_mod_cast h₇₇
    have h₇₇ : p ∣ n ^ 24 - 1 := by
      have h₇₈ : (n : ℕ) ^ 24 % p = 1 % p := by exact h₇₆
      have h₇₉ : p ∣ n ^ 24 - 1 := by
        haveI := Fact.mk hp
        have h₈₀ : (p : ℕ) ∣ n ^ 24 - 1 := by
          rw [← Nat.mod_add_div (n ^ 24) p]
          simp [Nat.dvd_iff_mod_eq_zero, Nat.pow_mod, Nat.mul_mod, Nat.add_mod, Nat.mod_mod] at h₇₈ ⊢
          have h₈₁ : n ^ 24 % p = 1 % p := h₇₈
          have h₈₂ : p ∣ n ^ 24 - 1 := by
            have h₈₃ : n ^ 24 % p = 1 % p := h₇₈
            have h₈₄ : p ∣ n ^ 24 - 1 := by
              have h₈₅ : n ^ 24 % p = 1 % p := h₇₈
              have h₈₆ : p ∣ n ^ 24 - 1 := by
                have h₈₇ : n ^ 24 % p = 1 % p := h₇₈
                have h₈₈ : p ∣ n ^ 24 - 1 := by
                  rw [← Nat.mod_add_div (n ^ 24) p] at *
                  simp [Nat.dvd_iff_mod_eq_zero, Nat.pow_mod, Nat.mul_mod, Nat.add_mod, Nat.mod_mod] at h₈₇ ⊢
                  <;>
                  (try omega) <;>
                  (try aesop) <;>
                  (try simp_all [Nat.pow_mod, Nat.mul_mod, Nat.add_mod, Nat.mod_mod] <;> omega)
                exact h₈₈
              exact h₈₆
            exact h₈₄
          exact h₈₂
        exact h₈₀
      exact h₇₉
    have h₇₈ : 24 ∣ p - 1 := by
      have h₇₉ : p ∣ n ^ 24 - 1 := h₇₇
      have h₈₀ : 24 ∣ p - 1 := by
        -- Use the fact that p divides n^24 - 1 to show that 24 divides p - 1
        have h₈₁ := Nat.Prime.two_le hp
        have h₈₂ : p ≠ 2 := h₃
        have h₈₃ : p ≠ 3 := h₄
        have h₈₄ : p ≥ 5 := h₅
        have h₈₅ : ¬(p ∣ n) := h₆
        -- Use the fact that p is a prime and does not divide n to show that 24 divides p - 1
        have h₈₆ : 24 ∣ p - 1 := by
          -- Use the fact that p is a prime and does not divide n to show that 24 divides p - 1
          have h₈₇ : p ∣ n ^ 24 - 1 := h₇₇
          -- Use the fact that p is a prime and does not divide n to show that 24 divides p - 1
          have h₈₈ : p % 24 = 1 := by
            -- Use the fact that p is a prime and does not divide n to show that p % 24 = 1
            have h₈₉ : p % 24 = 1 := by
              by_contra h₈₉
              -- Use the fact that p is a prime and does not divide n to show that p % 24 = 1
              have h₉₀ : p % 24 ≠ 1 := h₈₉
              have h₉₁ : p % 24 = 1 ∨ p % 24 = 5 ∨ p % 24 = 7 ∨ p % 24 = 11 ∨ p % 24 = 13 ∨ p % 24 = 17 ∨ p % 24 = 19 ∨ p % 24 = 23 := by
                -- Use the fact that p is a prime and does not divide n to show that p % 24 is one of these values
                have h₉₂ := Nat.Prime.eq_one_or_self_of_dvd hp 2
                have h₉₃ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                have h₉₄ : p % 2 = 1 := by
                  omega
                have h₉₅ : p % 3 = 1 ∨ p % 3 = 2 := by
                  have h₉₆ := Nat.Prime.eq_one_or_self_of_dvd hp 3
                  omega
                have h₉₆ : p % 24 = 1 ∨ p % 24 = 5 ∨ p % 24 = 7 ∨ p % 24 = 11 ∨ p % 24 = 13 ∨ p % 24 = 17 ∨ p % 24 = 19 ∨ p % 24 = 23 := by
                  omega
                exact h₉₆
              rcases h₉₁ with (h₉₁ | h₉₁ | h₉₁ | h₉₁ | h₉₁ | h₉₁ | h₉₁ | h₉₁)
              <;> omega
            omega
          have h₈₉ : 24 ∣ p - 1 := by
            have h₉₀ : p % 24 = 1 := h₈₈
            omega
          exact h₈₉
        exact h₈₆
      exact h₈₀
    exact h₇₈
  have h₈ : ∃ (k : ℕ), p = 24 * k + 1 := by
    have h₈₁ : 24 ∣ p - 1 := h₇
    have h₈₂ : p ≥ 2 := Nat.Prime.two_le hp
    have h₈₃ : p ≠ 2 := h₃
    have h₈₄ : p ≠ 3 := h₄
    have h₈₅ : p ≥ 5 := h₅
    have h₈₆ : ¬(p ∣ n) := h₆
    -- We need to find a natural number k such that p = 24 * k + 1
    have h₈₇ : ∃ k, p = 24 * k + 1 := by
      -- Use the fact that 24 divides p - 1 to find such a k
      have h₈₈ : p % 24 = 1 := by
        have h₈₉ : 24 ∣ p - 1 := h₇
        have h₉₀ : p % 24 = 1 := by
          -- Use the fact that 24 divides p - 1 to find p % 24
          have h₉₁ : p ≥ 2 := Nat.Prime.two_le hp
          have h₉₂ : p ≠ 0 := by linarith
          have h₉₃ : p ≠ 1 := by
            intro h₉₄
            have h₉₅ : p = 1 := by linarith
            exact Nat.Prime.ne_one hp (by linarith)
          omega
        exact h₉₀
      have h₉₁ : ∃ k, p = 24 * k + 1 := by
        use (p - 1) / 24
        have h₉₂ : p % 24 = 1 := h₈₈
        have h₉₃ : p = 24 * ((p - 1) / 24) + 1 := by
          have h₉₄ : p ≥ 2 := Nat.Prime.two_le hp
          have h₉₅ : (p - 1) / 24 * 24 + 1 = p := by
            have h₉₆ := Nat.div_add_mod (p - 1) 24
            have h₉₇ : p - 1 = 24 * ((p - 1) / 24) + (p - 1) % 24 := by omega
            have h₉₈ : (p - 1) % 24 = 0 := by omega
            omega
          omega
        exact h₉₃
      exact h₉₁
    exact h₈₇
  exact h₈