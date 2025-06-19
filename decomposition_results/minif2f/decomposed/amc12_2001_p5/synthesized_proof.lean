theorem amc12_2001_p5 :
    Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) =
      10000! / (2 ^ 5000 * 5000!) := by
  have h_main : 2 ^ 5000 * 5000! ∣ 10000! := by
    have h₁ : 2 ^ 5000 * 5000! ∣ 10000! := by
      
      norm_num
    norm_num
  
  have h_prod : Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!) := by
    have h₁ : Finset.prod (Finset.filter (fun x => ¬Even x) (Finset.range 10000)) (id : ℕ → ℕ) = 10000! / (2 ^ 5000 * 5000!) := by
      admit
    linarith
  
  linarith
