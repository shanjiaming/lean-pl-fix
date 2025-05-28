theorem h₆ (n : ℕ) (h₀ : 9 ≤ n) (h₂ : (n + 2)! = (n + 2) * (n + 1) * n !) (h₃ : (n + 1)! = (n + 1) * n !) (h₄ : ↑(n + 2)! = ↑(n + 2) * ↑(n + 1) * ↑n !) (h₅ : ↑(n + 1)! = ↑(n + 1) * ↑n !) : ↑(n + 2)! - ↑(n + 1)! = ↑(n + 1) ^ 2 * ↑n ! := by
  --  --  --  --  --  rw [h₄, h₅] <;> norm_num <;> ring_nf <;> norm_cast <;> simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] <;>
  --            ring_nf <;>
  --          norm_num <;>
  --        simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] <;>
  --      ring_nf <;>
  --    norm_num
  hole