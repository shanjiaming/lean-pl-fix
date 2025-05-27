theorem h₁ (R : Type ?u.463) (inst✝ : CommRing R) (hrank_A : A.rank = 3) : A.mulVec ![1, 0, 1] = b1 := by
  ext i
  fin_cases i <;>
          simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b1, Fin.succAbove, Fin.succ_zero_eq_one,
            Fin.val_zero, Fin.val_succ] <;>
        norm_num <;>
      rfl <;>
    aesop
  hole