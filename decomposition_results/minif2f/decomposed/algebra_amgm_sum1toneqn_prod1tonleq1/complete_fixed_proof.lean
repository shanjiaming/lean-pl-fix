theorem algebra_amgm_sum1toneqn_prod1tonleq1 (a : ℕ → NNReal) (n : ℕ) (h₀ : (∑ x in Finset.range n, a x) = n) :
  (∏ x in Finset.range n, a x) ≤ 1:=
  by
  have h₁ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1:=
    by
    have h₂ : (∑ x in Finset.range n, (a x : ℝ)) = n:= by -- exact_mod_cast h₀
      simpa
    --  by_cases h₃ : n = 0
    --  · simp [h₃]
    ·
      have h₄ : 0 < n := Nat.pos_of_ne_zero h₃
    --    by_cases h₅ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0
    --    · obtain ⟨i, hi, h₆⟩ := h₅
        have h₇ : (∏ x in Finset.range n, (a x : ℝ)) = 0:=
          by
          have h₈ : i ∈ Finset.range n := hi
          have h₉ : (a i : ℝ) = 0 := h₆
          have h₁₀ : (∏ x in Finset.range n, (a x : ℝ)) = 0:= by
            --  calc
            --    (∏ x in Finset.range n, (a x : ℝ)) = ∏ x in Finset.range n, (a x : ℝ) := rfl
            --    _ = 0 := by
            --      apply Finset.prod_eq_zero h₈
            --      simp [h₉]
            hole
          --  exact h₁₀
          hole
    --      linarith
      ·
        have h₅' : ∀ i, i ∈ Finset.range n → (a i : ℝ) > 0 :=
          by
          intro i hi
          have h₆ : ¬∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := h₅
          have h₇ : (a i : ℝ) ≠ 0 := by
            intro h
            have h₈ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := ⟨i, hi, by simp_all⟩
            contradiction
          have h₈ : (a i : ℝ) > 0 := by
            have h₉ : (a i : ℝ) ≥ 0 := by exact_mod_cast (a i).prop
            contrapose! h₇
            linarith
          exact h₈
        have h₆ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1:=
          by
          have h₇ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ 0:=
            by
            have h₈ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ ∑ x in Finset.range n, ((a x : ℝ) - 1):=
              by
              --  apply Finset.sum_le_sum
              --  intro i hi
              have h₉ : (a i : ℝ) > 0 := h₅' i hi
              have h₁₀ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1:=
                by
                have h₁₁ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1:= by -- linarith [Real.log_le_sub_one_of_pos h₉]
                  hole
                --  exact h₁₁
                linarith
              --  exact h₁₀
              hole
            have h₉ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n:= by
              --  calc
              --    ∑ x in Finset.range n, ((a x : ℝ) - 1) = ∑ x in Finset.range n, ((a x : ℝ) - 1) := rfl
              --    _ = (∑ x in Finset.range n, (a x : ℝ)) - ∑ x in Finset.range n, (1 : ℝ) := by rw [Finset.sum_sub_distrib]
              --    _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp [Finset.sum_const, Finset.card_range] <;> ring
              --    _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp
              hole
            have h₁₀ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n := h₉
            have h₁₁ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ (∑ x in Finset.range n, (a x : ℝ)) - n:= by -- linarith
              hole
            have h₁₂ : (∑ x in Finset.range n, (a x : ℝ)) - n = 0:= by -- -- -- rw [h₂] <;> ring <;> field_simp [h₃] <;> linarith
              hole
            --  linarith
            linarith
          have h₈ : Real.log (∏ x in Finset.range n, (a x : ℝ)) ≤ 0:= by
            --  calc
            --    Real.log (∏ x in Finset.range n, (a x : ℝ)) = ∑ x in Finset.range n, Real.log ((a x : ℝ)) := by
            --      rw [Real.log_prod _ _ fun i hi => by
            --          have h₉ : (a i : ℝ) > 0 := h₅' i hi
            --          positivity]
            --    _ ≤ 0 := h₇
            hole
          have h₉ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1:= by
            --  by_contra h
            have h₁₀ : (∏ x in Finset.range n, (a x : ℝ)) > 1:= by -- linarith
              hole
            have h₁₁ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0:=
              by
              have h₁₂ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0:=
                by
                --  apply Real.log_pos
                --  exact by
                --    have h₁₃ : (∏ x in Finset.range n, (a x : ℝ)) > 1 := h₁₀
                --    linarith
                hole
              --  linarith
              linarith
            --  linarith
            linarith
          --  exact h₉
          hole
        have h₅' : ∀ i, i ∈ Finset.range n → (a i : ℝ) > 0:= by
          --  intro i hi
          have h₆ : ¬∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := h₅
          have h₇ : (a i : ℝ) ≠ 0:= by
            --  intro h
            have h₈ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := ⟨i, hi, by simp_all⟩
            --  contradiction
            hole
          have h₈ : (a i : ℝ) > 0:= by
            have h₉ : (a i : ℝ) ≥ 0:= by -- exact_mod_cast (a i).prop
              norm_num
            --  contrapose! h₇
            --  linarith
            field_simp
          --  exact h₈
          hole
  have h₁ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 :=
    by
    have h₂ : (∑ x in Finset.range n, (a x : ℝ)) = n := by sorry
    by_cases h₃ : n = 0
    · simp [h₃]
    ·
      have h₄ : 0 < n := Nat.pos_of_ne_zero h₃
      by_cases h₅ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0
      · obtain ⟨i, hi, h₆⟩ := h₅
        have h₇ : (∏ x in Finset.range n, (a x : ℝ)) = 0 := by sorry
        linarith
      ·
        have h₅' : ∀ i, i ∈ Finset.range n → (a i : ℝ) > 0 :=
          by
          intro i hi
          have h₆ : ¬∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := h₅
          have h₇ : (a i : ℝ) ≠ 0 := by
            intro h
            have h₈ : ∃ i, i ∈ Finset.range n ∧ (a i : ℝ) = 0 := ⟨i, hi, by simp_all⟩
            contradiction
          have h₈ : (a i : ℝ) > 0 := by
            have h₉ : (a i : ℝ) ≥ 0 := by exact_mod_cast (a i).prop
            contrapose! h₇
            linarith
          exact h₈
        have h₆ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 :=
          by
          have h₇ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ 0 :=
            by
            have h₈ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ ∑ x in Finset.range n, ((a x : ℝ) - 1) :=
              by
              apply Finset.sum_le_sum
              intro i hi
              have h₉ : (a i : ℝ) > 0 := h₅' i hi
              have h₁₀ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1 :=
                by
                have h₁₁ : Real.log ((a i : ℝ)) ≤ (a i : ℝ) - 1 := by linarith [Real.log_le_sub_one_of_pos h₉]
                exact h₁₁
              exact h₁₀
            have h₉ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n := by
              calc
                ∑ x in Finset.range n, ((a x : ℝ) - 1) = ∑ x in Finset.range n, ((a x : ℝ) - 1) := rfl
                _ = (∑ x in Finset.range n, (a x : ℝ)) - ∑ x in Finset.range n, (1 : ℝ) := by rw [Finset.sum_sub_distrib]
                _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp [Finset.sum_const, Finset.card_range] <;> ring
                _ = (∑ x in Finset.range n, (a x : ℝ)) - n := by simp
            have h₁₀ : ∑ x in Finset.range n, ((a x : ℝ) - 1) = (∑ x in Finset.range n, (a x : ℝ)) - n := h₉
            have h₁₁ : ∑ x in Finset.range n, Real.log ((a x : ℝ)) ≤ (∑ x in Finset.range n, (a x : ℝ)) - n := by linarith
            have h₁₂ : (∑ x in Finset.range n, (a x : ℝ)) - n = 0 := by rw [h₂] <;> ring <;> field_simp [h₃] <;> linarith
            linarith
          have h₈ : Real.log (∏ x in Finset.range n, (a x : ℝ)) ≤ 0 := by
            calc
              Real.log (∏ x in Finset.range n, (a x : ℝ)) = ∑ x in Finset.range n, Real.log ((a x : ℝ)) := by
                rw [Real.log_prod _ _ fun i hi => by
                    have h₉ : (a i : ℝ) > 0 := h₅' i hi
                    positivity]
              _ ≤ 0 := h₇
          have h₉ : (∏ x in Finset.range n, (a x : ℝ)) ≤ 1 :=
            by
            by_contra h
            have h₁₀ : (∏ x in Finset.range n, (a x : ℝ)) > 1 := by linarith
            have h₁₁ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0 :=
              by
              have h₁₂ : Real.log (∏ x in Finset.range n, (a x : ℝ)) > 0 :=
                by
                apply Real.log_pos
                exact by
                  have h₁₃ : (∏ x in Finset.range n, (a x : ℝ)) > 1 := h₁₀
                  linarith
              linarith
            linarith
          exact h₉
        exact h₆
    hole
  have h₂ : (∏ x in Finset.range n, a x) ≤ 1:=
    by
    have h₃ : (∏ x in Finset.range n, a x : ℝ) ≤ 1:= by -- exact h₁
      simpa
    have h₄ : (∏ x in Finset.range n, a x : ℝ) = (∏ x in Finset.range n, a x : ℝ) := rfl
    have h₅ : (∏ x in Finset.range n, a x : ℝ) = (∏ x in Finset.range n, (a x : ℝ)):= by -- simp
      norm_num
    have h₆ : (∏ x in Finset.range n, a x : ℝ) ≤ 1:= by -- simpa [h₅] using h₁
      simpa
    have h₇ : (∏ x in Finset.range n, a x : NNReal) ≤ 1:= by
      --  norm_cast at h₆ ⊢ <;> simp_all [Finset.prod_range_succ] <;> norm_num <;> linarith
      simpa
    --  simpa using h₇
    simpa
  --  exact h₂
  simpa