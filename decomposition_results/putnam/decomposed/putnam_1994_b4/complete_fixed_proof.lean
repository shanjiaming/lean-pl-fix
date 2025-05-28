theorem putnam_1994_b4 (matgcd : Matrix (Fin 2) (Fin 2) ℤ → ℤ) (A : Matrix (Fin 2) (Fin 2) ℤ) (d : ℕ → ℤ)
  (hmatgcd : ∀ M, matgcd M = Int.gcd (Int.gcd (Int.gcd (M 0 0) (M 0 1)) (M 1 0)) (M 1 1))
  (hA : A 0 0 = 3 ∧ A 0 1 = 2 ∧ A 1 0 = 4 ∧ A 1 1 = 3) (hd : ∀ n ≥ 1, d n = matgcd (A ^ n - 1)) :
  Tendsto d atTop atTop:=
  by
  have h₁ : A = !![3, 2; 4, 3]:= by
    --  ext i j
    --  --  --  fin_cases i <;> fin_cases j <;> simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, hA] <;> aesop
    hole
  have h₂ : ∀ (n : ℕ), n ≥ 1 → d n ≥ (n : ℤ):= by
    --  intro n hn
    have h₃ : n ≥ 1 := hn
    have h₄ : d n = matgcd (A ^ n - 1) := hd n h₃
    have h₅ : A = !![3, 2; 4, 3] := h₁
    --  rw [h₄]
    have h₆ : ∀ (n : ℕ), n ≥ 1 → (matgcd (A ^ n - 1) : ℤ) ≥ (n : ℤ):=
      by
      --  intro n hn
      have h₇ : ∀ (n : ℕ), n ≥ 1 → (matgcd (A ^ n - 1) : ℤ) ≥ (n : ℤ):=
        by
        intro n hn
        have h₈ : n ≥ 1 := hn
        have h₉ : A = !![3, 2; 4, 3] := h₁
        rw [h₉]
        have h₁₀ : ∀ (n : ℕ), n ≥ 1 → (matgcd (!![3, 2; 4, 3] ^ n - 1 : Matrix (Fin 2) (Fin 2) ℤ) : ℤ) ≥ (n : ℤ):=
          by
          intro n hn
          have h₁₁ : n ≥ 1 := hn
          have h₁₂ : ∀ (n : ℕ), n ≥ 1 → (matgcd (!![3, 2; 4, 3] ^ n - 1 : Matrix (Fin 2) (Fin 2) ℤ) : ℤ) ≥ (n : ℤ):=
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
            hole
          exact h₁₂ n hn
          hole
        exact h₁₀ n hn
        hole
      --  exact h₇ n hn
      hole
    --  exact h₆ n hn
    hole
  have h₃ : Tendsto d atTop atTop :=
    by
    have h₄ : ∀ (n : ℕ), n ≥ 1 → d n ≥ (n : ℤ) := h₂
    have h₅ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop :=
      by
      have h₅₁ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop := by
        apply Int.comap_coe_atTop.atTop_mono <;> simp [Filter.map_le_iff_le_comap] <;> exact tendsto_id
      exact h₅₁
    have h₆ : Tendsto d atTop atTop :=
      by
      have h₇ : ∀ᶠ (n : ℕ) in atTop, d n ≥ (n : ℤ) :=
        by
        filter_upwards [eventually_ge_atTop 1] with n hn
        exact h₄ n hn
      have h₈ : Tendsto d atTop atTop := by
        refine' tendsto_atTop_mono _ h₅
        filter_upwards [eventually_ge_atTop 1] with n hn
        exact by
          have h₉ : d n ≥ (n : ℤ) := h₄ n hn
          exact_mod_cast h₉
      exact h₈
    exact h₆
  have h₃ : Tendsto d atTop atTop:= by
    have h₄ : ∀ (n : ℕ), n ≥ 1 → d n ≥ (n : ℤ) := h₂
    have h₅ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop:=
      by
      have h₅₁ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop:= by
        --  --  --  apply Int.comap_coe_atTop.atTop_mono <;> simp [Filter.map_le_iff_le_comap] <;> exact tendsto_id
        hole
      --  exact h₅₁
      hole
    have h₆ : Tendsto d atTop atTop:=
      by
      have h₇ : ∀ᶠ (n : ℕ) in atTop, d n ≥ (n : ℤ):=
        by
        --  filter_upwards [eventually_ge_atTop 1] with n hn
        --  exact h₄ n hn
        hole
      have h₈ : Tendsto d atTop atTop:= by
        --  refine' tendsto_atTop_mono _ h₅
        filter_upwards [eventually_ge_atTop 1] with n hn
        exact by
          have h₉ : d n ≥ (n : ℤ) := h₄ n hn
          exact_mod_cast h₉
        hole
      --  exact h₈
      hole
    --  exact h₆
    hole
have putnam_1994_b4 (matgcd : Matrix (Fin 2) (Fin 2) ℤ → ℤ) (A : Matrix (Fin 2) (Fin 2) ℤ) (d : ℕ → ℤ)
  (hmatgcd : ∀ M, matgcd M = Int.gcd (Int.gcd (Int.gcd (M 0 0) (M 0 1)) (M 1 0)) (M 1 1))
  (hA : A 0 0 = 3 ∧ A 0 1 = 2 ∧ A 1 0 = 4 ∧ A 1 1 = 3) (hd : ∀ n ≥ 1, d n = matgcd (A ^ n - 1)) :
  Tendsto d atTop atTop :=
  by
  have h₁ : A = !![3, 2; 4, 3] := by sorry
  have h₂ : ∀ (n : ℕ), n ≥ 1 → d n ≥ (n : ℤ) := by sorry
  have h₃ : Tendsto d atTop atTop :=
    by
    have h₄ : ∀ (n : ℕ), n ≥ 1 → d n ≥ (n : ℤ) := h₂
    have h₅ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop :=
      by
      have h₅₁ : Tendsto (fun (n : ℕ) => (n : ℤ)) atTop atTop := by
        apply Int.comap_coe_atTop.atTop_mono <;> simp [Filter.map_le_iff_le_comap] <;> exact tendsto_id
      exact h₅₁
    have h₆ : Tendsto d atTop atTop :=
      by
      have h₇ : ∀ᶠ (n : ℕ) in atTop, d n ≥ (n : ℤ) :=
        by
        filter_upwards [eventually_ge_atTop 1] with n hn
        exact h₄ n hn
      have h₈ : Tendsto d atTop atTop := by
        refine' tendsto_atTop_mono _ h₅
        filter_upwards [eventually_ge_atTop 1] with n hn
        exact by
          have h₉ : d n ≥ (n : ℤ) := h₄ n hn
          exact_mod_cast h₉
      exact h₈
    exact h₆
  exact h₃
  hole