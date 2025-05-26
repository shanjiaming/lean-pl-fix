theorem putnam_2018_a3  : IsGreatest {x | ∃ x_1, ∃ (_ : ∑ i, cos (x_1 i) = 0), ∑ i, cos (3 * x_1 i) = x} (480 / 49) :=
  by
  have h_main :
    IsGreatest {∑ i, Real.cos (3 * x i) | (x : Fin 10 → ℝ) (hx : ∑ i, Real.cos (x i) = 0)} ((480 / 49) : ℝ) :=
    by
    constructor
    ·
      have h₁ : ∃ (x : Fin 10 → ℝ), (∑ i, Real.cos (x i) = 0) ∧ (∑ i, Real.cos (3 * x i) = (480 / 49 : ℝ)) :=
        by
        use fun i => if i.val < 3 then 0 else Real.arccos (-3 / 7)
        constructor
        ·
          calc
            ∑ i : Fin 10, Real.cos (if i.val < 3 then 0 else Real.arccos (-3 / 7)) =
                ∑ i : Fin 10, if i.val < 3 then Real.cos 0 else Real.cos (Real.arccos (-3 / 7)) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs <;> simp [*]
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (-3 / 7 : ℝ) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs with h
              · simp [Real.cos_zero]
              ·
                have h₁ : Real.cos (Real.arccos (-3 / 7)) = -3 / 7 := by rw [Real.cos_arccos] <;> norm_num
                rw [h₁]
            _ = (∑ i : Fin 10, if i.val < 3 then (1 : ℝ) else (-3 / 7 : ℝ)) := rfl
            _ = 0 := by norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] <;> decide
        ·
          calc
            ∑ i : Fin 10, Real.cos (3 * (if i.val < 3 then 0 else Real.arccos (-3 / 7))) =
                ∑ i : Fin 10, if i.val < 3 then Real.cos 0 else Real.cos (3 * Real.arccos (-3 / 7)) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs <;> simp [*] <;> ring_nf <;> simp [Real.cos_zero]
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs with h
              · simp [Real.cos_zero]
              · rfl
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ) := rfl
            _ = (480 / 49 : ℝ) :=
              by
              have h₂ : Real.cos (3 * Real.arccos (-3 / 7)) = (120 / 49 : ℝ) - (3 * (-3 / 7) : ℝ) :=
                by
                have h₃ :
                  Real.cos (3 * Real.arccos (-3 / 7)) =
                    4 * Real.cos (Real.arccos (-3 / 7)) ^ 3 - 3 * Real.cos (Real.arccos (-3 / 7)) :=
                  by
                  rw [show 3 * Real.arccos (-3 / 7) = 3 * Real.arccos (-3 / 7) by rfl]
                  rw [Real.cos_three_mul] <;> simp [Real.cos_arccos, pow_three] <;> ring_nf <;> norm_num
                rw [h₃]
                have h₄ : Real.cos (Real.arccos (-3 / 7)) = -3 / 7 := by rw [Real.cos_arccos] <;> norm_num
                rw [h₄] <;> ring_nf <;> norm_num
              calc
                ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else Real.cos (3 * Real.arccos (-3 / 7))) =
                    ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ)) :=
                  rfl
                _ = ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ)) := rfl
                _ = (480 / 49 : ℝ) := by
                  rw [Finset.sum_eq_multiset_sum]
                  norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, h₂] <;> decide
                _ = (480 / 49 : ℝ) := by rfl
      obtain ⟨x, hx₁, hx₂⟩ := h₁
      refine' Set.mem_setOf_eq.mpr ⟨x, hx₁, _⟩
      rw [hx₂] <;> norm_num
    · rintro y ⟨x, hx₁, rfl⟩
      have h₁ : ∑ i : Fin 10, Real.cos (3 * x i) ≤ (480 / 49 : ℝ) :=
        by
        have h₂ : ∑ i : Fin 10, Real.cos (3 * x i) = ∑ i : Fin 10, (4 * Real.cos (x i) ^ 3 - 3 * Real.cos (x i)) :=
          by
          apply Finset.sum_congr rfl
          intro i _
          rw [Real.cos_three_mul] <;> ring_nf <;> simp [Real.cos_sq] <;> ring_nf
        rw [h₂]
        have h₃ :
          ∑ i : Fin 10, (4 * Real.cos (x i) ^ 3 - 3 * Real.cos (x i)) =
            4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 - 3 * ∑ i : Fin 10, Real.cos (x i) :=
          by simp [Finset.mul_sum, Finset.sum_sub_distrib] <;> ring_nf
        rw [h₃]
        have h₄ : ∑ i : Fin 10, Real.cos (x i) = 0 := hx₁
        rw [h₄]
        have h₅ : 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 - 3 * (0 : ℝ) = 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 := by
          ring_nf
        rw [h₅]
        have h₆ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) :=
          by
          have h₇ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) :=
            by
            have h₈ : ∀ i : Fin 10, Real.cos (x i) ∈ Set.Icc (-1 : ℝ) 1 :=
              by
              intro i
              exact ⟨Real.neg_one_le_cos (x i), Real.cos_le_one (x i)⟩
            have h₉ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) := by
              norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] at hx₁ ⊢ <;>
                nlinarith [Real.cos_le_one (x 0), Real.cos_le_one (x 1), Real.cos_le_one (x 2), Real.cos_le_one (x 3),
                  Real.cos_le_one (x 4), Real.cos_le_one (x 5), Real.cos_le_one (x 6), Real.cos_le_one (x 7),
                  Real.cos_le_one (x 8), Real.cos_le_one (x 9), Real.neg_one_le_cos (x 0), Real.neg_one_le_cos (x 1),
                  Real.neg_one_le_cos (x 2), Real.neg_one_le_cos (x 3), Real.neg_one_le_cos (x 4),
                  Real.neg_one_le_cos (x 5), Real.neg_one_le_cos (x 6), Real.neg_one_le_cos (x 7),
                  Real.neg_one_le_cos (x 8), Real.neg_one_le_cos (x 9), sq_nonneg (Real.cos (x 0) - 1),
                  sq_nonneg (Real.cos (x 1) - 1), sq_nonneg (Real.cos (x 2) - 1), sq_nonneg (Real.cos (x 3) - 1),
                  sq_nonneg (Real.cos (x 4) - 1), sq_nonneg (Real.cos (x 5) - 1), sq_nonneg (Real.cos (x 6) - 1),
                  sq_nonneg (Real.cos (x 7) - 1), sq_nonneg (Real.cos (x 8) - 1), sq_nonneg (Real.cos (x 9) - 1),
                  sq_nonneg (Real.cos (x 0) + 1), sq_nonneg (Real.cos (x 1) + 1), sq_nonneg (Real.cos (x 2) + 1),
                  sq_nonneg (Real.cos (x 3) + 1), sq_nonneg (Real.cos (x 4) + 1), sq_nonneg (Real.cos (x 5) + 1),
                  sq_nonneg (Real.cos (x 6) + 1), sq_nonneg (Real.cos (x 7) + 1), sq_nonneg (Real.cos (x 8) + 1),
                  sq_nonneg (Real.cos (x 9) + 1)]
            exact h₉
          exact h₇
        have h₇ : 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ 4 * (120 / 49 : ℝ) := by linarith
        linarith
      exact h₁
  have h_main : IsGreatest {∑ i, Real.cos (3 * x i) | (x : Fin 10 → ℝ) (hx : ∑ i, Real.cos (x i) = 0)} ((480 / 49) : ℝ) := by sorry
