theorem limit_of_function  : sorry :=
  by
  have h₁ : Tendsto (fun y : ℝ => (Real.exp y - 1) / y) (𝓝 0) (𝓝 1) := by sorry
  have h₂ : Tendsto (fun x : ℝ => 8 * x) (𝓝[Set.Ioi 0] 0) (𝓝 0) := by sorry
  have h₃ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / (8 * x)) (𝓝[Set.Ioi 0] 0) (𝓝 1) := by sorry
  have h₄ : Tendsto (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by sorry
  have h₅ :
    (fun x : ℝ => (Real.exp (8 * x) - 1) / x) =ᶠ[𝓝[Set.Ioi 0] 0] (fun x : ℝ => 8 * ((Real.exp (8 * x) - 1) / (8 * x))) := by sorry
  have h₆ : Tendsto (fun x : ℝ => (Real.exp (8 * x) - 1) / x) (𝓝[Set.Ioi 0] 0) (𝓝 8) := by sorry
  --  exact h₆
  hole