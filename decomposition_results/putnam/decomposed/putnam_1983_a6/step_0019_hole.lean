theorem h_final (F : ℝ → ℝ) (hF : F = fun a => a ^ 4 / rexp (a ^ 3) * ∫ (x : ℝ) in 0 ..a, ∫ (y : ℝ) in 0 ..a - x, rexp (x ^ 3 + y ^ 3)) (h_main :  Tendsto (fun a => a ^ 4 / rexp (a ^ 3) * ∫ (x : ℝ) in 0 ..a, ∫ (y : ℝ) in 0 ..a - x, rexp (x ^ 3 + y ^ 3)) atTop    (𝓝 (2 / 9))) : Tendsto F atTop (𝓝 (2 / 9)) := by
  rw [hF]
  have h₁ :
    Tendsto (fun a ↦ (a ^ 4 / exp (a ^ 3)) * ∫ x in (0)..a, ∫ y in (0)..(a - x), exp (x ^ 3 + y ^ 3)) atTop
      (𝓝 (2 / 9 : ℝ)) :=
    h_main
  exact h₁
  hole