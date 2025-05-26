theorem h6 (S : Set ℚ) (hSadd : ∀ a ∈ S, ∀ b ∈ S, a + b ∈ S) (hSprod : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (hScond : ∀ (r : ℚ), (r ∈ S ∨ -r ∈ S ∨ r = 0) ∧ ¬(r ∈ S ∧ -r ∈ S) ∧ ¬(r ∈ S ∧ r = 0) ∧ ¬(-r ∈ S ∧ r = 0)) (h1 : 1 ∈ S) (h2 : ∀ (n : ℕ), (↑n : ℚ) ≥ 1 → (↑n : ℚ) ∈ S) (h3 : ∀ n > 0, 1 / (↑n : ℚ) ∈ S) (h4 : ∀ r > 0, r ∈ S) (h5 : ∀ r ∈ S, r > 0) : S = {r | r > 0} := by
  apply Set.ext
  intro r
  constructor
  · intro h
    have h₁ : r > 0 := h5 r h
    exact h₁
  · intro h
    have h₁ : r > 0 := h
    have h₂ : r ∈ S := h4 r h₁
    exact h₂