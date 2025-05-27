theorem h₁ (R : Type) (inst✝ : Ring R) (h : ∀ (a : R), a ^ 3 = a) (a : R) : 2 • a * (2 • a * 2 • a) = 2 • a :=
  by
  have h₂ := h ((2 : ℕ) • a)
  simp [pow_three, mul_assoc, mul_add, add_mul, mul_comm, mul_left_comm, Nat.cast_add, Nat.cast_mul,
          Nat.cast_ofNat] at h₂ ⊢ <;>
        ring_nf at h₂ ⊢ <;>
      simp_all [h] <;>
    linarith
  hole