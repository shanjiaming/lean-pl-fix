theorem h₇₂ (α✝ : ℝ) (n✝ : ℕ) (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) (k : ℕ) (p : ℤ) (hk₀ : 0 < k) (hk₁ : k ≤ n) (hk₂ : |↑k * α - ↑p| < 1 / (↑n + 1)) (h₂ : ↑k > 0) (h₃ : ↑k ≤ ↑n) (h₄ : |↑k * α - ↑p| < 1 / (↑n + 1)) (h₅ : 0 < ↑k) (h₆ : ↑k ≤ ↑n) (h₇₁ : |↑k * α - ↑p| < 1 / (↑n + 1)) : |α - ↑p / ↑k| = |↑k * α - ↑p| / ↑k := by
  field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;> ring_nf <;>
        field_simp [h₅.ne', abs_div, abs_mul, abs_of_pos, h₅] <;>
      ring_nf at * <;>
    linarith