theorem specificElementSumDifference :
  matrixM 0 0 + matrixM 1 1 + matrixM 2 2 - matrixM 3 0 - matrixM 3 1 - matrixM 3 2 = 119:=
  by
  have h₀ : matrixM 0 0 = (37 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₁ : matrixM 1 1 = (1 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₂ : matrixM 2 2 = (-24 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₃ : matrixM 3 0 = (-62 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₄ : matrixM 3 1 = (-3 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₅ : matrixM 3 2 = (-40 : ℝ):= by
    --  --  norm_num [matrixM, Matrix.cons_val_zero, Matrix.cons_val_one, Matrix.head_cons, Matrix.cons_val_two] <;> rfl
    hole
  have h₆ : matrixM 0 0 + matrixM 1 1 + matrixM 2 2 - matrixM 3 0 - matrixM 3 1 - matrixM 3 2 = 119:= by
    --  rw [h₀, h₁, h₂, h₃, h₄, h₅] <;> norm_num <;> rfl
    hole
  --  exact h₆
  hole