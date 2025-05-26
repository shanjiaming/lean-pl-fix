theorem h1 (S : Set ℚ) (hSadd : ∀ a ∈ S, ∀ b ∈ S, a + b ∈ S) (hSprod : ∀ a ∈ S, ∀ b ∈ S, a * b ∈ S) (hScond : ∀ (r : ℚ), (r ∈ S ∨ -r ∈ S ∨ r = 0) ∧ ¬(r ∈ S ∧ -r ∈ S) ∧ ¬(r ∈ S ∧ r = 0) ∧ ¬(-r ∈ S ∧ r = 0)) : 1 ∈ S := by
  have h₁ : (1 : ℚ) ∈ S ∨ (-1 : ℚ) ∈ S ∨ (1 : ℚ) = 0 := (hScond 1).1
  have h₂ : ¬((1 : ℚ) ∈ S ∧ (-1 : ℚ) ∈ S) := (hScond 1).2.1
  have h₃ : ¬((1 : ℚ) ∈ S ∧ (1 : ℚ) = 0) := (hScond 1).2.2.1
  have h₄ : ¬((-1 : ℚ) ∈ S ∧ (1 : ℚ) = 0) := (hScond 1).2.2.2
  have h₅ : (1 : ℚ) ≠ 0 := by sorry
  have h₆ : (-1 : ℚ) ∉ S := by sorry
  --  cases h₁ with
  --  | inl h₁ => exact h₁
  --  | inr h₁ =>
  --    cases h₁ with
  --    | inl h₁ =>
  --      exfalso
  --      apply h₆
  --      exact h₁
  --    | inr h₁ =>
  --      exfalso
  --      norm_num at h₁ ⊢ <;> simp_all
  hole