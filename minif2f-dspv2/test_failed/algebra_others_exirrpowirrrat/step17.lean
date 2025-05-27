theorem h₅ (h h₁ : Irrational (√2 ^ √2)) (h₂ : Irrational √2) (h₃ : √2 ^ √2 > 0) (h₄ : (√2 ^ √2) ^ √2 = 2) : ¬Irrational ((√2 ^ √2) ^ √2) :=
  by
  intro h₅₁
  have h₅₂ : Irrational (((Real.sqrt 2 ^ Real.sqrt 2 : ℝ) : ℝ) ^ Real.sqrt 2) := h₅₁
  have h₅₃ : (Irrational (2 : ℝ)) := by sorry
  exact h₅₃ ⟨2, by norm_num⟩