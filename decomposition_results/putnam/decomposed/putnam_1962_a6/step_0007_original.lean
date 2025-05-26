theorem h2 (S : Set ℚ) (hSadd : ∀ a ∈ S, ∀ b ∈ S, a + b ∈ S) (hSprod : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (hScond : ∀ (r : ℚ), (r ∈ S ∨ -r ∈ S ∨ r = 0) ∧ ¬(r ∈ S ∧ -r ∈ S) ∧ ¬(r ∈ S ∧ r = 0) ∧ ¬(-r ∈ S ∧ r = 0)) (h1 : 1 ∈ S) : ∀ (n : ℕ), (↑n : ℚ) ≥ 1 → (↑n : ℚ) ∈ S := by
  intro n hn
  have h : ∀ n : ℕ, (n : ℚ) ≥ 1 → (n : ℚ) ∈ S := by sorry
  exact h n hn