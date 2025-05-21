lemma solve_congruence1_and_2 (m : ℕ) : ∃ n : ℕ, congruence1 n ∧ congruence2 n ∧ n = 15 * m + 8 := by
  have h_main : ∃ (n : ℕ), congruence1 n ∧ congruence2 n ∧ n = 15 * m + 8 := by
    use 15 * m + 8
    constructor
    · -- Prove that 15 * m + 8 ≡ 2 mod 3
      have h₁ : (15 * m + 8 : ℕ) % 3 = 2 := by
        norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod]
        <;> omega
      exact h₁
    · constructor
      · -- Prove that 15 * m + 8 ≡ 3 mod 5
        have h₂ : (15 * m + 8 : ℕ) % 5 = 3 := by
          norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod]
          <;> omega
        exact h₂
      · -- Prove that n = 15 * m + 8
        rfl
  exact h_main