have putnam_2018_a3 :
  IsGreatest {∑ i, Real.cos (3 * x i) | (x : Fin 10 → ℝ) (hx : ∑ i, Real.cos (x i) = 0)} ((480 / 49) : ℝ) :=
  by
  have h_main :
    IsGreatest {∑ i, Real.cos (3 * x i) | (x : Fin 10 → ℝ) (hx : ∑ i, Real.cos (x i) = 0)} ((480 / 49) : ℝ) :=
    by
    constructor
    ·
      have h₁ : ∃ (x : Fin 10 → ℝ), (∑ i, Real.cos (x i) = 0) ∧ (∑ i, Real.cos (3 * x i) = (480 / 49 : ℝ)) :=
        by
        use fun i => if i.val < 3 then 0 else Real.arccos (-3 / 7)
        constructor
        ·
          calc
            ∑ i : Fin 10, Real.cos (if i.val < 3 then 0 else Real.arccos (-3 / 7)) =
                ∑ i : Fin 10, if i.val < 3 then Real.cos 0 else Real.cos (Real.arccos (-3 / 7)) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs <;> simp [*]
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (-3 / 7 : ℝ) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs with h
              · simp [Real.cos_zero]
              ·
                have h₁ : Real.cos (Real.arccos (-3 / 7)) = -3 / 7 := by rw [Real.cos_arccos] <;> norm_num
                rw [h₁]
            _ = (∑ i : Fin 10, if i.val < 3 then (1 : ℝ) else (-3 / 7 : ℝ)) := rfl
            _ = 0 := by norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] <;> decide
        ·
          calc
            ∑ i : Fin 10, Real.cos (3 * (if i.val < 3 then 0 else Real.arccos (-3 / 7))) =
                ∑ i : Fin 10, if i.val < 3 then Real.cos 0 else Real.cos (3 * Real.arccos (-3 / 7)) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs <;> simp [*] <;> ring_nf <;> simp [Real.cos_zero]
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ) :=
              by
              apply Finset.sum_congr rfl
              intro i _
              split_ifs with h
              · simp [Real.cos_zero]
              · rfl
            _ = ∑ i : Fin 10, if i.val < 3 then 1 else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ) := rfl
            _ = (480 / 49 : ℝ) :=
              by
              have h₂ : Real.cos (3 * Real.arccos (-3 / 7)) = (120 / 49 : ℝ) - (3 * (-3 / 7) : ℝ) :=
                by
                have h₃ :
                  Real.cos (3 * Real.arccos (-3 / 7)) =
                    4 * Real.cos (Real.arccos (-3 / 7)) ^ 3 - 3 * Real.cos (Real.arccos (-3 / 7)) :=
                  by
                  rw [show 3 * Real.arccos (-3 / 7) = 3 * Real.arccos (-3 / 7) by rfl]
                  rw [Real.cos_three_mul] <;> simp [Real.cos_arccos, pow_three] <;> ring_nf <;> norm_num
                rw [h₃]
                have h₄ : Real.cos (Real.arccos (-3 / 7)) = -3 / 7 := by rw [Real.cos_arccos] <;> norm_num
                rw [h₄] <;> ring_nf <;> norm_num
              calc
                ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else Real.cos (3 * Real.arccos (-3 / 7))) =
                    ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ)) :=
                  rfl
                _ = ∑ i : Fin 10, (if i.val < 3 then (1 : ℝ) else (Real.cos (3 * Real.arccos (-3 / 7)) : ℝ)) := rfl
                _ = (480 / 49 : ℝ) := by
                  rw [Finset.sum_eq_multiset_sum]
                  norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ, h₂] <;> decide
                _ = (480 / 49 : ℝ) := by rfl
      obtain ⟨x, hx₁, hx₂⟩ := h₁
      refine' Set.mem_setOf_eq.mpr ⟨x, hx₁, _⟩
      rw [hx₂] <;> norm_num
    · rintro y ⟨x, hx₁, rfl⟩
      have h₁ : ∑ i : Fin 10, Real.cos (3 * x i) ≤ (480 / 49 : ℝ) :=
        by
        have h₂ : ∑ i : Fin 10, Real.cos (3 * x i) = ∑ i : Fin 10, (4 * Real.cos (x i) ^ 3 - 3 * Real.cos (x i)) :=
          by
          apply Finset.sum_congr rfl
          intro i _
          rw [Real.cos_three_mul] <;> ring_nf <;> simp [Real.cos_sq] <;> ring_nf
        rw [h₂]
        have h₃ :
          ∑ i : Fin 10, (4 * Real.cos (x i) ^ 3 - 3 * Real.cos (x i)) =
            4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 - 3 * ∑ i : Fin 10, Real.cos (x i) :=
          by simp [Finset.mul_sum, Finset.sum_sub_distrib] <;> ring_nf
        rw [h₃]
        have h₄ : ∑ i : Fin 10, Real.cos (x i) = 0 := hx₁
        rw [h₄]
        have h₅ : 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 - 3 * (0 : ℝ) = 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 := by
          ring_nf
        rw [h₅]
        have h₆ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) :=
          by
          have h₇ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) :=
            by
            have h₈ : ∀ i : Fin 10, Real.cos (x i) ∈ Set.Icc (-1 : ℝ) 1 :=
              by
              intro i
              exact ⟨Real.neg_one_le_cos (x i), Real.cos_le_one (x i)⟩
            have h₉ : ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ (120 / 49 : ℝ) := by
              norm_num [Fin.sum_univ_succ, Fin.val_zero, Fin.val_succ] at hx₁ ⊢ <;>
                nlinarith [Real.cos_le_one (x 0), Real.cos_le_one (x 1), Real.cos_le_one (x 2), Real.cos_le_one (x 3),
                  Real.cos_le_one (x 4), Real.cos_le_one (x 5), Real.cos_le_one (x 6), Real.cos_le_one (x 7),
                  Real.cos_le_one (x 8), Real.cos_le_one (x 9), Real.neg_one_le_cos (x 0), Real.neg_one_le_cos (x 1),
                  Real.neg_one_le_cos (x 2), Real.neg_one_le_cos (x 3), Real.neg_one_le_cos (x 4),
                  Real.neg_one_le_cos (x 5), Real.neg_one_le_cos (x 6), Real.neg_one_le_cos (x 7),
                  Real.neg_one_le_cos (x 8), Real.neg_one_le_cos (x 9), sq_nonneg (Real.cos (x 0) - 1),
                  sq_nonneg (Real.cos (x 1) - 1), sq_nonneg (Real.cos (x 2) - 1), sq_nonneg (Real.cos (x 3) - 1),
                  sq_nonneg (Real.cos (x 4) - 1), sq_nonneg (Real.cos (x 5) - 1), sq_nonneg (Real.cos (x 6) - 1),
                  sq_nonneg (Real.cos (x 7) - 1), sq_nonneg (Real.cos (x 8) - 1), sq_nonneg (Real.cos (x 9) - 1),
                  sq_nonneg (Real.cos (x 0) + 1), sq_nonneg (Real.cos (x 1) + 1), sq_nonneg (Real.cos (x 2) + 1),
                  sq_nonneg (Real.cos (x 3) + 1), sq_nonneg (Real.cos (x 4) + 1), sq_nonneg (Real.cos (x 5) + 1),
                  sq_nonneg (Real.cos (x 6) + 1), sq_nonneg (Real.cos (x 7) + 1), sq_nonneg (Real.cos (x 8) + 1),
                  sq_nonneg (Real.cos (x 9) + 1)]
            exact h₉
          exact h₇
        have h₇ : 4 * ∑ i : Fin 10, Real.cos (x i) ^ 3 ≤ 4 * (120 / 49 : ℝ) := by linarith
        linarith
      exact h₁
  exact h_main
  hole