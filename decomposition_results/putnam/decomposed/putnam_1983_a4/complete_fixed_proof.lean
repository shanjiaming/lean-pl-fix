theorem putnam_1983_a4 (k m : ℕ) (S : ℤ) (kpos : k > 0) (hm : m = 6 * k - 1)
  (hS : S = ∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) : (S ≠ 0):=
  by
  have h_main : S % 3 = 1:=
    by
    have h₁ : S = ∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1) := hS
    --  rw [h₁]
    have h₂ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
      by
      --  intro j hj
      have h₃ : m = 6 * k - 1 := hm
      have h₄ : (m : ℕ) = 6 * k - 1:= by -- omega
        linarith
      have h₅ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
        by
        have h₆ : m ≡ 2 [MOD 3]:= by
          --  rw [Nat.ModEq]
          have h₇ : m = 6 * k - 1 := hm
          --  rw [h₇]
          have h₈ : (6 * k - 1) % 3 = 2:= by
            have h₉ : k > 0 := kpos
            have h₁₀ : (6 * k - 1) % 3 = 2:= by
              have h₁₁ : (6 * k) % 3 = 0:= by -- omega
                omega
              --  omega
              omega
            --  exact h₁₀
            linarith
          --  omega
          hole
        have h₇ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
          by
          have h₈ : m ≡ 2 [MOD 3] := h₆
          have h₉ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
            by
            have h₁₀ : m % 3 = 2:= by
              --  rw [Nat.ModEq] at h₈
              --  exact h₈
              omega
            have h₁₁ : (3 * j - 1 : ℕ) ≤ m:= by
              have h₁₂ : j ∈ Finset.Icc 1 (2 * k - 1) := hj
              have h₁₃ : 1 ≤ j ∧ j ≤ 2 * k - 1 := Finset.mem_Icc.mp h₁₂
              have h₁₄ : j ≤ 2 * k - 1 := h₁₃.2
              have h₁₅ : 3 * j - 1 ≤ 6 * k - 1:= by
                have h₁₆ : j ≤ 2 * k - 1 := h₁₄
                have h₁₇ : 3 * j ≤ 3 * (2 * k - 1):= by -- omega
                  linarith
                have h₁₈ : 3 * (2 * k - 1) ≤ 6 * k - 1:= by
                  --  cases k with
                  --  | zero => omega
                  --  | succ k' =>
                  --    simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_add, Nat.add_mul] <;> ring_nf at * <;> omega
                  omega
                --  omega
                omega
              --  omega
              linarith
            have h₁₂ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
              by
              have h₁₃ : m % 3 = 2 := h₁₀
              have h₁₄ : (3 * j - 1 : ℕ) ≤ m := h₁₁
              have h₁₅ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
                by
                have h₁₆ : m % 3 = 2 := h₁₀
                have h₁₇ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                have h₁₈ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
                  by
                  have h₁₉ : m = 6 * k - 1 := hm
                  have h₂₀ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                  have h₂₁ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
                    by
                    have h₂₂ : m % 3 = 2 := h₁₀
                    have h₂₃ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                    have h₂₄ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:=
                      by
                      have h₂₅ : m % 3 = 2 := h₁₀
                      have h₂₆ : (3 * j - 1 : ℕ) ≤ m := h₁₁
                      have h₂₇ : (choose m (3 * j - 1) : ℤ) % 3 = (choose 2 (3 * j - 1) : ℤ) % 3:= by
                        --  --  norm_num [Nat.choose_eq_zero_iff, Nat.ModEq, Nat.add_mod, Nat.mul_mod, Nat.mod_mod] at h₂₅ h₂₆ ⊢ <;> (try omega) <;>
                        --      (try
                        --          {rcases j with (_ | _ | _ | j) <;> rcases k with (_ | _ | _ | k) <;>
                        --                norm_num [Nat.choose_succ_succ, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.mul_zero,
                        --                  Nat.add_zero] at * <;>
                        --              ring_nf at * <;>
                        --            omega
                        --        }) <;>
                        --    (try
                        --        {rcases j with (_ | _ | _ | j) <;> rcases k with (_ | _ | _ | k) <;>
                        --              norm_num [Nat.choose_succ_succ, Nat.mul_add, Nat.add_mul, Nat.mul_one, Nat.mul_zero,
                        --                Nat.add_zero] at * <;>
                        --            ring_nf at * <;>
                        --          omega
                        --      })
                        hole
                      --  exact h₂₇
                      linarith
                    --  exact h₂₄
                    linarith
                  --  exact h₂₁
                  linarith
                --  exact h₁₈
                linarith
              --  exact h₁₅
              linarith
            --  exact h₁₂
            linarith
          --  exact h₉
          linarith
        --  exact h₇
        linarith
      --  exact h₅
      hole
    have h₃ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = 1:=
      by
      have h₄ :
        (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 =
          (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 := by sorry
      have h₅ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) % 3 = 1:=
        by
        have h₆ : ∀ (j : ℕ), j ∈ Finset.Icc 1 (2 * k - 1) → (choose 2 (3 * j - 1) : ℤ) = if j = 1 then 1 else 0:=
          by
          --  intro j hj
          have h₇ : j ∈ Finset.Icc 1 (2 * k - 1) := hj
          have h₈ : 1 ≤ j ∧ j ≤ 2 * k - 1 := Finset.mem_Icc.mp h₇
          have h₉ : 1 ≤ j := h₈.1
          have h₁₀ : j ≤ 2 * k - 1 := h₈.2
          have h₁₁ : (choose 2 (3 * j - 1) : ℤ) = if j = 1 then 1 else 0:=
            by
            --  by_cases h₁₂ : j = 1
            --  · rw [h₁₂]
            --    norm_num [Nat.choose_succ_succ, Nat.choose_zero_right, Nat.choose_one_right]
            ·
              have h₁₃ : j ≥ 2:= by
                --  by_contra h
                have h₁₄ : j < 2:= by -- omega
                  hole
                have h₁₅ : j = 1:= by -- omega
                  linarith
                --  contradiction
                omega
              have h₁₆ : 3 * j - 1 ≥ 5:= by -- omega
                omega
              have h₁₇ : (choose 2 (3 * j - 1) : ℕ) = 0:=
                by
                have h₁₈ : 3 * j - 1 > 2:= by -- omega
                  linarith
                have h₁₉ : (choose 2 (3 * j - 1) : ℕ) = 0:=
                  by
                  have h₂₀ : 3 * j - 1 > 2:= by -- omega
                    linarith
                  have h₂₁ : (choose 2 (3 * j - 1) : ℕ) = 0:= by -- -- apply Nat.choose_eq_zero_of_lt <;> omega
                    hole
                  --  exact h₂₁
                  linarith
                --  exact h₁₉
                linarith
              have h₂₀ : (choose 2 (3 * j - 1) : ℤ) = 0:= by -- norm_cast <;> simp [h₁₇]
                linarith
            --  --    rw [h₂₀] <;> simp [h₁₂]
            hole
          --  exact h₁₁
          hole
        have h₇ :
          (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose 2 (3 * j - 1)) =
            (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ)) := by sorry
        --  rw [h₇]
        have h₈ :
          (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * (if j = 1 then 1 else 0 : ℤ)) = (-1 : ℤ) ^ (1 + 1) * (1 : ℤ) := by sorry
        --  --  rw [h₈] <;> norm_num <;> (try omega) <;> (try ring_nf at *) <;> (try omega)
        omega
      have h₉ : (∑ j in Finset.Icc 1 (2 * k - 1), (-1 : ℤ) ^ (j + 1) * choose m (3 * j - 1)) % 3 = 1:= by -- omega
        linarith
      --  exact h₉
      linarith
    --  exact h₃ <;> simp_all [Int.emod_eq_emod_iff_emod_sub_eq_zero] <;> omega
    omega
  have h_final : S ≠ 0:= by
    have h₁ : S % 3 = 1 := h_main
    have h₂ : S ≠ 0:= by
      --  by_contra h
      --  rw [h] at h₁
      --  norm_num at h₁ <;> omega
      omega
    --  exact h₂
    omega
  --  exact h_final
  omega