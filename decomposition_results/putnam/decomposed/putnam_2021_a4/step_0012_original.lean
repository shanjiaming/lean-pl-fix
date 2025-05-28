theorem h₂ (S : ℝ → Set (EuclideanSpace ℝ (Fin 2))) (hS : S = fun R => ball 0 R) (I : ℝ → ℝ) (hI :  I = fun R =>    ∫ (p : EuclideanSpace ℝ (Fin 2)) in S R,      (1 + 2 * p 0 ^ 2) / (1 + p 0 ^ 4 + 6 * p 0 ^ 2 * p 1 ^ 2 + p 1 ^ 4) - (1 + p 1 ^ 2) / (2 + p 0 ^ 4 + p 1 ^ 4)) (h₁ :  ∀ (R : ℝ),    ∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball 0 R) R,        (1 + 2 * p 0 ^ 2) / (1 + p 0 ^ 4 + 6 * p 0 ^ 2 * p 1 ^ 2 + p 1 ^ 4) - (1 + p 1 ^ 2) / (2 + p 0 ^ 4 + p 1 ^ 4) =      0) : Tendsto
    (fun R =>
      ∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball 0 R) R,
        (1 + 2 * p 0 ^ 2) / (1 + p 0 ^ 4 + 6 * p 0 ^ 2 * p 1 ^ 2 + p 1 ^ 4) - (1 + p 1 ^ 2) / (2 + p 0 ^ 4 + p 1 ^ 4))
    atTop (𝓝 0) :=
  by
  have h₃ :
    (fun R =>
        (∫ (p : EuclideanSpace ℝ (Fin 2)) in (fun R => ball (0 : EuclideanSpace ℝ (Fin 2)) R) R,
          ((1 + 2 * (p 0) ^ 2) / (1 + (p 0) ^ 4 + 6 * (p 0) ^ 2 * (p 1) ^ 2 + (p 1) ^ 4) -
            (1 + (p 1) ^ 2) / (2 + (p 0) ^ 4 + (p 1) ^ 4)))) =
      fun _ => 0 := by sorry
  rw [h₃]
  simpa using tendsto_const_nhds