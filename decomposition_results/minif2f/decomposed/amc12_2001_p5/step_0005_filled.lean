theorem h₁ (h_main : 2 ^ 5000 * 5000! ∣ 10000!) : {x ∈ Finset.range 10000 | ¬Even x}.prod id = 10000! / (2 ^ 5000 * 5000!) :=
  by
  --  rw [show
  --      Finset.filter (fun x => ¬Even x) (Finset.range 10000) = Finset.filter (fun x => x % 2 = 1) (Finset.range 10000)
  --      by
  --      congr
  --      ext x
  --      simp [Nat.even_iff, Nat.mod_eq_zero_of_dvd] <;> (try omega) <;>
  --          (try {cases' mod_two_eq_zero_or_one x with h h <;> simp [h, Nat.even_iff, Nat.dvd_iff_mod_eq_zero] <;> omega
  --            }) <;>
  --        (try omega)]
  --  rfl
  hole