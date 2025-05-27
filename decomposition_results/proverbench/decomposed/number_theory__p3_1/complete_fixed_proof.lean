theorem solve_congruence1_and_2 (m : ℕ) : ∃ n : ℕ, congruence1 n ∧ congruence2 n ∧ n = 15 * m + 8:=
  by
  have h_main : ∃ (n : ℕ), congruence1 n ∧ congruence2 n ∧ n = 15 * m + 8:=
    by
    --  use 15 * m + 8
    --  constructor
    ·
      have h₁ : (15 * m + 8 : ℕ) % 3 = 2:= by -- norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod] <;> omega
        omega
    --    exact h₁
    --  · constructor
      ·
        have h₂ : (15 * m + 8 : ℕ) % 5 = 3:= by -- norm_num [Nat.add_mod, Nat.mul_mod, Nat.mod_mod] <;> omega
          omega
    --      exact h₂
    --    · rfl
    hole
  --  exact h_main
  norm_cast