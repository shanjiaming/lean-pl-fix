theorem h₂ (S : Finset ℕ) (h₀ : ∀ (n : ℕ), n ∈ S ↔ n + 2 ∣ 3 * (n + 3) * (n ^ 2 + 9)) (h₁ : S = {1, 11, 37}) : ∑ n ∈ S, n = 49 := by
  --  rw [h₁]
  --  norm_num <;> rfl
  hole