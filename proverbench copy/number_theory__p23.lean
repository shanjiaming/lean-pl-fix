theorem prime_divisors_of_polynomial_form :
  ∀ p : ℕ, p.Prime → p ∣ n^4 - n^2 + 1 → ∃ k : ℕ, p = 12 * k + 1 := by
  intro p hp hdiv
  have h2 : p ≠ 2 := by
    by_contra h
    have h₁ := hdiv
    rw [h] at h₁
    have h₂ : (2 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁
    have h₃ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 2 = 1 := by
      have h₄ : (n : ℕ) % 2 = 0 ∨ (n : ℕ) % 2 = 1 := by omega
      rcases h₄ with (h₄ | h₄)
      · -- Case: n ≡ 0 mod 2
        have h₅ : (n : ℕ) % 2 = 0 := h₄
        have h₆ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 2 = 1 := by
          have h₇ : (n : ℕ) % 2 = 0 := h₅
          have h₈ : (n ^ 2 : ℕ) % 2 = 0 := by
            have h₉ : (n : ℕ) % 2 = 0 := h₇
            have h₁₀ : (n ^ 2 : ℕ) % 2 = 0 := by
              simp [h₉, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
            exact h₁₀
          have h₉ : (n ^ 4 : ℕ) % 2 = 0 := by
            have h₁₀ : (n ^ 4 : ℕ) % 2 = 0 := by
              have h₁₁ : (n : ℕ) % 2 = 0 := h₅
              have h₁₂ : (n ^ 4 : ℕ) % 2 = 0 := by
                simp [h₁₁, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
              exact h₁₂
            exact h₁₀
          have h₁₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 2 = 1 := by
            have h₁₁ : (n ^ 4 : ℕ) % 2 = 0 := h₉
            have h₁₂ : (n ^ 2 : ℕ) % 2 = 0 := h₈
            omega
          exact h₁₀
        exact h₆
      · -- Case: n ≡ 1 mod 2
        have h₅ : (n : ℕ) % 2 = 1 := h₄
        have h₆ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 2 = 1 := by
          have h₇ : (n : ℕ) % 2 = 1 := h₅
          have h₈ : (n ^ 2 : ℕ) % 2 = 1 := by
            have h₉ : (n : ℕ) % 2 = 1 := h₇
            have h₁₀ : (n ^ 2 : ℕ) % 2 = 1 := by
              simp [h₉, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
            exact h₁₀
          have h₉ : (n ^ 4 : ℕ) % 2 = 1 := by
            have h₁₀ : (n ^ 4 : ℕ) % 2 = 1 := by
              have h₁₁ : (n ^ 2 : ℕ) % 2 = 1 := h₈
              have h₁₂ : (n ^ 4 : ℕ) % 2 = 1 := by
                simp [h₁₁, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
              exact h₁₂
            exact h₁₀
          have h₁₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 2 = 1 := by
            have h₁₁ : (n ^ 4 : ℕ) % 2 = 1 := h₉
            have h₁₂ : (n ^ 2 : ℕ) % 2 = 1 := h₈
            omega
          exact h₁₀
        exact h₆
    have h₇ : ¬(2 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := by
      omega
    contradiction
  
  have h3 : p ≠ 3 := by
    by_contra h
    have h₁ : p = 3 := by omega
    rw [h₁] at hdiv
    have h₂ : (3 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := hdiv
    have h₃ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
      have h₄ : (n : ℕ) % 3 = 0 ∨ (n : ℕ) % 3 = 1 ∨ (n : ℕ) % 3 = 2 := by omega
      rcases h₄ with (h₄ | h₄ | h₄)
      · -- Case: n ≡ 0 mod 3
        have h₅ : (n : ℕ) % 3 = 0 := h₄
        have h₆ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
          have h₇ : (n : ℕ) % 3 = 0 := h₅
          have h₈ : (n ^ 2 : ℕ) % 3 = 0 := by
            have h₉ : (n : ℕ) % 3 = 0 := h₇
            have h₁₀ : (n ^ 2 : ℕ) % 3 = 0 := by
              simp [h₉, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
            exact h₁₀
          have h₉ : (n ^ 4 : ℕ) % 3 = 0 := by
            have h₁₀ : (n ^ 4 : ℕ) % 3 = 0 := by
              have h₁₁ : (n : ℕ) % 3 = 0 := h₇
              have h₁₂ : (n ^ 4 : ℕ) % 3 = 0 := by
                simp [h₁₁, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
              exact h₁₂
            exact h₁₀
          have h₁₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
            have h₁₁ : (n ^ 4 : ℕ) % 3 = 0 := h₉
            have h₁₂ : (n ^ 2 : ℕ) % 3 = 0 := h₈
            omega
          exact h₁₀
        exact h₆
      · -- Case: n ≡ 1 mod 3
        have h₅ : (n : ℕ) % 3 = 1 := h₄
        have h₆ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
          have h₇ : (n : ℕ) % 3 = 1 := h₅
          have h₈ : (n ^ 2 : ℕ) % 3 = 1 := by
            have h₉ : (n : ℕ) % 3 = 1 := h₇
            have h₁₀ : (n ^ 2 : ℕ) % 3 = 1 := by
              simp [h₉, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
            exact h₁₀
          have h₉ : (n ^ 4 : ℕ) % 3 = 1 := by
            have h₁₀ : (n ^ 4 : ℕ) % 3 = 1 := by
              have h₁₁ : (n ^ 2 : ℕ) % 3 = 1 := h₈
              have h₁₂ : (n ^ 4 : ℕ) % 3 = 1 := by
                simp [h₁₁, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
              exact h₁₂
            exact h₁₀
          have h₁₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
            have h₁₁ : (n ^ 4 : ℕ) % 3 = 1 := h₉
            have h₁₂ : (n ^ 2 : ℕ) % 3 = 1 := h₈
            omega
          exact h₁₀
        exact h₆
      · -- Case: n ≡ 2 mod 3
        have h₅ : (n : ℕ) % 3 = 2 := h₄
        have h₆ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
          have h₇ : (n : ℕ) % 3 = 2 := h₅
          have h₈ : (n ^ 2 : ℕ) % 3 = 1 := by
            have h₉ : (n : ℕ) % 3 = 2 := h₇
            have h₁₀ : (n ^ 2 : ℕ) % 3 = 1 := by
              simp [h₉, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
            exact h₁₀
          have h₉ : (n ^ 4 : ℕ) % 3 = 1 := by
            have h₁₀ : (n ^ 4 : ℕ) % 3 = 1 := by
              have h₁₁ : (n ^ 2 : ℕ) % 3 = 1 := h₈
              have h₁₂ : (n ^ 4 : ℕ) % 3 = 1 := by
                simp [h₁₁, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
              exact h₁₂
            exact h₁₀
          have h₁₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 3 = 1 := by
            have h₁₁ : (n ^ 4 : ℕ) % 3 = 1 := h₉
            have h₁₂ : (n ^ 2 : ℕ) % 3 = 1 := h₈
            omega
          exact h₁₀
        exact h₆
    have h₇ : ¬(3 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := by
      omega
    omega
  
  have h_main : ∃ (k : ℕ), p = 12 * k + 1 := by
    have h₄ : p.Prime := hp
    have h₅ : p ∣ n ^ 4 - n ^ 2 + 1 := hdiv
    have h₆ : p ≠ 2 := h2
    have h₇ : p ≠ 3 := h3
    have h₈ : p ≥ 2 := Nat.Prime.two_le (by exact h₄)
    have h₉ : p ≥ 4 := by
      by_contra h₉
      have h₁₀ : p < 4 := by linarith
      have h₁₁ : p = 2 ∨ p = 3 := by
        have h₁₂ : p ≤ 3 := by linarith
        have h₁₃ : p ≥ 2 := Nat.Prime.two_le (by exact h₄)
        omega
      cases h₁₁ with
      | inl h₁₁ =>
        exfalso
        apply h₆
        <;> simp_all [h₁₁]
      | inr h₁₁ =>
        exfalso
        apply h₇
        <;> simp_all [h₁₁]
    have h₁₀ : p % 12 = 1 := by
      have h₁₁ : p % 12 = 1 := by
        -- We need to show that p ≡ 1 mod 12.
        -- Given that p ≥ 5 is a prime and p divides n⁴ - n² + 1, we can use the fact that n⁴ - n² + 1 ≡ 1 mod 3 to show that p ≡ 1 mod 12.
        have h₁₂ : p % 12 = 1 := by
          by_contra h₁₂
          -- Assume that p ≢ 1 mod 12.
          have h₁₃ : p % 12 ≠ 1 := h₁₂
          have h₁₄ : p % 12 = 5 ∨ p % 12 = 7 ∨ p % 12 = 11 := by
            have h₁₅ := Nat.Prime.eq_one_or_self_of_dvd h₄ 2
            have h₁₆ := Nat.Prime.eq_one_or_self_of_dvd h₄ 3
            have h₁₇ := Nat.Prime.eq_one_or_self_of_dvd h₄ 4
            have h₁₈ : p % 12 ≠ 0 := by
              intro h₁₈
              have h₁₉ : p % 12 = 0 := h₁₈
              omega
            have h₂₀ : p % 12 ≠ 2 := by
              intro h₂₀
              have h₂₁ : p % 12 = 2 := h₂₀
              omega
            have h₂₂ : p % 12 ≠ 3 := by
              intro h₂₂
              have h₂₃ : p % 12 = 3 := h₂₂
              omega
            have h₂₄ : p % 12 ≠ 4 := by
              intro h₂₄
              have h₂₅ : p % 12 = 4 := h₂₄
              omega
            have h₂₆ : p % 12 ≠ 6 := by
              intro h₂₆
              have h₂₇ : p % 12 = 6 := h₂₆
              omega
            have h₂₈ : p % 12 ≠ 8 := by
              intro h₂₈
              have h₂₉ : p % 12 = 8 := h₂₈
              omega
            have h₃₀ : p % 12 ≠ 9 := by
              intro h₃₀
              have h₃₁ : p % 12 = 9 := h₃₀
              omega
            have h₃₂ : p % 12 ≠ 10 := by
              intro h₃₂
              have h₃₃ : p % 12 = 10 := h₃₂
              omega
            omega
          -- We have that p % 12 = 5 or p % 12 = 7 or p % 12 = 11.
          rcases h₁₄ with (h₁₄ | h₁₄ | h₁₄)
          -- Case 1: p % 12 = 5
          · have h₁₅ : p % 12 = 5 := h₁₄
            have h₁₆ := Nat.mod_add_div p 12
            have h₁₇ : p = 12 * (p / 12) + 5 := by omega
            rw [h₁₇] at h₅
            have h₁₈ : ¬(12 * (p / 12) + 5 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := by
              by_contra h₁₈
              have h₁₉ : (12 * (p / 12) + 5 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
              -- Use the fact that p divides n⁴ - n² + 1 to derive a contradiction.
              have h₂₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 0 := by
                have h₂₁ : (12 * (p / 12) + 5 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₉
                have h₂₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % (12 * (p / 12) + 5) = 0 := by
                  exact Nat.mod_eq_zero_of_dvd h₂₁
                omega
              have h₂₁ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                have h₂₂ : (n : ℕ) % 5 = 0 ∨ (n : ℕ) % 5 = 1 ∨ (n : ℕ) % 5 = 2 ∨ (n : ℕ) % 5 = 3 ∨ (n : ℕ) % 5 = 4 := by omega
                rcases h₂₂ with (h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂)
                · -- Case: n ≡ 0 mod 5
                  have h₂₃ : (n : ℕ) % 5 = 0 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                    have h₂₅ : (n : ℕ) % 5 = 0 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 5 = 0 := by
                      have h₂₇ : (n : ℕ) % 5 = 0 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 5 = 0 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 5 = 0 := by
                      have h₃₀ : (n : ℕ) % 5 = 0 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 5 = 0 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 5 = 0 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 5 = 0 := h₂₆
                      omega
                    exact h₃₂
                  exact h₂₄
                · -- Case: n ≡ 1 mod 5
                  have h₂₃ : (n : ℕ) % 5 = 1 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                    have h₂₅ : (n : ℕ) % 5 = 1 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 5 = 1 := by
                      have h₂₇ : (n : ℕ) % 5 = 1 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 5 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 5 = 1 := by
                      have h₃₀ : (n : ℕ) % 5 = 1 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 5 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 5 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 5 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact h₂₄
                · -- Case: n ≡ 2 mod 5
                  have h₂₃ : (n : ℕ) % 5 = 2 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                    have h₂₅ : (n : ℕ) % 5 = 2 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 5 = 4 := by
                      have h₂₇ : (n : ℕ) % 5 = 2 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 5 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 5 = 1 := by
                      have h₃₀ : (n : ℕ) % 5 = 2 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 5 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 5 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 5 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact h₂₄
                · -- Case: n ≡ 3 mod 5
                  have h₂₃ : (n : ℕ) % 5 = 3 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                    have h₂₅ : (n : ℕ) % 5 = 3 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 5 = 4 := by
                      have h₂₇ : (n : ℕ) % 5 = 3 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 5 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 5 = 1 := by
                      have h₃₀ : (n : ℕ) % 5 = 3 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 5 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 5 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 5 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact h₂₄
                · -- Case: n ≡ 4 mod 5
                  have h₂₃ : (n : ℕ) % 5 = 4 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                    have h₂₅ : (n : ℕ) % 5 = 4 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 5 = 1 := by
                      have h₂₇ : (n : ℕ) % 5 = 4 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 5 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 5 = 1 := by
                      have h₃₀ : (n : ℕ) % 5 = 4 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 5 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 5 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 5 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 5 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact h₂₄
              omega
            have h₂₁ : ¬(12 * (p / 12) + 5 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
            contradiction
          · have h₁₅ : p % 12 = 7 := h₁₄
            have h₁₆ := Nat.mod_add_div p 12
            have h₁₇ : p = 12 * (p / 12) + 7 := by omega
            rw [h₁₇] at h₅
            have h₁₈ : ¬(12 * (p / 12) + 7 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := by
              by_contra h₁₈
              have h₁₉ : (12 * (p / 12) + 7 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
              -- Use the fact that p divides n⁴ - n² + 1 to derive a contradiction.
              have h₂₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 0 := by
                have h₂₁ : (12 * (p / 12) + 7 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₉
                have h₂₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % (12 * (p / 12) + 7) = 0 := by
                  exact Nat.mod_eq_zero_of_dvd h₂₁
                omega
              have h₂₁ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 ∨ (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 3 ∨ (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 5 := by
                have h₂₂ : (n : ℕ) % 7 = 0 ∨ (n : ℕ) % 7 = 1 ∨ (n : ℕ) % 7 = 2 ∨ (n : ℕ) % 7 = 3 ∨ (n : ℕ) % 7 = 4 ∨ (n : ℕ) % 7 = 5 ∨ (n : ℕ) % 7 = 6 := by omega
                rcases h₂₂ with (h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂)
                · -- Case: n ≡ 0 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 0 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                    have h₂₅ : (n : ℕ) % 7 = 0 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 0 := by
                      have h₂₇ : (n : ℕ) % 7 = 0 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 0 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 0 := by
                      have h₃₀ : (n : ℕ) % 7 = 0 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 0 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 0 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 0 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 1 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 1 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                    have h₂₅ : (n : ℕ) % 7 = 1 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 1 := by
                      have h₂₇ : (n : ℕ) % 7 = 1 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 1 := by
                      have h₃₀ : (n : ℕ) % 7 = 1 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 2 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 2 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 5 := by
                    have h₂₅ : (n : ℕ) % 7 = 2 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 4 := by
                      have h₂₇ : (n : ℕ) % 7 = 2 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 2 := by
                      have h₃₀ : (n : ℕ) % 7 = 2 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 2 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 5 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 2 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inr h₂₄)
                · -- Case: n ≡ 3 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 3 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 3 := by
                    have h₂₅ : (n : ℕ) % 7 = 3 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 2 := by
                      have h₂₇ : (n : ℕ) % 7 = 3 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 2 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 4 := by
                      have h₃₀ : (n : ℕ) % 7 = 3 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 4 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 4 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 2 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 4 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 4 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 5 := by
                    have h₂₅ : (n : ℕ) % 7 = 4 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 2 := by
                      have h₂₇ : (n : ℕ) % 7 = 4 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 2 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 4 := by
                      have h₃₀ : (n : ℕ) % 7 = 4 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 4 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 5 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 4 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 2 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inr h₂₄)
                · -- Case: n ≡ 5 mod 7
                  have h₂₃ : (n : ℕ) % 7 = 5 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 3 := by
                    have h₂₅ : (n : ℕ) % 7 = 5 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 4 := by
                      have h₂₇ : (n : ℕ) % 7 = 5 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 2 := by
                      have h₃₀ : (n : ℕ) % 7 = 5 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 2 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 2 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 6 mod 7
                  have h₂三 : (n : ℕ) % 7 = 6 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                    have h₂₅ : (n : ℕ) % 7 = 6 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 7 = 1 := by
                      have h₂₇ : (n : ℕ) % 7 = 6 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 7 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 7 = 1 := by
                      have h₃₀ : (n : ℕ) % 7 = 6 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 7 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 7 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 7 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 7 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
              rcases h₂₁ with (h₂₁ | h₂₁ | h₂₁) <;> omega
            have h₂₂ : ¬(12 * (p / 12) + 7 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
            contradiction
          · have h₁₅ : p % 12 = 11 := h₁₄
            have h₁₆ := Nat.mod_add_div p 12
            have h₁₇ : p = 12 * (p / 12) + 11 := by omega
            rw [h₁₇] at h₅
            have h₁₈ : ¬(12 * (p / 12) + 11 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := by
              by_contra h₁₈
              have h₁₉ : (12 * (p / 12) + 11 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
              -- Use the fact that p divides n⁴ - n² + 1 to derive a contradiction.
              have h₂₀ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 0 := by
                have h₂₁ : (12 * (p / 12) + 11 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₉
                have h₂₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % (12 * (p / 12) + 11) = 0 := by
                  exact Nat.mod_eq_zero_of_dvd h₂₁
                omega
              have h₂₁ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 ∨ (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 ∨ (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 9 := by
                have h₂₂ : (n : ℕ) % 11 = 0 ∨ (n : ℕ) % 11 = 1 ∨ (n : ℕ) % 11 = 2 ∨ (n : ℕ) % 11 = 3 ∨ (n : ℕ) % 11 = 4 ∨ (n : ℕ) % 11 = 5 ∨ (n : ℕ) % 11 = 6 ∨ (n : ℕ) % 11 = 7 ∨ (n : ℕ) % 11 = 8 ∨ (n : ℕ) % 11 = 9 ∨ (n : ℕ) % 11 = 10 := by
                  omega
                rcases h₂₂ with (h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂ | h₂₂)
                · -- Case: n ≡ 0 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 0 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                    have h₂₅ : (n : ℕ) % 11 = 0 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 0 := by
                      have h₂₇ : (n : ℕ) % 11 = 0 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 0 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 0 := by
                      have h₃₀ : (n : ℕ) % 11 = 0 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 0 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 0 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 0 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 1 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 1 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                    have h₂₅ : (n : ℕ) % 11 = 1 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 1 := by
                      have h₂₇ : (n : ℕ) % 11 = 1 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 1 := by
                      have h₃₀ : (n : ℕ) % 11 = 1 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 2 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 2 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                    have h₂₅ : (n : ℕ) % 11 = 2 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 4 := by
                      have h₂₇ : (n : ℕ) % 11 = 2 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 5 := by
                      have h₃₀ : (n : ℕ) % 11 = 2 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 5 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 5 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 3 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 3 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 9 := by
                    have h₂₅ : (n : ℕ) % 11 = 3 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 9 := by
                      have h₂₇ : (n : ℕ) % 11 = 3 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 9 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 4 := by
                      have h₃₀ : (n : ℕ) % 11 = 3 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 4 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 9 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 4 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 9 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inr h₂₄)
                · -- Case: n ≡ 4 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 4 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                    have h₂₅ : (n : ℕ) % 11 = 4 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 5 := by
                      have h₂₇ : (n : ℕ) % 11 = 4 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 5 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 3 := by
                      have h₃₀ : (n : ℕ) % 11 = 4 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 3 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 3 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 5 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 5 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 5 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                    have h₂₅ : (n : ℕ) % 11 = 5 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 3 := by
                      have h₂₇ : (n : ℕ) % 11 = 5 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 3 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 9 := by
                      have h₃₀ : (n : ℕ) % 11 = 5 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 9 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 9 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 3 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 6 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 6 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 9 := by
                    have h₂₅ : (n : ℕ) % 11 = 6 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 3 := by
                      have h₂₇ : (n : ℕ) % 11 = 6 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 3 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 9 := by
                      have h₃₀ : (n : ℕ) % 11 = 6 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 9 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 9 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 9 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 3 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inr h₂₄)
                · -- Case: n ≡ 7 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 7 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                    have h₂₅ : (n : ℕ) % 11 = 7 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 5 := by
                      have h₂₇ : (n : ℕ) % 11 = 7 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 5 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 3 := by
                      have h₃₀ : (n : ℕ) % 11 = 7 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 3 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 3 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 5 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 8 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 8 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                    have h₂₅ : (n : ℕ) % 11 = 8 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 9 := by
                      have h₂₇ : (n : ℕ) % 11 = 8 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 9 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 4 := by
                      have h₃₀ : (n : ℕ) % 11 = 8 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 4 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 4 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 9 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
                · -- Case: n ≡ 9 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 9 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                    have h₂₅ : (n : ℕ) % 11 = 9 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 4 := by
                      have h₂₇ : (n : ℕ) % 11 = 9 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 4 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 5 := by
                      have h₃₀ : (n : ℕ) % 11 = 9 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 5 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 3 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 5 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 4 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inr (Or.inl h₂₄)
                · -- Case: n ≡ 10 mod 11
                  have h₂₃ : (n : ℕ) % 11 = 10 := h₂₂
                  have h₂₄ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                    have h₂₅ : (n : ℕ) % 11 = 10 := h₂₃
                    have h₂₆ : (n ^ 2 : ℕ) % 11 = 1 := by
                      have h₂₇ : (n : ℕ) % 11 = 10 := h₂₅
                      have h₂₈ : (n ^ 2 : ℕ) % 11 = 1 := by
                        simp [h₂₇, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₂₈
                    have h₂₉ : (n ^ 4 : ℕ) % 11 = 1 := by
                      have h₃₀ : (n : ℕ) % 11 = 10 := h₂₅
                      have h₃₁ : (n ^ 4 : ℕ) % 11 = 1 := by
                        simp [h₃₀, Nat.pow_succ, Nat.mul_mod, Nat.add_mod]
                      exact h₃₁
                    have h₃₂ : (n ^ 4 - n ^ 2 + 1 : ℕ) % 11 = 1 := by
                      have h₃₃ : (n ^ 4 : ℕ) % 11 = 1 := h₂₉
                      have h₃₄ : (n ^ 2 : ℕ) % 11 = 1 := h₂₆
                      omega
                    exact h₃₂
                  exact Or.inl h₂₄
              rcases h₂₁ with (h₂₁ | h₂₁ | h₂₁) <;> omega
            have h₂₂ : ¬(12 * (p / 12) + 11 : ℕ) ∣ n ^ 4 - n ^ 2 + 1 := h₁₈
            contradiction
          <;> omega
        omega
      <;> omega
    omega
    <;> omega
  
    <;> omega
    <;> omega
    <;> omega
    <;> omega
    <;> omega
  
    <;> omega
    <;> omega
    <;> omega
    <;> omega
    <;> omega
  
  have h₁₁ : p % 12 = 1 := by
    have h₁₂ : p % 12 = 1 := by
      omega
    exact h₁₂
  
  have h₁₂ : ∃ (k : ℕ), p = 12 * k + 1 := by
    use p / 12
    have h₁₃ : p % 12 = 1 := h₁₁
    have h₁₄ : p = 12 * (p / 12) + 1 := by
      omega
    omega
  
  exact h₁₂