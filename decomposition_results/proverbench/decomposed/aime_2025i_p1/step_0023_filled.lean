theorem h₂ (S : Finset ℕ) (h₀ : ∀ (b : ℕ), b ∈ S ↔ b > 9 ∧ b + 7 ∣ 9 * b + 7) (h₁ : S = {21, 49}) : ∑ b ∈ S, b = 70 := by
  --  rw [h₁]
  --  norm_num <;> (try decide) <;>
    (try {norm_num <;> (try decide)
      })
  hole