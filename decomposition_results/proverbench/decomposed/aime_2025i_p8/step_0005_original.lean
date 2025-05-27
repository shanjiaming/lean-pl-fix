theorem h₃ (ans : ℚ) (S : Finset ℝ) (h₀ : ∀ (k : ℝ), k ∈ S ↔ ∃! z, (25 + 20 * Complex.I - z).abs = 5 ∧ (z - 4 - ↑k).abs = (z - 3 * Complex.I - ↑k).abs) (answer : ↑ans = ∑ k ∈ S, k) (h₁ : ans = 73 / 4) (h₂ : ans.num = 73) : ans.den = 4 := by
  have h₄ : ans = 73 / 4 := h₁
  rw [h₄] <;> norm_num [Rat.den_div_eq_of_mod_eq_two] <;> rfl