theorem h₃ (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) (a : R) (h₁ : 2 • a * (2 • a * 2 • a) = 2 • a) : 6 • a = 0 := by
  have h₄ := h ((2 : ℕ) • a)
  simp [pow_three, mul_assoc, mul_add, add_mul, mul_comm, mul_left_comm, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at h₁ h₄ ⊢ <;>
        ring_nf at h₁ h₄ ⊢ <;>
      simp_all [h] <;>
    linarith