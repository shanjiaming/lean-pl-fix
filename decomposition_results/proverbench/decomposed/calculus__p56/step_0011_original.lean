theorem h₅ (h_max : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry) (h₂ : Continuous fun x => x / 2) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * (fun x => x / 2) x - x * (fun x => x / 2) x ^ 2 =
    ∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4 :=
  by
  congr
  funext x
  ring_nf