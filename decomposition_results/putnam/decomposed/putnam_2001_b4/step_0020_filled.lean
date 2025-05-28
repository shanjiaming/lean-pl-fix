theorem h₁₈ (S : Set ℚ) (hS : S = univ \ {-1, 0, 1}) (f : ↑S → ↑S) (hf : ∀ (x : ↑S), ↑(f x) = ↑x - 1 / ↑x) (x : ↑S) (h : ∀ n ∈ Ici 1, x ∈ f^[n] '' univ) (h₃ : 1 ∈ Ici 1 → x ∈ f^[1] '' univ) (h₄ : 2 ∈ Ici 1 → x ∈ f^[2] '' univ) (y₁ : ↑S) (left✝¹ : y₁ ∈ univ) (hy₁ : f^[1] y₁ = x) (y₂ : ↑S) (left✝ : y₂ ∈ univ) (hy₂ : f^[2] y₂ = x) (h₇ : f y₁ = x) (h₈ : f (f y₂) = x) (h₉ : f y₁ = f (f y₂)) (h₁₀ : ↑(f y₁) = ↑(f (f y₂))) (h₁₁ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) (h₁₂ h₁₃ : ↑y₁ = ↑(f y₂)) (h₁₄ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₅ : ↑(f y₁) = ↑(f (f y₂))) (h₁₆ : ↑(f y₁) = ↑y₁ - 1 / ↑y₁) (h₁₇ : ↑y₁ - 1 / ↑y₁ = ↑(f y₂) - 1 / ↑(f y₂)) : ↑y₁ = ↑(f y₂) :=
  by
  have h₁₃ : (y₁ : ℚ) - 1 / (y₁ : ℚ) = (f y₂ : ℚ) - 1 / (f y₂ : ℚ) := h₁₁
  have h₁₄ : (y₁ : ℚ) = (f y₂ : ℚ) := by sorry
  exact h₁₄
  hole