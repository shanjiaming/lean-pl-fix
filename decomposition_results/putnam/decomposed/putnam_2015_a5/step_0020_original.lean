theorem h_q_gt_one (q Nq : ℕ) (qodd : Odd q) (qpos : q > 0) (hNq : ↑Nq = {a | 0 < a ∧ ↑a < ↑q / 4 ∧ a.gcd q = 1}.encard) (h_q_eq_one : q = 1 → (Odd Nq ↔ ∃ p k, q = p ^ k ∧ k > 0 ∧ Nat.Prime p ∧ (p % 8 = 5 ∨ p % 8 = 7))) : q > 1 → (Odd Nq ↔ ∃ p k, q = p ^ k ∧ k > 0 ∧ Nat.Prime p ∧ (p % 8 = 5 ∨ p % 8 = 7)) :=
  by
  intro hq_gt_one
  have h₁ : Odd Nq ↔ ∃ p k : ℕ, q = p ^ k ∧ k > 0 ∧ p.Prime ∧ (p % 8 = 5 ∨ p % 8 = 7) := by sorry
  exact h₁