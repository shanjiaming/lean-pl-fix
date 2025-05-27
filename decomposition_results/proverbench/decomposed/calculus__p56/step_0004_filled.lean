theorem h1₂ (f : ℝ → ℝ) (hf : Continuous f) (h_max : IsMaxOn (fun f => ∫ (x : ℝ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} f) : (fun x => x ^ 2 * f x - x * f x ^ 2) = fun x => x ^ 3 / 4 - x * (f x - x / 2) ^ 2 :=
  by
  --  funext x
  have h1₃ : x ^ 2 * f x - x * f x ^ 2 = x ^ 3 / 4 - x * (f x - x / 2) ^ 2 := by sorry
  --  rw [h1₃]
  hole