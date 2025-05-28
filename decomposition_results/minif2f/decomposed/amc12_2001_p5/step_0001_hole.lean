theorem amc12_2001_p5  : {x ∈ Finset.range 10000 | ¬Even x}.prod id = 10000! / (2 ^ 5000 * 5000!) :=
  by
  have h_main : 2 ^ 5000 * 5000! ∣ 10000! := by sorry
  have h_prod :
    Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!) := by sorry
  --  apply h_prod
  hole