theorem h₁ (x y z : ℕ) (h : x * y = z ^ 2 + 1) : x = 1 ∧ y = z ^ 2 + 1 ∨ x = z ^ 2 + 1 ∧ y = 1 ∨ ∃ a b, (↑x : ℤ) = a ^ 2 + b ^ 2 ∧ y = 1 :=
  by
  --  by_cases hx : x = 1
  --  · refine' Or.inl ⟨hx, _⟩
    have h₂ : y = z ^ 2 + 1 := by sorry
  --    exact h₂
  --  · by_cases hy : y = 1
  --    · by_cases hx' : x = z ^ 2 + 1
  --      · refine' Or.inr (Or.inl ⟨hx', hy⟩)
  --      · exfalso
        have h₂ : x * y = z ^ 2 + 1 := by sorry
        have h₃ : x = z ^ 2 + 1 := by sorry
  --        contradiction
  --    · exfalso
      have h₂ : x * y = z ^ 2 + 1 := by sorry
      have h₃ : x = z ^ 2 + 1 := by sorry
      have h₄ : x = z ^ 2 + 1 := by sorry
      have h₅ : y = 1 := by sorry
  --      contradiction
  hole