theorem putnam_1965_b2 (n : ℕ) (hn : n > 1) (won : Fin n → Fin n → Bool) (hirrefl : ∀ i : Fin n, won i i = false)
  (hantisymm : ∀ i j : Fin n, i ≠ j → won i j = ¬won j i) (w l : Fin n → ℤ)
  (hw : w = fun r : Fin n => ∑ j : Fin n, (if won r j then 1 else 0)) (hl : l = fun r : Fin n => n - 1 - w r) :
  ∑ r : Fin n, (w r) ^ 2 = ∑ r : Fin n, (l r) ^ 2:=
  by
  have h_total_wins : (∑ r : Fin n, (w r : ℤ)) = n * (n - 1) / 2:=
    by
    have h₁ : (∑ r : Fin n, (w r : ℤ)) = ∑ r : Fin n, (∑ j : Fin n, (if won r j then 1 else 0) : ℤ) := by
      simp [hw] <;> rfl
    --  rw [h₁]
    have h₂ :
      (∑ r : Fin n, (∑ j : Fin n, (if won r j then 1 else 0) : ℤ) : ℤ) =
        ∑ r : Fin n, (∑ j : Fin n, if won r j then (1 : ℤ) else 0) := by sorry
    --  rw [h₂]
    have h₃ :
      (∑ r : Fin n, (∑ j : Fin n, if won r j then (1 : ℤ) else 0)) =
        ∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0 := by sorry
    --  rw [h₃]
    have h₄ :
      (∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0) =
        ∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0 := by sorry
    --  rw [h₄]
    have h₅ :
      (∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0) =
        ∑ x : Fin n × Fin n, if won x.1 x.2 then (1 : ℤ) else 0 := by sorry
    --  rw [h₅]
    have h₆ :
      (∑ x : Fin n × Fin n, if won x.1 x.2 then (1 : ℤ) else 0) =
        ↑(Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n)))) := by sorry
    --  rw [h₆]
    have h₇ :
      Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) = n * (n - 1) / 2 := by sorry
    --  rw [h₁₀] <;> norm_num <;> simp_all [Int.cast_add, Int.cast_mul, Int.cast_sub, Int.cast_one] <;> ring_nf at * <;>
        norm_cast <;>
      have h₁ : (∑ r : Fin n, (w r : ℤ)) = ∑ r : Fin n, (∑ j : Fin n, (if won r j then 1 else 0) : ℤ):= by -- simp [hw] <;> rfl
        hole
  have h_total_wins : (∑ r : Fin n, (w r : ℤ)) = n * (n - 1) / 2 :=
    by
    have h₁ : (∑ r : Fin n, (w r : ℤ)) = ∑ r : Fin n, (∑ j : Fin n, (if won r j then 1 else 0) : ℤ) := by
      simp [hw] <;> rfl
    rw [h₁]
    have h₂ :
      (∑ r : Fin n, (∑ j : Fin n, (if won r j then 1 else 0) : ℤ) : ℤ) =
        ∑ r : Fin n, (∑ j : Fin n, if won r j then (1 : ℤ) else 0) :=
      by rfl
    rw [h₂]
    have h₃ :
      (∑ r : Fin n, (∑ j : Fin n, if won r j then (1 : ℤ) else 0)) =
        ∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0 :=
      by rfl
    rw [h₃]
    have h₄ :
      (∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0) =
        ∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0 :=
      by rfl
    rw [h₄]
    have h₅ :
      (∑ r : Fin n, ∑ j : Fin n, if won r j then (1 : ℤ) else 0) =
        ∑ x : Fin n × Fin n, if won x.1 x.2 then (1 : ℤ) else 0 :=
      by rw [Finset.sum_product] <;> simp [Finset.sum_product] <;> rfl
    rw [h₅]
    have h₆ :
      (∑ x : Fin n × Fin n, if won x.1 x.2 then (1 : ℤ) else 0) =
        ↑(Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n)))) :=
      by
      have h₇ :
        (∑ x : Fin n × Fin n, if won x.1 x.2 then (1 : ℤ) else 0) =
          ∑ x : Fin n × Fin n, if won x.1 x.2 = true then (1 : ℤ) else 0 :=
        by
        congr
        ext x
        by_cases h : won x.1 x.2 <;> simp [h] <;> simp_all [Bool.not_eq_true] <;> aesop
      rw [h₇]
      have h₈ :
        (∑ x : Fin n × Fin n, if won x.1 x.2 = true then (1 : ℤ) else 0) =
          ↑(Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n)))) :=
        by
        have h₉ :
          (∑ x : Fin n × Fin n, if won x.1 x.2 = true then (1 : ℤ) else 0) =
            ∑ x in Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n)), (1 : ℤ) :=
          by rw [Finset.sum_filter] <;> simp [Finset.sum_const, Finset.card_univ] <;> aesop
        rw [h₉]
        simp [Finset.sum_const, Finset.card_univ] <;> aesop
      rw [h₈] <;> simp_all [Finset.sum_const, Finset.card_univ] <;> aesop
    rw [h₆]
    have h₇ :
      Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
        n * (n - 1) / 2 :=
      by
      have h₈ :
        Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
          Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) :=
        rfl
      rw [h₈]
      have h₉ : ∀ (i j : Fin n), i ≠ j → (won i j = true ∨ won j i = true) :=
        by
        intro i j h
        have h₁₀ := hantisymm i j h
        cases Classical.em (won i j = true) <;> cases Classical.em (won j i = true) <;> simp_all [Bool.not_eq_true] <;>
          aesop
      have h₁₀ :
        Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
          n * (n - 1) / 2 :=
        by
        have h₁₁ :
          Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
            n * (n - 1) / 2 :=
          by
          have h₁₂ : ∀ (i : Fin n), won i i = false := by
            intro i
            exact hirrefl i
          have h₁₃ : ∀ (i j : Fin n), i ≠ j → (won i j = true ∨ won j i = true) :=
            by
            intro i j h
            exact h₉ i j h
          have h₁₄ :
            Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
              n * (n - 1) / 2 :=
            by
            have h₁₅ :
              Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
                n * (n - 1) / 2 :=
              by
              classical
              have h₁₆ :
                Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
                  n * (n - 1) / 2 :=
                by
                have h₁₇ : ∀ (i j : Fin n), i ≠ j → (won i j = true → won j i = false) :=
                  by
                  intro i j h h₁₈
                  have h₁₉ := hantisymm i j h
                  cases Classical.em (won j i = true) <;> simp_all [Bool.not_eq_true] <;> aesop
                have h₁₈ :
                  Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
                    n * (n - 1) / 2 :=
                  by
                  have h₁₉ :
                    Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
                      n * (n - 1) / 2 :=
                    by
                    have h₂₀ : n ≥ 2 := by omega
                    have h₂₁ : n * (n - 1) / 2 = n * (n - 1) / 2 := rfl
                    classical
                      calc
                      Finset.card (Finset.filter (fun x => won x.1 x.2 = true) (Finset.univ : Finset (Fin n × Fin n))) =
                          ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                        by simp [Finset.sum_filter, Finset.sum_product] <;> aesop
                      _ = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 := rfl
                      _ = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 := rfl
                      _ = n * (n - 1) / 2 :=
                        by
                        have h₂₂ : ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 :=
                          by
                          have h₂₃ :
                            ∑ i : Fin n,
                              ∑ j : Fin n,
                                if won i j = true then 1
                                else 0 = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                            rfl
                          rw [h₂₃]
                          have h₂₄ : ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 := by
                            classical
                            have h₂₅ :
                              ∑ i : Fin n,
                                ∑ j : Fin n,
                                  if won i j = true then 1
                                  else 0 = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                              rfl
                            rw [h₂₅]
                            have h₂₆ : ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 :=
                              by
                              have h₂₇ :
                                ∀ i : Fin n,
                                  ∑ j : Fin n,
                                    if won i j = true then 1 else 0 = ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                by simp
                              have h₂₈ :
                                ∑ i : Fin n,
                                  ∑ j : Fin n,
                                    if won i j = true then 1
                                    else 0 = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                rfl
                              rw [h₂₈]
                              have h₂₉ : ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 :=
                                by
                                have h₃₀ :
                                  ∑ i : Fin n,
                                    ∑ j : Fin n,
                                      if won i j = true then 1
                                      else 0 = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                  rfl
                                rw [h₃₀]
                                have h₃₁ : ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 :=
                                  by
                                  have h₃₂ :
                                    ∑ i : Fin n,
                                      ∑ j : Fin n,
                                        if won i j = true then 1
                                        else 0 = ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                    rfl
                                  rw [h₃₂]
                                  have h₃₃ :
                                    ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 = n * (n - 1) / 2 := by
                                    classical
                                      calc
                                      (∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0) =
                                          ∑ i : Fin n, ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                        rfl
                                      _ = ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) := rfl
                                      _ = ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) := rfl
                                      _ = n * (n - 1) / 2 :=
                                        by
                                        have h₃₄ :
                                          ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) = n * (n - 1) / 2 :=
                                          by
                                          have h₃₅ :
                                            ∀ i : Fin n,
                                              ∑ j : Fin n,
                                                if won i j = true then 1
                                                else 0 = ∑ j : Fin n, if won i j = true then 1 else 0 :=
                                            by simp
                                          have h₃₆ :
                                            ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) =
                                              n * (n - 1) / 2 :=
                                            by
                                            classical
                                            have h₃₇ :
                                              ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) =
                                                n * (n - 1) / 2 :=
                                              by
                                              have h₃₈ :
                                                ∑ i : Fin n, (∑ j : Fin n, if won i j = true then 1 else 0) =
                                                  n * (n - 1) / 2 :=
                                                by
                                                cases n with
                                                | zero => contradiction
                                                | succ n =>
                                                  simp_all [Fin.sum_univ_succ, Fin.ext_iff, Nat.div_eq_of_lt] <;>
                                                            ring_nf at * <;>
                                                          norm_num <;>
                                                        simp_all [Fin.forall_fin_succ, Fin.ext_iff, Nat.div_eq_of_lt] <;>
                                                      norm_num <;>
                                                    omega
                                              exact h₃₈
                                            exact h₃₇
                                          exact h₃₆
                                        exact h₃₄
                                  exact h₃₃
                                exact h₃₁
                              exact h₂₉
                            exact h₂₆
                          exact h₂₄
                        exact h₂₂
                      _ = n * (n - 1) / 2 := by rfl
                  exact h₁₈
                exact h₁₈
              exact h₁₆
            exact h₁₅
          exact h₁₄
        exact h₁₁
      exact h₁₀
    rw [h₁₀] <;> norm_num <;> simp_all [Int.cast_add, Int.cast_mul, Int.cast_sub, Int.cast_one] <;> ring_nf at * <;>
        norm_cast <;>
      aesop
    hole
  have h_main : ∑ r : Fin n, (w r) ^ 2 = ∑ r : Fin n, (l r) ^ 2:=
    by
    have h₁ : (∑ r : Fin n, (l r : ℤ) ^ 2) = ∑ r : Fin n, (w r : ℤ) ^ 2:= by
      --  calc
      --    (∑ r : Fin n, (l r : ℤ) ^ 2) = ∑ r : Fin n, ((n - 1 : ℤ) - w r) ^ 2 := by
      --      simp_all [hl] <;> simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;> ring_nf <;>
      --        simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib]
      --    _ = ∑ r : Fin n, ((n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * w r + (w r) ^ 2) :=
      --      by
      --      apply Finset.sum_congr rfl
      --      intro r _
      --      ring_nf <;> simp_all [sub_eq_add_neg] <;> ring_nf <;> simp_all [sub_eq_add_neg]
      --    _ = ∑ r : Fin n, ((n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * w r + (w r) ^ 2) := by rfl
      --    _ = (∑ r : Fin n, (n - 1 : ℤ) ^ 2) - ∑ r : Fin n, 2 * (n - 1 : ℤ) * w r + ∑ r : Fin n, (w r) ^ 2 := by
      --      rw [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;> simp [Finset.mul_sum, Finset.sum_mul, mul_assoc] <;>
      --        ring_nf
      --    _ = (n : ℤ) * (n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * ∑ r : Fin n, w r + ∑ r : Fin n, (w r) ^ 2 := by
      --      simp [Finset.mul_sum, Finset.sum_mul, mul_assoc] <;> simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;>
      --            ring_nf <;>
      --          simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;>
      --        simp [Finset.mul_sum, Finset.sum_mul, mul_assoc]
      --    _ = (n : ℤ) * (n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * ((n * (n - 1) / 2 : ℤ)) + ∑ r : Fin n, (w r) ^ 2 := by
      --      rw [h_total_wins] <;> simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;> ring_nf <;>
      --        simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib]
      --    _ = ∑ r : Fin n, (w r) ^ 2 :=
      --      by
      --      have h₂ : (n : ℤ) * (n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * ((n * (n - 1) / 2 : ℤ)) = 0 :=
      --        by
      --        have h₃ : (n : ℤ) ≥ 2 := by exact_mod_cast (by omega)
      --        have h₄ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 :=
      --          by
      --          have h₅ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 :=
      --            by
      --            have h₆ : (n : ℤ) % 2 = 0 ∨ (n : ℤ) % 2 = 1 := by omega
      --            rcases h₆ with (h₆ | h₆)
      --            ·
      --              have h₇ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 :=
      --                by
      --                have h₈ : (n : ℤ) % 2 = 0 := h₆
      --                have h₉ : (n - 1 : ℤ) % 2 = 1 := by omega
      --                have h₁₀ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 := by norm_num [Int.mul_emod, h₈, h₉]
      --                exact h₁₀
      --              exact h₇
      --            ·
      --              have h₇ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 :=
      --                by
      --                have h₈ : (n : ℤ) % 2 = 1 := h₆
      --                have h₉ : (n - 1 : ℤ) % 2 = 0 := by omega
      --                have h₁₀ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 := by norm_num [Int.mul_emod, h₈, h₉]
      --                exact h₁₀
      --              exact h₇
      --          exact h₅
      --        have h₅ : (n : ℤ) * (n - 1 : ℤ) / 2 * 2 = (n : ℤ) * (n - 1 : ℤ) :=
      --          by
      --          have h₅₁ : (n : ℤ) * (n - 1 : ℤ) % 2 = 0 := h₄
      --          have h₅₂ : (n : ℤ) * (n - 1 : ℤ) / 2 * 2 = (n : ℤ) * (n - 1 : ℤ) := by omega
      --          exact h₅₂
      --        have h₆ : (n : ℤ) * (n - 1 : ℤ) ^ 2 - 2 * (n - 1 : ℤ) * ((n * (n - 1) / 2 : ℤ)) = 0 := by nlinarith
      --        exact h₆
      --      rw [h₂] <;> simp [add_zero] <;> simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib] <;> ring_nf <;>
      --        simp_all [Finset.sum_sub_distrib, Finset.sum_add_distrib]
      --    _ = ∑ r : Fin n, (w r : ℤ) ^ 2 := by rfl
      hole
    have h₂ : ∑ r : Fin n, (w r : ℤ) ^ 2 = ∑ r : Fin n, (w r : ℤ) ^ 2:= by -- rfl
      norm_num
    have h₃ : ∑ r : Fin n, (l r : ℤ) ^ 2 = ∑ r : Fin n, (w r : ℤ) ^ 2:= by -- rw [h₁]
      linarith
    have h₄ : ∑ r : Fin n, (w r) ^ 2 = ∑ r : Fin n, (l r) ^ 2:= by -- exact_mod_cast h₃
      linarith
    --  exact h₄
    linarith
  --  apply h_main
  linarith