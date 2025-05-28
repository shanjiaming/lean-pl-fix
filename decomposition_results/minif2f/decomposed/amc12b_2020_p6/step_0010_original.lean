theorem h₇ (n : ℕ) (h₀ : 9 ≤ n) (h₂ : (n + 2)! = (n + 2) * (n + 1) * n !) (h₃ : (n + 1)! = (n + 1) * n !) (h₄ : ↑(n + 2)! = ↑(n + 2) * ↑(n + 1) * ↑n !) (h₅ : ↑(n + 1)! = ↑(n + 1) * ↑n !) (h₆ : ↑(n + 2)! - ↑(n + 1)! = ↑(n + 1) ^ 2 * ↑n !) : ↑(n + 1) ^ 2 = (↑(n + 2)! - ↑(n + 1)!) / ↑n ! :=
  by
  rw [h₆]
  have h₈ : (n ! : ℝ) ≠ 0 := by sorry
  field_simp [h₈] <;> ring_nf <;> norm_cast <;> simp [Nat.mul_assoc, Nat.mul_comm, Nat.mul_left_comm] <;> ring_nf <;>
      norm_num <;>
    linarith