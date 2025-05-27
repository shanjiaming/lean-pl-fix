theorem putnam_1983_a5 :
    (∃ α : ℝ, α > 0 ∧ ∀ n : ℕ, n > 0 → Even (⌊α ^ n⌋ - n)) ↔ ((True) : Prop ) := by
  have h_main : (∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)) := by
    use 1 / 2
    constructor
    · -- Prove that 1/2 > 0
      norm_num
    · -- Prove that for all n > 0, Even (⌊(1 / 2 : ℝ) ^ n⌋ - n)
      intro n hn
      have h₁ : ⌊((1 / 2 : ℝ) : ℝ) ^ n⌋ = 0 := by
        -- Prove that the floor of (1/2)^n is 0 for n > 0
        apply Int.floor_eq_iff.mpr
        constructor
        · -- Prove that 0 ≤ (1/2)^n
          have h₂ : (0 : ℝ) ≤ ((1 / 2 : ℝ) : ℝ) ^ n := by positivity
          norm_num at h₂ ⊢ <;>
          (try norm_num) <;>
          (try linarith) <;>
          (try positivity) <;>
          (try
            {
              induction' hn with n hn
              · norm_num
              · cases n with
                | zero => contradiction
                | succ n =>
                  simp_all [pow_succ]
                  <;> norm_num at * <;> linarith
            })
        · -- Prove that (1/2)^n < 1
          have h₂ : ((1 / 2 : ℝ) : ℝ) ^ n < 1 := by
            have h₃ : n > 0 := hn
            have h₄ : ((1 / 2 : ℝ) : ℝ) ^ n < 1 := by
              apply pow_lt_one (by norm_num) (by norm_num) (by omega)
            exact h₄
          norm_num at h₂ ⊢ <;>
          (try norm_num) <;>
          (try linarith) <;>
          (try positivity) <;>
          (try
            {
              induction' hn with n hn
              · norm_num
              · cases n with
                | zero => contradiction
                | succ n =>
                  simp_all [pow_succ]
                  <;> norm_num at * <;> linarith
            })
      -- Prove that Even (⌊(1 / 2 : ℝ) ^ n⌋ - n)
      rw [h₁]
      have h₂ : Even (0 - (n : ℤ)) := by
        -- Prove that Even (0 - n)
        have h₃ : n > 0 := hn
        have h₄ : (0 : ℤ) - (n : ℤ) ≤ 0 := by
          have h₅ : (n : ℤ) > 0 := by exact_mod_cast h₃
          linarith
        have h₅ : Int.toNat ((0 : ℤ) - (n : ℤ)) = 0 := by
          have h₆ : (0 : ℤ) - (n : ℤ) ≤ 0 := h₄
          rw [Int.toNat_of_nonpos h₆]
          <;> simp
        rw [Int.even_iff, h₅]
        <;> simp [Nat.even_iff, Nat.mod_eq_of_lt]
        <;> omega
      simpa [Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₂
  
  have h_final : ((∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)) ↔ True) := by
    constructor
    · -- Prove the forward direction: if the left side is true, then True is true (trivial)
      intro h
      trivial
    · -- Prove the backward direction: if True is true, then the left side is true (from h_main)
      intro h
      exact h_main
  
  exact h_final