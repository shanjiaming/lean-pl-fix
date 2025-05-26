theorem putnam_2016_b4 (n : ℕ) (npos : n ≥ 1) (mats01 : Set (Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ))
  (hmats01 : mats01 = {A | ∀ i j : Fin (2 * n), A i j = 0 ∨ A i j = 1}) :
  (∑' A : mats01, (A.1 - (Matrix.transpose A)).det) / mats01.ncard =
    ((fun n : ℕ => (2 * n)! / (4 ^ n * (n)!)) : ℕ → ℝ) n:=
  by
  have h1 : mats01.Infinite:= by
    --  rw [hmats01]
    have h2 : (2 * n : ℕ) ≥ 2:= by
      have h3 : n ≥ 1 := npos
      have h4 : 2 * n ≥ 2:= by -- omega
        linarith
      --  exact h4
      linarith
    have h5 : (2 * n : ℕ) > 0:= by -- omega
      linarith
    have h6 :
      ∀ (x : ℝ),
        x = 0 ∨ x = 1 →
          (fun (A : Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ) => ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1)
            (Matrix.of fun i j => if i = ⟨0, by omega⟩ ∧ j = ⟨0, by omega⟩ then x else 0) := by sorry
    have h7 : Set.Infinite {A : Matrix (Fin (2 * n)) (Fin (2 * n)) ℝ | ∀ (i j : Fin (2 * n)), A i j = 0 ∨ A i j = 1}:=
      by
      --  refine' Set.infinite_of_injective_forall_mem (fun x y hxy => _) h6
      have h8 := congr_arg (fun A => A ⟨0, by omega⟩ ⟨0, by omega⟩) hxy
      simp [Matrix.of_apply, Fin.ext_iff] at h8 <;> aesop
      hole
    --  exact h7
    hole
  have h2 : mats01.ncard = 0:= by
    have h3 : mats01.Infinite := h1
    have h4 : mats01.ncard = 0:= by
      have h5 : mats01.Infinite := h3
      have h6 : mats01.ncard = 0:= by -- exact Set.Infinite.ncard h5
        hole
      --  exact h6
      linarith
    --  exact h4
    linarith
  have h3 : (∑' A : mats01, (A.1 - (Matrix.transpose A)).det) / mats01.ncard = 0:= by
    --  --  rw [h2] <;> simp [div_zero] <;> simp_all [Set.Infinite] <;> aesop
    hole
  have h4 : ((fun n : ℕ => (2 * n)! / (4 ^ n * (n)!)) : ℕ → ℝ) n = 0:=
    by
    have h5 : (2 * n : ℕ) > 0:= by
      have h6 : n ≥ 1 := npos
      --  omega
      linarith
    have h6 : (2 * n : ℕ) > 0 := h5
    have h7 : (2 * n : ℕ) > 0 := h6
    have h8 : ((fun n : ℕ => (2 * n)! / (4 ^ n * (n)!)) : ℕ → ℝ) n = ((2 * n)! / (4 ^ n * n!)):= by -- simp
      hole
    --  rw [h8]
    have h9 : (2 * n : ℕ) > 0 := h7
    have h10 : (2 * n : ℕ) > 0 := h9
    have h11 : (2 * n : ℕ) > 0 := h10
    have h12 : (2 * n)! < 4 ^ n * n !:= by
      have h13 : n ≥ 1 := npos
      have h14 : (2 * n)! < 4 ^ n * n !:=
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
        have h15 : ∀ k : ℕ, k ≥ 1 → (2 * k)! < 4 ^ k * k !:= by
          --  intro k hk
          have h16 : (2 * k)! < 4 ^ k * k !:= by
            --  induction' hk with k hk IH
            --  · norm_num [Nat.factorial]
            ·
            --    cases k with
            --    | zero => norm_num [Nat.factorial] at hk ⊢
            --    | succ k' =>
            --      simp_all [Nat.mul_succ, Nat.factorial_succ, Nat.pow_succ, Nat.mul_assoc] <;>
            --        nlinarith [Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos k'),
            --          Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 1)),
            --          Nat.mul_le_mul_left (4 ^ k') (Nat.factorial_pos (2 * k' + 2))]
            hole
          --  exact h16
          hole
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
        hole
      --  exact h14
      linarith
    have h13 : (2 * n : ℕ) > 0 := h11
    have h14 : ((2 * n)! : ℝ) / (4 ^ n * n! : ℝ) = 0:=
      by
      have h15 : (2 * n : ℕ)! < 4 ^ n * n ! := h12
      have h16 : (2 * n : ℕ)! / (4 ^ n * n ! : ℕ) = 0:= by -- -- apply Nat.div_eq_of_lt <;> simpa [Nat.mul_assoc] using h15
        hole
      have h17 : ((2 * n)! : ℝ) / (4 ^ n * n! : ℝ) = 0:= by
        --  --  --  --  norm_cast at h16 ⊢ <;> simp_all [Nat.cast_eq_zero] <;> field_simp [Nat.cast_eq_zero] at * <;> norm_cast at * <;>
        --      simp_all [Nat.div_eq_of_lt] <;>
        --    linarith
        hole
      --  exact h17
      hole
    --  simpa using h14
    hole
  have h5 :
    (∑' A : mats01, (A.1 - (Matrix.transpose A)).det) / mats01.ncard =
      ((fun n : ℕ => (2 * n)! / (4 ^ n * (n)!)) : ℕ → ℝ) n := by sorry
  --  apply h5
  hole