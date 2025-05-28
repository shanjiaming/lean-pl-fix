theorem h_prod (h_main : 2 ^ 5000 * 5000! ∣ 10000!) : {x ∈ Finset.range 10000 | ¬Even x}.prod id = 10000! / (2 ^ 5000 * 5000!) :=
  by
  have h₁ :
    Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!) := by sorry
  --  exact h₁
  hole