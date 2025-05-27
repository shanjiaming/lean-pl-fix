theorem h₄ (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) (h6 : ∀ (a : R), 6 • a = 0) (a b : R) (h₁ : (a + b) ^ 3 = a + b) (h₂ : (a - b) ^ 3 = a - b) (h₃ : (a + b) ^ 3 - (a - b) ^ 3 = a + b - (a - b)) : (a + b) ^ 3 - (a - b) ^ 3 = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) := by
  calc
    (a + b) ^ 3 - (a - b) ^ 3 = (a + b) ^ 3 - (a - b) ^ 3 := rfl
    _ = 2 * (a ^ 2 * b + a * b * a + b * a ^ 2 + b ^ 3) := by
      ring_nf <;> simp [sub_eq_add_neg, add_assoc, add_comm, add_left_comm, mul_comm, mul_assoc, mul_left_comm] <;>
        abel_nf