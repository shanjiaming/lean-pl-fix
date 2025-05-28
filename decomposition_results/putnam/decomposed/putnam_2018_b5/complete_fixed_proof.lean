theorem putnam_2018_b5 (f : (Fin 2 → ℝ) → (Fin 2 → ℝ)) (h₁ : ContDiff ℝ 1 f)
  (h₂ : ∀ x i j, 0 < fderiv ℝ f x (Pi.single i 1) j)
  (h₃ :
    ∀ x,
      0 <
        fderiv ℝ f x ![1, 0] 0 * fderiv ℝ f x ![0, 1] 1 -
          (1 / 4) * (fderiv ℝ f x ![1, 0] 1 + fderiv ℝ f x ![0, 1] 0) ^ 2) :
  Injective f:=
  by
  have h_det_pos :
    ∀ (x : Fin 2 → ℝ),
      fderiv ℝ f x ![1, 0] 0 * fderiv ℝ f x ![0, 1] 1 - fderiv ℝ f x ![1, 0] 1 * fderiv ℝ f x ![0, 1] 0 > 0 := by sorry
  have h_fderiv_injective : ∀ (x : Fin 2 → ℝ), Function.Injective (fderiv ℝ f x):=
    by
    --  intro x
    have h₄ : fderiv ℝ f x ![1, 0] 0 * fderiv ℝ f x ![0, 1] 1 - fderiv ℝ f x ![1, 0] 1 * fderiv ℝ f x ![0, 1] 0 > 0 :=
      h_det_pos x
    have h₅ : 0 < fderiv ℝ f x ![1, 0] 0 := h₂ x 0 0
    have h₆ : 0 < fderiv ℝ f x ![1, 0] 1 := h₂ x 0 1
    have h₇ : 0 < fderiv ℝ f x ![0, 1] 0 := h₂ x 1 0
    have h₈ : 0 < fderiv ℝ f x ![0, 1] 1 := h₂ x 1 1
    have h₉ : Function.Injective (fderiv ℝ f x):=
      by
      have h₁₀ : ∀ (v : Fin 2 → ℝ), fderiv ℝ f x v = 0 → v = 0:=
        by
        --  intro v hv
        have h₁₁ : fderiv ℝ f x v = 0 := hv
        have h₁₂ : fderiv ℝ f x v = (fderiv ℝ f x) v := rfl
        --  rw [h₁₂] at h₁₁
        have h₁₃ : (fderiv ℝ f x) v = 0 := h₁₁
        have h₁₄ : v 0 = 0:=
          by
          have h₁₅ : fderiv ℝ f x v 0 = 0:= by -- simp_all [ContinuousLinearMap.ext_iff]
            hole
          have h₁₆ : fderiv ℝ f x v 0 = fderiv ℝ f x ![1, 0] 0 * v 0 + fderiv ℝ f x ![0, 1] 0 * v 1:=
            by
            have h₁₇ : v = v 0 • ![1, 0] + v 1 • ![0, 1]:= by
              --  ext i
              --  --  fin_cases i <;> simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;> ring_nf <;>
                  simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                linarith
              hole
            --  rw [h₁₇]
            --  simp [ContinuousLinearMap.map_add, ContinuousLinearMap.map_smul, fderiv_apply] <;>
            --          simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  ring_nf <;>
                simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
              linarith
            hole
          have h₁₈ : fderiv ℝ f x ![1, 0] 0 * v 0 + fderiv ℝ f x ![0, 1] 0 * v 1 = 0:= by -- linarith
            linarith
          have h₁₉ : fderiv ℝ f x v 1 = 0:= by -- simp_all [ContinuousLinearMap.ext_iff]
            hole
          have h₂₀ : fderiv ℝ f x v 1 = fderiv ℝ f x ![1, 0] 1 * v 0 + fderiv ℝ f x ![0, 1] 1 * v 1:=
            by
            have h₂₁ : v = v 0 • ![1, 0] + v 1 • ![0, 1]:= by
              --  ext i
              --  --  fin_cases i <;> simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;> ring_nf <;>
                  simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                linarith
              hole
            --  rw [h₂₁]
            --  simp [ContinuousLinearMap.map_add, ContinuousLinearMap.map_smul, fderiv_apply] <;>
            --          simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  ring_nf <;>
                simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
              linarith
            hole
          have h₂₁ : fderiv ℝ f x ![1, 0] 1 * v 0 + fderiv ℝ f x ![0, 1] 1 * v 1 = 0:= by -- linarith
            linarith
          have h₂₂ : fderiv ℝ f x ![1, 0] 0 * v 0 + fderiv ℝ f x ![0, 1] 0 * v 1 = 0:= by -- linarith
            linarith
          have h₂₃ : v 0 = 0:= by -- nlinarith [h₄, h₅, h₆, h₇, h₈, h₁₈, h₂₁]
            nlinarith
          --  exact h₂₃
          linarith
        have h₂₄ : v 1 = 0:=
          by
          have h₂₅ : fderiv ℝ f x v 1 = 0:= by -- simp_all [ContinuousLinearMap.ext_iff]
            hole
          have h₂₆ : fderiv ℝ f x v 1 = fderiv ℝ f x ![1, 0] 1 * v 0 + fderiv ℝ f x ![0, 1] 1 * v 1:=
            by
            have h₂₇ : v = v 0 • ![1, 0] + v 1 • ![0, 1]:= by
              --  ext i
              --  --  fin_cases i <;> simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;> ring_nf <;>
                  simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                linarith
              hole
            --  rw [h₂₇]
            --  simp [ContinuousLinearMap.map_add, ContinuousLinearMap.map_smul, fderiv_apply] <;>
            --          simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  ring_nf <;>
                simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
              linarith
            hole
          have h₂₇ : fderiv ℝ f x ![1, 0] 1 * v 0 + fderiv ℝ f x ![0, 1] 1 * v 1 = 0:= by -- linarith
            linarith
          have h₂₈ : fderiv ℝ f x ![1, 0] 0 * v 0 + fderiv ℝ f x ![0, 1] 0 * v 1 = 0:=
            by
            have h₂₉ : fderiv ℝ f x v 0 = 0:= by -- simp_all [ContinuousLinearMap.ext_iff]
              hole
            have h₃₀ : fderiv ℝ f x v 0 = fderiv ℝ f x ![1, 0] 0 * v 0 + fderiv ℝ f x ![0, 1] 0 * v 1:=
              by
              have h₃₁ : v = v 0 • ![1, 0] + v 1 • ![0, 1]:= by
                --  ext i
                --  --  fin_cases i <;> simp [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;> ring_nf <;>
                    simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  linarith
                hole
              --  rw [h₃₁]
              --  simp [ContinuousLinearMap.map_add, ContinuousLinearMap.map_smul, fderiv_apply] <;>
              --          simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                    ring_nf <;>
                  simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                linarith
              hole
            --  linarith
            linarith
          have h₃₁ : v 1 = 0:= by
            have h₃₂ : v 0 = 0 := h₁₄
            --  simp [h₃₂] at h₂₇ h₂₈
            --  nlinarith [h₄, h₅, h₆, h₇, h₈]
            nlinarith
          --  exact h₃₁
          linarith
        have h₃₂ : v = 0:= by
          --  ext i
          --  --  fin_cases i <;> simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;> linarith
          hole
        --  exact h₃₂
        hole
      have h₁₁ : Function.Injective (fderiv ℝ f x) :=
        by
        rw [Function.Injective]
        intro a b h₁₂
        have h₁₃ : fderiv ℝ f x (a - b) = 0 :=
          by
          have h₁₄ : fderiv ℝ f x (a - b) = fderiv ℝ f x a - fderiv ℝ f x b := by apply ContinuousLinearMap.map_sub
          rw [h₁₄]
          simp [h₁₂] <;> simp_all [ContinuousLinearMap.ext_iff] <;> linarith
        have h₁₄ : a - b = 0 := h₁₀ (a - b) h₁₃
        have h₁₅ : a = b := by
          have h₁₆ : a - b = 0 := h₁₄
          have h₁₇ : a = b :=
            by
            have h₁₈ : a = b := by
              have h₁₉ : a - b = 0 := h₁₄
              have h₂₀ : a = b := by
                simp [sub_eq_zero] at h₁₉ ⊢ <;>
                    simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  linarith
              exact h₂₀
            exact h₁₈
          exact h₁₇
        exact h₁₅
      have h₁₁ : Function.Injective (fderiv ℝ f x):= by
        --  rw [Function.Injective]
        --  intro a b h₁₂
        have h₁₃ : fderiv ℝ f x (a - b) = 0:=
          by
          have h₁₄ : fderiv ℝ f x (a - b) = fderiv ℝ f x a - fderiv ℝ f x b:= by -- apply ContinuousLinearMap.map_sub
            norm_num
          --  rw [h₁₄]
          --  simp [h₁₂] <;> simp_all [ContinuousLinearMap.ext_iff] <;> linarith
          hole
        have h₁₄ : a - b = 0 := h₁₀ (a - b) h₁₃
        have h₁₅ : a = b:= by
          have h₁₆ : a - b = 0 := h₁₄
          have h₁₇ : a = b:=
            by
            have h₁₈ : a = b:= by
              have h₁₉ : a - b = 0 := h₁₄
              have h₂₀ : a = b:= by
                --  simp [sub_eq_zero] at h₁₉ ⊢ <;>
                --      simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  linarith
                hole
              --  exact h₂₀
              simpa
            --  exact h₁₈
            simpa
          --  exact h₁₇
          simpa
        --  exact h₁₅
        hole
    have h₉ : Function.Injective (fderiv ℝ f x) :=
      by
      have h₁₀ : ∀ (v : Fin 2 → ℝ), fderiv ℝ f x v = 0 → v = 0 := by sorry
      have h₁₁ : Function.Injective (fderiv ℝ f x) :=
        by
        rw [Function.Injective]
        intro a b h₁₂
        have h₁₃ : fderiv ℝ f x (a - b) = 0 :=
          by
          have h₁₄ : fderiv ℝ f x (a - b) = fderiv ℝ f x a - fderiv ℝ f x b := by apply ContinuousLinearMap.map_sub
          rw [h₁₄]
          simp [h₁₂] <;> simp_all [ContinuousLinearMap.ext_iff] <;> linarith
        have h₁₄ : a - b = 0 := h₁₀ (a - b) h₁₃
        have h₁₅ : a = b := by
          have h₁₆ : a - b = 0 := h₁₄
          have h₁₇ : a = b :=
            by
            have h₁₈ : a = b := by
              have h₁₉ : a - b = 0 := h₁₄
              have h₂₀ : a = b := by
                simp [sub_eq_zero] at h₁₉ ⊢ <;>
                    simp_all [Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Fin.sum_univ_succ] <;>
                  linarith
              exact h₂₀
            exact h₁₈
          exact h₁₇
        exact h₁₅
      exact h₁₁
      hole
    --  exact h₉
    hole
  have h_injective : Injective f :=
    by
    have h₄ : ∀ (x y : Fin 2 → ℝ), f x = f y → x = y :=
      by
      intro x y hxy
      have h₅ : x = y := by
        by_contra h₅
        have h₆ : x ≠ y := h₅
        have h₇ : f x = f y := hxy
        have h₈ : ∀ (t : ℝ), t ∈ Set.Icc (0 : ℝ) 1 → ContDiffOn ℝ 1 (fun t : ℝ => f (t • (x - y) + y)) (Set.Icc 0 1) :=
          by
          intro t ht
          have h₉ : ContDiffOn ℝ 1 (fun t : ℝ => f (t • (x - y) + y)) (Set.Icc 0 1) := by
            apply
              h₁.contDiffOn.comp (contDiffOn_fst.smul (contDiffOn_const.sub contDiffOn_const) |>.add contDiffOn_const)
                (by
                  intro t ht
                  simp_all [Set.mem_Icc] <;> aesop)
          exact h₉
        have h₉ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 :=
          by
          have h₁₀ : ContinuousOn (fun t : ℝ => f (t • (x - y) + y)) (Set.Icc 0 1) :=
            by
            apply
              (h₁.continuous.continuousOn).comp
                (continuousOn_id.smul (continuousOn_const.sub continuousOn_const) |>.add continuousOn_const)
            intro t ht
            simp_all [Set.mem_Icc] <;> aesop
          have h₁₁ : DifferentiableOn ℝ (fun t : ℝ => f (t • (x - y) + y)) (Set.Ioo 0 1) :=
            by
            have h₁₂ : DifferentiableOn ℝ (fun t : ℝ => f (t • (x - y) + y)) (Set.Ioo 0 1) :=
              by
              apply
                DifferentiableOn.comp (h₁.differentiable le_rfl |>.differentiableOn)
                  (differentiableOn_id.smul (differentiableOn_const _ |>.sub (differentiableOn_const _)) |>.add
                    (differentiableOn_const _))
              intro t ht
              simp_all [Set.mem_Ioo] <;> aesop
            exact h₁₂
          have h₁₂ : (fun t : ℝ => f (t • (x - y) + y)) 0 = (fun t : ℝ => f (t • (x - y) + y)) 1 := by
            simp_all [h₇] <;> aesop
          have h₁₃ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 :=
            by
            have h₁₄ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 :=
              by
              have h₁₅ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 :=
                by
                have h₁₆ : ContinuousOn (fun t : ℝ => f (t • (x - y) + y)) (Set.Icc 0 1) := h₁₀
                have h₁₇ : DifferentiableOn ℝ (fun t : ℝ => f (t • (x - y) + y)) (Set.Ioo 0 1) := h₁₁
                have h₁₈ : (fun t : ℝ => f (t • (x - y) + y)) 0 = (fun t : ℝ => f (t • (x - y) + y)) 1 := h₁₂
                have h₁₉ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 :=
                  by
                  have h₂₀ : ∃ (t : ℝ), t ∈ Set.Ioo (0 : ℝ) 1 ∧ fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 := by
                    apply exists_deriv_eq_zero _ _ _ <;> simp_all [h₁₈, h₁₀, h₁₁] <;> (try norm_num) <;> (try aesop) <;>
                        (try linarith) <;>
                      (try nlinarith)
                  exact h₂₀
                exact h₁₉
              exact h₁₅
            exact h₁₄
          exact h₁₃
        obtain ⟨t, ht, ht'⟩ := h₉
        have h₁₀ : fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t = 0 := ht'
        have h₁₁ :
          fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t =
            fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)) :=
          by
          have h₁₂ :
            HasFDerivAt (fun t : ℝ => f (t • (x - y) + y))
              (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) t :=
            by
            have h₁₃ :
              HasFDerivAt (fun t : ℝ => t • (x - y) + y) ((ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) t :=
              by
              have h₁₄ :
                HasFDerivAt (fun t : ℝ => t • (x - y) + y) ((ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)))
                  t :=
                by simpa using ((hasFDerivAt_id t).smul (hasFDerivAt_const t (x - y))).add_const y
              exact h₁₄
            have h₁₅ : HasFDerivAt f (fderiv ℝ f (t • (x - y) + y)) (t • (x - y) + y) :=
              by
              have h₁₆ : HasFDerivAt f (fderiv ℝ f (t • (x - y) + y)) (t • (x - y) + y) :=
                by
                apply DifferentiableAt.hasFDerivAt
                exact h₁.differentiable le_rfl |>.differentiableAt
              exact h₁₆
            have h₁₇ :
              HasFDerivAt (fun t : ℝ => f (t • (x - y) + y))
                (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) t :=
              by
              have h₁₈ :
                HasFDerivAt (fun t : ℝ => f (t • (x - y) + y))
                  (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) t :=
                by apply h₁₅.comp t h₁₃
              exact h₁₈
            exact h₁₇
          have h₁₉ :
            fderiv ℝ (fun t : ℝ => f (t • (x - y) + y)) t =
              fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)) :=
            by
            apply HasFDerivAt.fderiv
            exact h₁₂
          exact h₁₉
        rw [h₁₁] at h₁₀
        have h₁₂ : (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) = 0 := by
          simpa using h₁₀
        have h₁₃ : x - y ≠ 0 := by
          intro h
          apply h₆
          ext i
          fin_cases i <;> simp_all [sub_eq_zero, Pi.one_apply, Pi.zero_apply] <;> aesop
        have h₁₄ : Function.Injective (fderiv ℝ f (t • (x - y) + y)) := h_fderiv_injective (t • (x - y) + y)
        have h₁₅ : (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) = 0 := h₁₂
        have h₁₆ : (x - y : Fin 2 → ℝ) = 0 :=
          by
          have h₁₇ : (x - y : Fin 2 → ℝ) = 0 :=
            by
            have h₁₈ : (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) = 0 :=
              h₁₅
            have h₁₉ : Function.Injective (fderiv ℝ f (t • (x - y) + y)) := h_fderiv_injective (t • (x - y) + y)
            have h₂₀ : (x - y : Fin 2 → ℝ) = 0 := by
              by_contra h₂₀
              have h₂₁ : (x - y : Fin 2 → ℝ) ≠ 0 := h₂₀
              have h₂₂ : (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)) ≠ 0 :=
                by
                intro h₂₃
                have h₂₄ : (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)) = 0 := h₂₃
                have h₂₅ : (x - y : Fin 2 → ℝ) = 0 := by
                  have h₂₆ := h₂₄
                  simp [ContinuousLinearMap.smulRight_apply, ContinuousLinearMap.one_apply, Pi.one_apply,
                              Pi.zero_apply] at h₂₆ <;>
                            (try aesop) <;>
                          (try simp_all [sub_eq_zero]) <;>
                        (try aesop) <;>
                      (try simp_all [sub_eq_zero]) <;>
                    (try aesop)
                contradiction
              have h₂₃ :
                (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) ≠ 0 :=
                by
                intro h₂₄
                have h₂₅ :
                  (fderiv ℝ f (t • (x - y) + y) ∘L (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y))) = 0 := h₂₄
                have h₂₆ : (ContinuousLinearMap.smulRight (1 : ℝ →L[ℝ] ℝ) (x - y)) = 0 :=
                  by
                  apply h₁₉
                  simp_all
                have h₂₇ : (x - y : Fin 2 → ℝ) = 0 := by
                  have h₂₈ := h₂₆
                  simp [ContinuousLinearMap.smulRight_apply, ContinuousLinearMap.one_apply, Pi.one_apply,
                              Pi.zero_apply] at h₂₈ <;>
                            (try aesop) <;>
                          (try simp_all [sub_eq_zero]) <;>
                        (try aesop) <;>
                      (try simp_all [sub_eq_zero]) <;>
                    (try aesop)
                contradiction
              contradiction
            exact h₂₀
          exact h₁₇
        have h₁₇ : x = y := by
          have h₁₈ : (x - y : Fin 2 → ℝ) = 0 := h₁₆
          have h₁₉ : x = y :=
            by
            have h₂₀ : x = y := by
              have h₂₁ : (x - y : Fin 2 → ℝ) = 0 := h₁₈
              have h₂₂ : x = y := by
                ext i
                fin_cases i <;> simp_all [sub_eq_zero, Pi.one_apply, Pi.zero_apply] <;> aesop
              exact h₂₂
            exact h₂₀
          exact h₁₉
        contradiction
      exact h₅
    exact h₄
  exact h_injective
  hole