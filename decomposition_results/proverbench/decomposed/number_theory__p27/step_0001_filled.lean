theorem no_division (x y k m n : ℕ+) (h : ∃ z, (↑x : ℕ) ^ (↑m : ℕ) + (↑y : ℕ) ^ (↑n : ℕ) = (↑z : ℕ)) : ¬4 * k * x * y - 1 ∣ sorry := by
  --  obtain ⟨z, hz⟩ := h
  have h₁ : (4 * k * x * y : ℕ) ≥ 4 := by sorry
  have h₂ : (4 * k * x * y - 1 : ℕ) ≥ 3 := by sorry
  have h₃ : (z : ℕ) = (x : ℕ) ^ (m : ℕ) + (y : ℕ) ^ (n : ℕ) := by sorry
  have h₄ : (z : ℕ) ≥ 2 := by sorry
  --  by_contra h₅
  have h₆ : (4 * k * x * y - 1 : ℕ) ∣ (z : ℕ) := by sorry
  have h₇ : False := by sorry
  --  contradiction
  hole