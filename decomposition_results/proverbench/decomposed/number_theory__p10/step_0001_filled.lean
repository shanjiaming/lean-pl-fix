theorem dirichlet_theorem' (α✝ : ℝ) (n✝ : ℕ) (α : ℝ) (hα : Irrational α) (n : ℕ) (hn : 0 < n) : ∃ p q, 0 < q ∧ q ≤ ↑n ∧ |α - ↑p / ↑q| < 1 / ((↑n + 1) * ↑q) :=
  by
  have h_main : ∃ (k : ℕ) (p : ℤ), 0 < k ∧ k ≤ n ∧ |(k : ℝ) * α - p| < 1 / (n + 1 : ℝ) := by sorry
  obtain ⟨k, p, hk₀, hk₁, hk₂⟩ := h_main
  have h₁ : ∃ (q : ℤ), 0 < q ∧ q ≤ n ∧ |α - (p : ℝ) / q| < 1 / ((n + 1 : ℝ) * q) := by sorry
  obtain ⟨q, hq₀, hq₁, hq₂⟩ := h₁
  refine' ⟨p, q, by exact hq₀, by exact_mod_cast hq₁, _⟩
  simpa [div_eq_mul_inv, mul_assoc] using hq₂
  hole