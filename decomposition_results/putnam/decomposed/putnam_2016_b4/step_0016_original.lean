theorem h14 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ)) (hmats01 : mats01 = {A | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}) (h1 : mats01.Infinite) (h2 : mats01.ncard = 0) (A : (↑mats01 : Type)) (h5 h6 h7 : 2 * n > 0) (h8 : (fun n => (↑(2 * n)! : ℝ) / (4 ^ n * (↑n ! : ℝ))) n = (↑(2 * n)! : ℝ) / (4 ^ n * sorry)) (h9 h10 h11 : 2 * n > 0) (h13 : n ≥ 1) : (2 * n)! < 4 ^ n * n ! :=
  by
  have h15 : ∀ k : ℕ, k ≥ 1 → (2 * k)! < 4 ^ k * k ! :=
    by
    intro k hk
    have h16 : (2 * k)! < 4 ^ k * k ! := by
      induction' hk with k hk IH
      · norm_num [Nat.factorial]
      ·
        cases k with
        | zero => norm_num [Nat.factorial] at hk ⊢
        | succ k' =>
          simp_all [Nat.mul_succ, Nat.factorial_succ, Nat.pow_succ, Nat.mul_assoc] <;>
            nlinarith [Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos k'),
              Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 1)),
              Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 2))]
    exact h16
  have h15 : ∀ k : ℕ, k ≥ 1 → (2 * k)! < 4 ^ k * k ! := by sorry
have h14 : (2 * n)! < 4 ^ n * n ! :=
  by
  have h15 : ∀ k : ℕ, k ≥ 1 → (2 * k)! < 4 ^ k * k ! :=
    by
    intro k hk
    have h16 : (2 * k)! < 4 ^ k * k ! := by
      induction' hk with k hk IH
      · norm_num [Nat.factorial]
      ·
        cases k with
        | zero => norm_num [Nat.factorial] at hk ⊢
        | succ k' =>
          simp_all [Nat.mul_succ, Nat.factorial_succ, Nat.pow_succ, Nat.mul_assoc] <;>
            nlinarith [Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos k'),
              Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 1)),
              Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 2))]
    exact h16
  exact h15 n h13