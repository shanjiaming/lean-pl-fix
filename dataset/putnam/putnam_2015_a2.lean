theorem putnam_2015_a2
(a : ℕ → ℤ)
(abase : a 0 = 1 ∧ a 1 = 2)
(arec : ∀ n ≥ 2, a n = 4 * a (n - 1) - a (n - 2))
: Odd ((181) : ℕ ) ∧ ((181) : ℕ ).Prime ∧ ((((181) : ℕ ) : ℤ) ∣ a 2015) := by
  have h_odd : Odd (181 : ℕ) := by
    norm_num [Nat.odd_iff_not_even, Nat.even_iff, Nat.mod_eq_of_lt]
    <;> decide
  
  have h_prime : Nat.Prime (181 : ℕ) := by
    norm_num [Nat.Prime]
    <;> decide
  
  have h_div : ((181 : ℕ) : ℤ) ∣ a 2015 := by
    have h₁ : ((181 : ℕ) : ℤ) ∣ a 2015 := by
      -- We need to show that 181 divides a_2015.
      -- We will use the fact that the sequence is periodic modulo 181 with period 20.
      -- First, we compute the sequence modulo 181 until we find a period.
      have h₂ : a 2015 % (181 : ℤ) = 0 := by
        -- We will show that a_2015 ≡ 0 mod 181.
        -- First, we compute the sequence modulo 181 until we find a period.
        have h₃ : ∀ n : ℕ, a n % (181 : ℤ) = a (n % 20) % (181 : ℤ) := by
          intro n
          have h₄ : ∀ n : ℕ, a n % (181 : ℤ) = a (n % 20) % (181 : ℤ) := by
            intro n
            induction n using Nat.strong_induction_on with
            | h n ih =>
              match n with
              | 0 =>
                norm_num [abase, arec]
              | 1 =>
                norm_num [abase, arec]
              | 2 =>
                norm_num [abase, arec]
              | 3 =>
                norm_num [abase, arec]
              | 4 =>
                norm_num [abase, arec]
              | 5 =>
                norm_num [abase, arec]
              | 6 =>
                norm_num [abase, arec]
              | 7 =>
                norm_num [abase, arec]
              | 8 =>
                norm_num [abase, arec]
              | 9 =>
                norm_num [abase, arec]
              | 10 =>
                norm_num [abase, arec]
              | 11 =>
                norm_num [abase, arec]
              | 12 =>
                norm_num [abase, arec]
              | 13 =>
                norm_num [abase, arec]
              | 14 =>
                norm_num [abase, arec]
              | 15 =>
                norm_num [abase, arec]
              | 16 =>
                norm_num [abase, arec]
              | 17 =>
                norm_num [abase, arec]
              | 18 =>
                norm_num [abase, arec]
              | 19 =>
                norm_num [abase, arec]
              | n + 20 =>
                have h₅ := ih (n + 19) (by omega)
                have h₆ := ih (n + 18) (by omega)
                have h₇ := ih (n + 17) (by omega)
                have h₈ := ih (n + 16) (by omega)
                have h₉ := ih (n + 15) (by omega)
                have h₁₀ := ih (n + 14) (by omega)
                have h₁₁ := ih (n + 13) (by omega)
                have h₁₂ := ih (n + 12) (by omega)
                have h₁₃ := ih (n + 11) (by omega)
                have h₁₄ := ih (n + 10) (by omega)
                have h₁₅ := ih (n + 9) (by omega)
                have h₁₆ := ih (n + 8) (by omega)
                have h₁₇ := ih (n + 7) (by omega)
                have h₁₈ := ih (n + 6) (by omega)
                have h₁₉ := ih (n + 5) (by omega)
                have h₂₀ := ih (n + 4) (by omega)
                have h₂₁ := ih (n + 3) (by omega)
                have h₂₂ := ih (n + 2) (by omega)
                have h₂₃ := ih (n + 1) (by omega)
                have h₂₄ := ih n (by omega)
                norm_num [abase, arec, Int.mul_emod, Int.sub_emod] at h₅ h₆ h₇ h₈ h₉ h₁₀ h₁₁ h₁₂ h₁₃ h₁₄ h₁₅ h₁₆ h₁₇ h₁₈ h₁₉ h₂₀ h₂₁ h₂₂ h₂₃ h₂₄ ⊢
                <;>
                  (try omega) <;>
                  (try ring_nf at * <;> omega) <;>
                  (try norm_num at * <;> omega) <;>
                  (try
                    {
                      simp_all [Nat.mod_eq_of_lt]
                      <;>
                      omega
                    })
          exact h₄ n
        have h₅ : a 2015 % (181 : ℤ) = a (2015 % 20) % (181 : ℤ) := h₃ 2015
        have h₆ : a (2015 % 20) % (181 : ℤ) = 0 := by
          norm_num [abase, arec, Int.mul_emod, Int.sub_emod] at h₅ ⊢
          <;>
            (try omega) <;>
            (try ring_nf at * <;> omega) <;>
            (try norm_num at * <;> omega) <;>
            (try
              {
                simp_all [Nat.mod_eq_of_lt]
                <;>
                omega
              })
        have h₇ : a 2015 % (181 : ℤ) = 0 := by
          rw [h₅]
          exact h₆
        exact h₇
      have h₈ : ((181 : ℕ) : ℤ) ∣ a 2015 := by
        -- We need to show that 181 divides a_2015.
        -- We will use the fact that a_2015 ≡ 0 mod 181.
        have h₉ : a 2015 % (181 : ℤ) = 0 := h₂
        have h₁₀ : ((181 : ℕ) : ℤ) ∣ a 2015 := by
          -- We use the fact that a_2015 ≡ 0 mod 181 to conclude that 181 divides a_2015.
          rw [Int.dvd_iff_emod_eq_zero]
          exact h₉
        exact h₁₀
      exact h₈
    exact h₁
  
  exact ⟨h_odd, h_prime, h_div⟩