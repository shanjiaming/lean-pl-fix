theorem putnam_1983_a5 : (∃ α : ℝ, α > 0 ∧ ∀ n : ℕ, n > 0 → Even (⌊α ^ n⌋ - n)) ↔ ((True) : Prop):=
  by
  have h_main : (∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)):=
    by
    --  use 1 / 2
    --  constructor
    --  · norm_num
    --  · intro n hn
      have h₁ : ⌊((1 / 2 : ℝ) : ℝ) ^ n⌋ = 0:= by
        --  apply Int.floor_eq_iff.mpr
        --  constructor
        ·
          have h₂ : (0 : ℝ) ≤ ((1 / 2 : ℝ) : ℝ) ^ n:= by -- positivity
            norm_num
        --  --  --  --    norm_num at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try positivity) <;>
        --      (try {
        --          induction' hn with n hn
        --          · norm_num
        --          ·
        --            cases n with
        --            | zero => contradiction
        --            | succ n => simp_all [pow_succ] <;> norm_num at * <;> linarith
        --        })
        ·
          have h₂ : ((1 / 2 : ℝ) : ℝ) ^ n < 1 := by sorry
        --  --  --  --    norm_num at h₂ ⊢ <;> (try norm_num) <;> (try linarith) <;> (try positivity) <;>
        --      (try {
        --          induction' hn with n hn
        --          · norm_num
        --          ·
        --            cases n with
        --            | zero => contradiction
        --            | succ n => simp_all [pow_succ] <;> norm_num at * <;> linarith
        --        })
        hole
    --    rw [h₁]
      have h₂ : Even (0 - (n : ℤ)):= by
        have h₃ : n > 0 := hn
        have h₄ : (0 : ℤ) - (n : ℤ) ≤ 0:= by
          have h₅ : (n : ℤ) > 0:= by -- exact_mod_cast h₃
            hole
          --  linarith
          hole
        have h₅ : Int.toNat ((0 : ℤ) - (n : ℤ)) = 0:=
          by
          have h₆ : (0 : ℤ) - (n : ℤ) ≤ 0 := h₄
          --  rw [Int.toNat_of_nonpos h₆] <;> simp
          hole
        --  rw [Int.even_iff, h₅] <;> simp [Nat.even_iff, Nat.mod_eq_of_lt] <;> omega
        hole
      simpa [Int.even_iff, Int.emod_eq_emod_iff_emod_sub_eq_zero] using h₂
    hole
  have h_final : ((∃ (α : ℝ), α > 0 ∧ ∀ (n : ℕ), n > 0 → Even (⌊α ^ n⌋ - n)) ↔ True):=
    by
    --  constructor
    --  · intro h
    --    trivial
    --  · intro h
    --    exact h_main
    hole
  --  exact h_final
  hole