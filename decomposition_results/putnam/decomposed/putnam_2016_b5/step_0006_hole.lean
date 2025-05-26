theorem h₆ (f : (↑(Set.Ioi 1) : Type) → (↑(Set.Ioi 1) : Type)) (c : ℝ) (hc : c > 0) (hf : ∀ (x : (↑(Set.Ioi 1) : Type)), (↑(f x) : ℝ) = (↑x : ℝ) ^ c) (x y : (↑(Set.Ioi 1) : Type)) (hxy : (↑x : ℝ) ^ 2 ≤ (↑y : ℝ) ∧ (↑y : ℝ) ≤ (↑x : ℝ) ^ 3) (h₁ : (↑(f x) : ℝ) = (↑x : ℝ) ^ c) (h₂ : (↑(f y) : ℝ) = (↑y : ℝ) ^ c) (h₃ : (↑x : ℝ) ^ 2 ≤ (↑y : ℝ)) (h₄ : (↑y : ℝ) ≤ (↑x : ℝ) ^ 3) (h₅ : 1 < (↑x : ℝ)) : 1 < (↑y : ℝ) := by
  have h₇ : (1 : ℝ) < (x : ℝ) := x.2
  have h₈ : (x : ℝ) ^ 2 ≤ (y : ℝ) := hxy.1
  have h₉ : (1 : ℝ) < (x : ℝ) ^ 2 := by sorry
  --  nlinarith
  hole