theorem consecutive_cubes_difference_implies_square : ((n + 1) ^ 3 - n ^ 3 = n ^ 2) → ∃ k : ℕ, k ^ 2 = 2 * n - 1:=
  by
  --  intro h
  have h₁ : n = 0:= by
    --  match n with
    --  | 0 => rfl
    --  | n + 1 =>
    --    have h₂ := h
    --    simp [Nat.mul_sub_left_distrib, Nat.mul_sub_right_distrib, Nat.mul_add, Nat.add_mul, Nat.pow_succ, Nat.add_assoc,
    --          Nat.add_sub_cancel_left] at h₂ <;>
    --        ring_nf at h₂ ⊢ <;>
    --      omega
    hole
  have h₂ : False:= by
    --  rw [h₁] at h
    norm_num at h <;> contradiction
    hole
  have h₃ : ∃ k : ℕ, k ^ 2 = 2 * n - 1:= by
    --  exfalso
    --  exact h₂
    hole
  --  exact h₃
  hole