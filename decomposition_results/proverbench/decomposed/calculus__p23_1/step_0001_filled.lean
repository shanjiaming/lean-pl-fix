theorem sequence_rewrite (n✝ n : ℕ) : a_n n = (1 + (2 / 3) ^ n) / (3 * (1 - (2 / 3) ^ (n + 1))) :=
  by
  have h₁ : (3 : ℝ) ^ n + (2 : ℝ) ^ n = (3 : ℝ) ^ n * (1 + (2 / 3 : ℝ) ^ n) := by sorry
  have h₂ : (3 : ℝ) ^ (n + 1) - (2 : ℝ) ^ (n + 1) = (3 : ℝ) ^ (n + 1) * (1 - (2 / 3 : ℝ) ^ (n + 1)) := by sorry
  have h₃ : a_n n = ((3 : ℝ) ^ n + (2 : ℝ) ^ n) / ((3 : ℝ) ^ (n + 1) - (2 : ℝ) ^ (n + 1)) := by sorry
  have h₄ : a_n n = (1 + (2 / 3 : ℝ) ^ n) / (3 * (1 - (2 / 3 : ℝ) ^ (n + 1))) := by sorry
  rw [h₄] <;> norm_num <;> ring_nf <;> field_simp <;> ring_nf <;> norm_num <;> linarith
  hole