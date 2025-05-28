theorem h₁  : ∃ x, ∑ i, Real.cos (x i) = 0 ∧ ∑ i, Real.cos (3 * x i) = 480 / 49 :=
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