theorem prime_congruent_1_mod_6_has_quadratic_form (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) :
  ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2:=
  by
  have h_main : p > 0:=
    by
    have h₁ : p ≥ 2:= by
      have h₂ := hp.two_le
      norm_cast at h₂ ⊢ <;> omega
      hole
    have h₂ : p > 0:= by -- linarith
      linarith
    --  exact h₂
    linarith
  have h_nat_prime : Nat.Prime (Int.natAbs p):=
    by
    have h₁ : (p : ℤ) > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p):=
      by
      have h₃ : Int.Prime p:= by
        have h₃ : Prime p := hp
        --  exact?
        hole
      --  exact Int.prime_iff_natAbs_prime.mp h₃
      hole
    --  exact h₂
    simpa
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ) :=
    by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ) := by rw [Int.natAbs_of_nonneg] <;> linarith
    exact h₂
  have h_exists_rep : ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2:=
    by
    have h₁ : p > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
    have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
    have h₄ : ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2:=
      by
      have h₅ : (p : ℤ) > 0:= by -- linarith
        linarith
      have h₆ : (p : ℤ) % 6 = 1:= by -- simpa using hp_mod_6
        linarith
      have h₇ : (p : ℕ) % 6 = 1:= by -- -- norm_cast at h₆ ⊢ <;> omega
        hole
      have h₈ : ∃ (a b : ℤ), (p : ℤ) = a ^ 2 - a * b + b ^ 2:=
        by
        have h₉ : ∃ (x y : ℤ), (p : ℤ) = x ^ 2 + 3 * y ^ 2:=
          by
          have h₁₀ : (p : ℕ) % 6 = 1:= by -- simpa using h₇
            hole
          have h₁₁ : ∃ (x y : ℤ), (p : ℤ) = x ^ 2 + 3 * y ^ 2:= by
            --  --  --  --  --  use (p : ℤ), 0 <;> ring_nf at * <;> norm_num at * <;> (try omega) <;> (try nlinarith) <;>
            --      (try ring_nf at * <;> norm_num at * <;> omega) <;>
            --    (try {simp_all [Int.emod_eq_of_lt] <;> omega
            --      })
            hole
          --  exact h₁₁
          hole
        --  obtain ⟨x, y, h₉⟩ := h₉
        --  use (x + y), (2 * y)
        have h₁₀ : (p : ℤ) = x ^ 2 + 3 * y ^ 2:= by -- simpa using h₉
          linarith
        --  --  ring_nf at * <;> nlinarith
        hole
      --  simpa using h₈
      hole
    --  simpa using h₄
    simpa
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ):= by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ):= by -- -- rw [Int.natAbs_of_nonneg] <;> linarith
      omega
    --  exact h₂
    linarith
have prime_congruent_1_mod_6_has_quadratic_form (p : ℤ) (hp : Prime p) (hp_mod_6 : p % 6 = 1) :
  ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2 :=
  by
  have h_main : p > 0 := by sorry
  have h_nat_prime : Nat.Prime (Int.natAbs p) := by sorry
  have h_p_eq_natAbs : p = (Int.natAbs p : ℤ) :=
    by
    have h₁ : p > 0 := h_main
    have h₂ : p = (Int.natAbs p : ℤ) := by rw [Int.natAbs_of_nonneg] <;> linarith
    exact h₂
  have h_exists_rep : ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2 :=
    by
    have h₁ : p > 0 := h_main
    have h₂ : Nat.Prime (Int.natAbs p) := h_nat_prime
    have h₃ : p = (Int.natAbs p : ℤ) := h_p_eq_natAbs
    have h₄ : ∃ (a b : ℤ), p = a ^ 2 - a * b + b ^ 2 :=
      by
      have h₅ : (p : ℤ) > 0 := by linarith
      have h₆ : (p : ℤ) % 6 = 1 := by simpa using hp_mod_6
      have h₇ : (p : ℕ) % 6 = 1 := by norm_cast at h₆ ⊢ <;> omega
      have h₈ : ∃ (a b : ℤ), (p : ℤ) = a ^ 2 - a * b + b ^ 2 :=
        by
        have h₉ : ∃ (x y : ℤ), (p : ℤ) = x ^ 2 + 3 * y ^ 2 :=
          by
          have h₁₀ : (p : ℕ) % 6 = 1 := by simpa using h₇
          have h₁₁ : ∃ (x y : ℤ), (p : ℤ) = x ^ 2 + 3 * y ^ 2 := by
            use (p : ℤ), 0 <;> ring_nf at * <;> norm_num at * <;> (try omega) <;> (try nlinarith) <;>
                (try ring_nf at * <;> norm_num at * <;> omega) <;>
              (try {simp_all [Int.emod_eq_of_lt] <;> omega
                })
          exact h₁₁
        obtain ⟨x, y, h₉⟩ := h₉
        use (x + y), (2 * y)
        have h₁₀ : (p : ℤ) = x ^ 2 + 3 * y ^ 2 := by simpa using h₉
        ring_nf at * <;> nlinarith
      simpa using h₈
    simpa using h₄
  simpa using h_exists_rep
  hole