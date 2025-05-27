theorem h₁ (n : ℕ) (h : (n + 1) ^ 3 - n ^ 3 = n ^ 2) : n = 0 := by
  --  match n with
  --  | 0 => rfl
  --  | n + 1 =>
  --    have h₂ := h
  --    simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_add, Nat.add_mul, Nat.pow_succ, Nat.add_assoc,
  --          Nat.add_sub_cancel_left] at h₂ <;>
  --        ring_nf at h₂ ⊢ <;>
  --      omega
  hole