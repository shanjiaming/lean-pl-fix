theorem solve_congruence3 (p : ℕ) : ∃ m : ℕ, (15 * m + 8) % 7 = 1 ∧ m = 7 * p := by
  have h_main : ∃ (m : ℕ), (15 * m + 8) % 7 = 1 ∧ m = 7 * p := by
    use 7 * p
    constructor
    · -- Prove that (15 * (7 * p) + 8) % 7 = 1
      have h₁ : (15 * (7 * p) + 8 : ℕ) % 7 = 1 := by
        have h₂ : (15 * (7 * p) + 8 : ℕ) = 105 * p + 8 := by
          ring
        rw [h₂]
        have h₃ : (105 * p + 8 : ℕ) % 7 = 1 := by
          have h₄ : p % 7 = p % 7 := rfl
          have h₅ : (105 * p + 8 : ℕ) % 7 = 1 := by
            norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod, Nat.mod_eq_of_lt]
          exact h₅
        exact h₃
      exact h₁
    · -- Prove that 7 * p = 7 * p
      rfl
  exact h_main