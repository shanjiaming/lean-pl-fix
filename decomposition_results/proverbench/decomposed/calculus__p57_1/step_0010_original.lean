theorem h₁₀ (x✝ x : ℝ) (h₃ : HasDerivAt (fun x => x + 1) 1 x) (h₄ : HasDerivAt (fun x => √(5 * x ^ 2 + 35)) (5 * x / √(5 * x ^ 2 + 35)) x) (h₈ : HasDerivAt (fun x => x + 1) 1 x) (h₉ : HasDerivAt (fun x => √(5 * x ^ 2 + 35)) (5 * x / √(5 * x ^ 2 + 35)) x) : HasDerivAt f ((1 * √(5 * x ^ 2 + 35) - (x + 1) * (5 * x / √(5 * x ^ 2 + 35))) / √(5 * x ^ 2 + 35) ^ 2) x :=
  by
  convert HasDerivAt.div h₈ h₉ (by positivity) using 1 <;> field_simp [f, add_comm] <;> ring_nf <;>
      field_simp [f, add_comm] <;>
    nlinarith [Real.sqrt_nonneg (5 * x ^ 2 + 35), Real.sq_sqrt (show 0 ≤ 5 * x ^ 2 + 35 by nlinarith)]