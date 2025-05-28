theorem h₁ (ABCintcoords ABCintdists ABCall : EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → EuclideanSpace ℝ (Fin 2) → Prop) (hABCintcoords :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintcoords A B C ↔ ∀ (i : Fin 2), A i = ↑(round (A i)) ∧ B i = ↑(round (B i)) ∧ C i = ↑(round (C i))) (hABCintdists :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)),    ABCintdists A B C ↔ dist A B = ↑(round (dist A B)) ∧ dist A C = ↑(round (dist A C)) ∧ dist B C = ↑(round (dist B C))) (hABCall :  ∀ (A B C : EuclideanSpace ℝ (Fin 2)), ABCall A B C ↔ ¬Collinear ℝ {A, B, C} ∧ ABCintcoords A B C ∧ ABCintdists A B C) : ABCall ![0, 0] ![3, 0] ![0, 4] := by
  --  rw [hABCall]
  --  constructor
  --  · intro h
    have h₂ := h
  --    rw [collinear_iff_exists_forall_eq_smul_vsub] at h₂
    obtain ⟨b, v, hv⟩ := h₂
    have h₃ := hv (⟨0, by norm_num⟩ : (Fin 3))
    have h₄ := hv (⟨1, by norm_num⟩ : (Fin 3))
    have h₅ := hv (⟨2, by norm_num⟩ : (Fin 3))
    simp [Matrix.cons_val_zero, Matrix.cons_val_succ, Fin.ext_iff, Fin.val_zero, Fin.val_succ,
                EuclideanSpace.piLp._eq_2, norm_eq_abs, Real.norm_eq_abs, abs_mul, abs_of_nonneg,
                Real.sqrt_eq_iff_sq_eq, add_assoc] at h₃ h₄ h₅ <;>
              (try norm_num at h₃ h₄ h₅) <;>
            (try ring_nf at h₃ h₄ h₅) <;>
          (try field_simp at h₃ h₄ h₅) <;>
        (try norm_num at h₃ h₄ h₅) <;>
      (try nlinarith)
  --  · constructor
  --    · rw [hABCintcoords]
  --      intro i
  --  --  --      fin_cases i <;> simp [round_eq, Int.floor_eq_iff, Int.ceil_eq_iff] <;> norm_num
  --    · rw [hABCintdists]
  --      constructor
      ·
  --        norm_num [Real.dist_eq, abs_of_nonneg, pow_two, pow_one, EuclideanSpace.norm_eq, Finset.sum_range_succ,
  --                    round_eq, Int.floor_eq_iff, Int.ceil_eq_iff] <;>
  --                  (try norm_num) <;>
  --                (try ring_nf) <;>
  --              (try field_simp) <;>
  --            (try norm_num) <;>
  --          (try linarith)
  --      · constructor
        ·
  --          norm_num [Real.dist_eq, abs_of_nonneg, pow_two, pow_one, EuclideanSpace.norm_eq, Finset.sum_range_succ,
  --                      round_eq, Int.floor_eq_iff, Int.ceil_eq_iff] <;>
  --                    (try norm_num) <;>
  --                  (try ring_nf) <;>
  --                (try field_simp) <;>
  --              (try norm_num) <;>
  --            (try linarith)
        ·
  --          norm_num [Real.dist_eq, abs_of_nonneg, pow_two, pow_one, EuclideanSpace.norm_eq, Finset.sum_range_succ,
  --                      round_eq, Int.floor_eq_iff, Int.ceil_eq_iff] <;>
  --                    (try norm_num) <;>
  --                  (try ring_nf) <;>
  --                (try field_simp) <;>
  --              (try norm_num) <;>
  --            (try linarith)
  hole