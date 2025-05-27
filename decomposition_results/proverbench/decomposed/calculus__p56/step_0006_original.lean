theorem h1₃ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) (h1₂ : (fun x => x ^ 2 * f x - x * f x ^ 2) = fun x => x ^ 3 / 4 - x * (f x - x / 2) ^ 2) : ∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4 - x * (f x - x / 2) ^ 2 =
    (∫ (x : ℝ) in Set.Icc 0 1, x ^ 3 / 4) - ∫ (x : ℝ) in Set.Icc 0 1, x * (f x - x / 2) ^ 2 :=
  by
  rw [integral_sub] <;>
          (try {
              apply Continuous.integrableOn_Icc
              continuity
            }) <;>
        (try {
            apply Continuous.integrableOn_Icc
            continuity
          }) <;>
      (try {
          apply Continuous.integrableOn_Icc
          continuity
        }) <;>
    (try {
        apply Continuous.integrableOn_Icc
        continuity
      })