theorem h₁ (conspiratorial : Set ℤ → Prop) (hconspiratorial :  ∀ (S : Set ℤ),    conspiratorial S ↔      ∀ a ∈ S,        ∀ b ∈ S, ∀ c ∈ S, (a > 0 ∧ b > 0 ∧ c > 0) ∧ (a ≠ b ∧ b ≠ c ∧ a ≠ c → a.gcd b > 1 ∨ b.gcd c > 1 ∨ a.gcd c > 1)) : sorry :=
  by
  have h₂ : (∃ (S : Set ℤ), S ⊆ Icc 1 16 ∧ conspiratorial S ∧ S.encard = 11) := by sorry
  simpa using h₂