theorem h₇₂ (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (k : ℕ) (p : ℤ) (hk₀ : 0 < k) (hk₁ : k ≤ n) (hk₂ : |(↑k : ℝ) * α - (↑p : ℝ)| < 1 / ((↑n : ℝ) + 1)) (h₂ : (↑k : ℤ) > 0) (h₃ : (↑k : ℤ) ≤ (↑n : ℤ)) (h₄ : |(↑k : ℝ) * α - (↑p : ℝ)| < 1 / ((↑n : ℝ) + 1)) (h₅ : 0 < (↑k : ℝ)) (h₆ : (↑k : ℝ) ≤ (↑n : ℝ)) (h₇₁ : |(↑k : ℝ) * α - (↑p : ℝ)| < 1 / ((↑n : ℝ) + 1)) : |α - (↑p : ℝ) / (↑k : ℝ)| = |(↑k : ℝ) * α - (↑p : ℝ)| / (↑k : ℝ) := by
  field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;> ring_nf <;>
        field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;>
      ring_nf at * <;>
    linarith