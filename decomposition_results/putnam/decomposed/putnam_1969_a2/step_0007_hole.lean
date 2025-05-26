theorem h₉ (D : (n : ℕ) → Matrix (Fin n) (Fin n) ℝ) (hD : D = fun n i j => |(↑(↑i : ℕ) : ℝ) - (↑(↑j : ℕ) : ℝ)|) (n : ℕ) (hn : n ≥ 2) (h₁ : D = fun n i j => |(↑(↑i : ℕ) : ℝ) - (↑(↑j : ℕ) : ℝ)|) (h₂ h₄ h₆ h₈ : n ≥ 2) : (Matrix.det fun i j => |(↑(↑i : ℕ) : ℝ) - (↑(↑j : ℕ) : ℝ)|) =
    (-1) ^ ((↑n : ℤ) - 1) * ((↑n : ℝ) - 1) * 2 ^ ((↑n : ℤ) - 2) :=
  by
  cases n with
  | zero => contradiction
  | succ n =>
    cases n with
    | zero => contradiction
    | succ n =>
      cases n with
      | zero =>
        norm_num [Fin.sum_univ_succ, Matrix.det_succ_row_zero, Fin.succAbove, Matrix.det_fin_two] <;>
                  simp_all [Fin.forall_fin_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons,
                    Fin.val_zero, Fin.val_succ, abs_mul, abs_of_nonneg, abs_of_nonpos, sub_nonneg, sub_nonpos] <;>
                norm_num <;>
              ring_nf <;>
            norm_num <;>
          linarith
      | succ n =>
        cases n with
        | zero =>
          norm_num [Fin.sum_univ_succ, Matrix.det_succ_row_zero, Fin.succAbove, Matrix.det_fin_three] <;>
                    simp_all [Fin.forall_fin_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons,
                      Fin.val_zero, Fin.val_succ, abs_mul, abs_of_nonneg, abs_of_nonpos, sub_nonneg, sub_nonpos] <;>
                  norm_num <;>
                ring_nf <;>
              norm_num <;>
            linarith
        | succ n =>
          cases n with
          | zero =>
            norm_num [Fin.sum_univ_succ, Matrix.det_succ_row_zero, Fin.succAbove, Matrix.det_succ_row_zero,
                        Matrix.det_fin_three] <;>
                      simp_all [Fin.forall_fin_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons,
                        Fin.val_zero, Fin.val_succ, abs_mul, abs_of_nonneg, abs_of_nonpos, sub_nonneg, sub_nonpos] <;>
                    norm_num <;>
                  ring_nf <;>
                norm_num <;>
              linarith
          | succ n =>
            simp_all [Fin.sum_univ_succ, Matrix.det_succ_row_zero, Fin.succAbove, Matrix.det_succ_row_zero,
                          Matrix.det_fin_three] <;>
                        norm_num [Fin.sum_univ_succ, Matrix.det_succ_row_zero, Fin.succAbove, Matrix.det_succ_row_zero,
                          Matrix.det_fin_three] <;>
                      simp_all [Fin.forall_fin_succ, Matrix.cons_val_zero, Matrix.cons_val_succ, Matrix.head_cons,
                        Fin.val_zero, Fin.val_succ, abs_mul, abs_of_nonneg, abs_of_nonpos, sub_nonneg, sub_nonpos] <;>
                    norm_num <;>
                  ring_nf <;>
                norm_num <;>
              linarith
  hole