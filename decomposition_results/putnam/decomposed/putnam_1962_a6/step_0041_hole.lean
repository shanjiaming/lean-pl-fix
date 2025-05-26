theorem h₃ (S : Set ℚ) (hSadd : ∀ a ∈ S, ∀ b ∈ S, a + b ∈ S) (hSprod : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (hScond : ∀ (r : ℚ), (r ∈ S ∨ -r ∈ S ∨ r = 0) ∧ ¬(r ∈ S ∧ -r ∈ S) ∧ ¬(r ∈ S ∧ r = 0) ∧ ¬(-r ∈ S ∧ r = 0)) (h1 : 1 ∈ S) (h2 : ∀ (n : ℕ), (↑n : ℚ) ≥ 1 → (↑n : ℚ) ∈ S) (h3 : ∀ n > 0, 1 / (↑n : ℚ) ∈ S) (r : ℚ) (hr h₄ : r > 0) (m n : ℕ) (hm : m > 0) (hn : n > 0) (h₁ : r = (↑m : ℚ) / (↑n : ℚ)) : (↑m : ℚ) ≥ 1 ∨ (↑m : ℚ) < 1 := by
  --  by_cases h₄ : (m : ℚ) ≥ 1
  --  · exact Or.inl h₄
  --  · exact Or.inr (by linarith)
  hole