theorem h₄ (a : ℝ) (ha✝ ha : 0 < a) (h₁ : (fun x => √(a ^ 2 - x ^ 2)) = fun x => √(a ^ 2 - x ^ 2)) (h₃ : ∫ (x : ℝ) in 0 ..a, √(a ^ 2 - x ^ 2) = a ^ 2 * π / 4) : ∫ (x : ℝ) in Set.Icc 0 a, √(a ^ 2 - x ^ 2) = ∫ (x : ℝ) in 0 ..a, √(a ^ 2 - x ^ 2) := by
  simp [intervalIntegral.integral_of_le (by linarith : (0 : ℝ) ≤ a), Real.volume_Icc] <;>
        simp_all [Real.volume_Icc, ha.le] <;>
      norm_num <;>
    linarith
  hole