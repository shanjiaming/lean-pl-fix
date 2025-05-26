theorem putnam_2011_b4 (games : Fin 2011 → Fin 2011 → Bool) (T W : Matrix (Fin 2011) (Fin 2011) ℂ)
  (hT : T = (fun p1 p2 => ({g | games g p1 = games g p2}.ncard : ℂ)))
  (hW : W = (fun p1 p2 => ({g | games g p1 ∧ !games g p2}.ncard - {g | !games g p1 ∧ games g p2}.ncard : ℂ))) :
  ∃ n : ℕ, (T + Complex.I • W).det = n ∧ (2 ^ 2010) ∣ n:=
  by
  have h_main : ∃ (n : ℕ), (T + Complex.I • W).det = n ∧ (2 ^ 2010 ∣ n):=
    by
    --  use 0
    --  constructor
    --  --  · simp [hT, hW, Matrix.det_fin_one, Nat.cast_eq_zero] <;> aesop
    --  · simp [Nat.dvd_iff_mod_eq_zero]
    norm_num
  --  aesop
  norm_num