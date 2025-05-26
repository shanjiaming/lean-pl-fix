theorem putnam_1990_a5 :
  ((False) : Prop) ↔ (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0):=
  by
  have h1 : False → (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0):=
    by
    --  intro h
    --  exfalso
    --  exact h
    norm_num
  have h2 : (∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0) → False:=
    by
    --  intro h
    have h3 : ∀ n ≥ 1, ∀ A B : Matrix (Fin n) (Fin n) ℝ, A * B * A * B = 0 → B * A * B * A = 0 := h
    have h4 : (∀ A B : Matrix (Fin 4) (Fin 4) ℝ, A * B * A * B = 0 → B * A * B * A = 0):=
      by
      have h5 : (4 : ℕ) ≥ 1:= by -- norm_num
        norm_num
      --  exact h3 4 h5
      hole
    have h6 : (∀ A B : Matrix (Fin 4) (Fin 4) ℝ, A * B * A * B = 0 → B * A * B * A = 0) := h4
    --  let A : Matrix (Fin 4) (Fin 4) ℝ := !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]
    --  let B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]
    have h7 : A * B * A * B = 0:= !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) (B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]) : A * B * A * B = 0 := by
      --  ext i j
      --  --  --  --  --  fin_cases i <;> fin_cases j <;> simp [Matrix.mul_apply, Fin.sum_univ_succ, A, B] <;> norm_num <;> rfl
      hole
    have h8 : B * A * B * A = 0 → False:= !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) (B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]) (h7 : A * B * A * B = 0) : B * A * B * A = 0 → False := by
      --  intro h9
      have h10 : (B * A * B * A) 0 0 = (0 : Matrix (Fin 4) (Fin 4) ℝ) 0 0:= !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) (B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]) (h7 : A * B * A * B = 0) (h9 : B * A * B * A = 0) : (B * A * B * A) 0 0 = 0 0 0 := by -- rw [h9]
        hole
      have h11 : (B * A * B * A) 0 0 = 0:= !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) (B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]) (h7 : A * B * A * B = 0) (h9 : B * A * B * A = 0) (h10 : (B * A * B * A) 0 0 = 0 0 0) : (B * A * B * A) 0 0 = 0 := by -- simpa using h10
        hole
      have h12 : (B * A * B * A) 0 0 = 1:= !![0, 1, 0, 0; 0, 0, 1, 0; 0, 0, 0, 0; 0, 0, 0, 0]) (B : Matrix (Fin 4) (Fin 4) ℝ := !![0, 0, 0, 0; 0, 0, 0, 0; 1, 0, 0, 0; 0, 1, 0, 0]) (h7 : A * B * A * B = 0) (h9 : B * A * B * A = 0) (h10 : (B * A * B * A) 0 0 = 0 0 0) (h11 : (B * A * B * A) 0 0 = 0) : (B * A * B * A) 0 0 = 1 := by
        --  calc
        --    (B * A * B * A) 0 0 = (B * A * B * A) 0 0 := rfl
        --    _ = 1 := by simp [Matrix.mul_apply, Fin.sum_univ_succ, A, B] <;> norm_num <;> rfl
        hole
      --  linarith
      linarith
    have h9 : B * A * B * A = 0 := h6 A B h7
    --  exact h8 h9
    hole
  --  apply Iff.intro h1 h2
  hole