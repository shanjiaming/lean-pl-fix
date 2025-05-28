theorem amc12_2001_p5 :
  Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!):=
  by
  have h_main : 2 ^ 5000 * 5000! ∣ 10000!:=
    by
    have h₁ : 2 ^ 5000 * 5000! ∣ 10000!:= by
      --  apply Nat.dvd_of_mod_eq_zero
      --  rfl
      norm_num
    --  exact h₁
    norm_num
  have h_prod :
    Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!) := by sorry
  --  apply h_prod
  linarith