theorem h2 (h_max : IsMaxOn (fun f => ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * f x - x * f x ^ 2) {f | Continuous f} sorry) : ∫ (x : ℕ) in Set.Icc 0 1, x ^ 2 * sorry - x * sorry ^ 2 ≥ 1 / 16 :=
  by
  have h₂ : Continuous (fun x : ℝ => x / 2 : ℝ → ℝ) := by sorry
  have h₃ : (fun f : ℝ → ℝ => ∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) (fun x : ℝ => x / 2) = 1 / 16 := by sorry
  have h₄ : (∫ x in Set.Icc 0 1, (x ^ 2 * f x - x * f x ^ 2)) ≥ 1 / 16 := by sorry
  --  exact h₄
  hole