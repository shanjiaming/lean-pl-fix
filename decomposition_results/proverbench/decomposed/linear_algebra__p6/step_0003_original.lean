theorem h₂ (R : Type ?u.463) (inst✝ : CommRing R) (hrank_A : A.rank = 3) (h₁ : A.mulVec ![1, 0, 1] = b1) : A.mulVec ![1, 1, 2] = b2 := by
  ext i
  fin_cases i <;>
        simp [Matrix.mulVec, Matrix.dotProduct, Fin.sum_univ_succ, A, b2, Fin.succAbove, Fin.succ_zero_eq_one,
          Fin.val_zero, Fin.val_succ] <;>
      norm_num <;>
    aesop