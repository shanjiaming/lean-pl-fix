theorem h₂ (a b : ℝ) (h₁ : |a + b| ≤ |a| + |b|) : ∀ (x y : ℝ), 0 ≤ x → x ≤ y → x / (1 + x) ≤ y / (1 + y) :=
  by
  --  intro x y hx hxy
  have h₃ : 0 ≤ x := hx
  have h₄ : x ≤ y := hxy
  have h₅ : 0 ≤ y := by sorry
  have h₆ : 0 ≤ 1 + x := by sorry
  have h₇ : 0 ≤ 1 + y := by sorry
  have h₈ : 0 < 1 + x := by sorry
  have h₉ : 0 < 1 + y := by sorry
  have h₁₀ : x / (1 + x) ≤ y / (1 + y) := by sorry
  --  exact h₁₀
  hole