theorem h₁₂ (matgcd : Matrix (Fin 2) (Fin 2) ℤ → ℤ) (A : Matrix (Fin 2) (Fin 2) ℤ) (d : ℕ → ℤ) (hmatgcd : ∀ (M : Matrix (Fin 2) (Fin 2) ℤ), matgcd M = ↑((↑((↑((M 0 0).gcd (M 0 1))).gcd (M 1 0))).gcd (M 1 1))) (hA : A 0 0 = 3 ∧ A 0 1 = 2 ∧ A 1 0 = 4 ∧ A 1 1 = 3) (hd : ∀ n ≥ 1, d n = matgcd (A ^ n - 1)) (h₁ : A = !![3, 2; 4, 3]) (n✝² : ℕ) (hn✝² h₃ : n✝² ≥ 1) (h₄ : d n✝² = matgcd (A ^ n✝² - 1)) (h₅ : A = !![3, 2; 4, 3]) (n✝¹ : ℕ) (hn✝¹ : n✝¹ ≥ 1) (n✝ : ℕ) (hn✝ h₈ : n✝ ≥ 1) (h₉ : A = !![3, 2; 4, 3]) (n : ℕ) (hn h₁₁ : n ≥ 1) : ∀ n ≥ 1, matgcd (!![3, 2; 4, 3] ^ n - 1) ≥ ↑n :=
  by
  intro n hn
  induction' hn with n hn IH
  · simp [hmatgcd, Matrix.one_apply, Matrix.mul_apply, Fin.sum_univ_succ, pow_one] <;> norm_num <;> decide
  ·
    cases n with
    | zero => simp_all [hmatgcd, Matrix.one_apply, Matrix.mul_apply, Fin.sum_univ_succ, pow_one] <;> norm_num <;> decide
    | succ n =>
      simp_all [hmatgcd, Matrix.one_apply, Matrix.mul_apply, Fin.sum_univ_succ, pow_succ, Matrix.sub_apply,
                Nat.cast_add, Nat.cast_one, Nat.cast_mul] <;>
              norm_num <;>
            (try omega) <;>
          (try {ring_nf at * <;> norm_num at * <;> omega
            }) <;>
        (try {norm_num [Int.gcd_eq_zero_iff] at * <;> omega
          })