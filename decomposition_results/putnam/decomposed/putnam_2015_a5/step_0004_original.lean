theorem h₃ (q Nq : ℕ) (qodd : Odd q) (qpos : q > 0) (hNq : (↑Nq : ℕ∞) = {a | 0 < a ∧ (↑a : ℝ) < (↑q : ℝ) / 4 ∧ a.gcd q = 1}.encard) (hq h₁ : q = 1) (h₂ : Nq = 0) : ¬Odd Nq := by
  rw [h₂]
  intro h
  cases' h with k hk
  omega