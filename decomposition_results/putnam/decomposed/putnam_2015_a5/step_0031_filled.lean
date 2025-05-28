theorem h₁ (q Nq : ℕ) (qodd : Odd q) (qpos : q > 0) (hNq : ↑Nq = {a | 0 < a ∧ ↑a < ↑q / 4 ∧ a.gcd q = 1}.encard) (h_q_eq_one : q = 1 → (Odd Nq ↔ ∃ p k, q = p ^ k ∧ k > 0 ∧ Nat.Prime p ∧ (p % 8 = 5 ∨ p % 8 = 7))) (h_q_gt_one : q > 1 → (Odd Nq ↔ ∃ p k, q = p ^ k ∧ k > 0 ∧ Nat.Prime p ∧ (p % 8 = 5 ∨ p % 8 = 7))) (h : ¬q = 1) : q > 1 := by
  --  by_contra h₁
  have h₂ : q ≤ 1 := by sorry
  have h₃ : q = 1 := by sorry
  --  contradiction
  omega