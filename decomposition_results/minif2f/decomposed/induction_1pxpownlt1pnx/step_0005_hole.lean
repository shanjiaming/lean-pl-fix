theorem h₂ (x : ℝ) (n : ℕ) (h₀ : -1 < x) (h₁ : 0 < n) (h_base : 1 + 1 * x ≤ (1 + x) ^ 1) (k : ℕ) (hk_pos : 0 < k) (hk_ineq : 1 + ↑k * x ≤ (1 + x) ^ k) (h₁_pos : 0 < 1 + x) : (1 + x) ^ (k + 1) = (1 + x) ^ k * (1 + x) := by
  --  ring_nf <;> field_simp [h₁_pos.ne'] <;> ring_nf <;> simp [pow_succ] <;> ring_nf
  hole