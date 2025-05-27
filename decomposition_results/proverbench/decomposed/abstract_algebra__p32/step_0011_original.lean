theorem h6 (R : Type ?u.1622) (inst✝¹ : Ring R) (inst✝ : CharZero R) (e g f : R) (he : IsIdempotentElem e) (hg : IsIdempotentElem g) (hf : IsIdempotentElem f) (hsum : e + g + f = 0) (hf_eq h1 : f = -e - g) (h2 : e + g + f = 0) (h3 : f * f = f) (h4 : g * g = g) (h5 : e * e = e) : g * e = e * g := by
  calc
    g * e = g * e := rfl
    _ = e * g :=
      by
      have h7 : e * g + g * g + f * g = 0 := by
        calc
          e * g + g * g + f * g = (e + g + f) * g := by ring
          _ = 0 * g := by rw [h2]
          _ = 0 := by simp
          _ = 0 := by simp
      have h8 : f * g = (-e - g) * g := by rw [h1]
      have h9 : f * g = (-e - g) * g := by rw [h1]
      rw [h8] at h7
      have h10 : e * g + g * g + (-e - g) * g = 0 := h7
      have h11 : e * g + g + (-e - g) * g = 0 := by
        calc
          e * g + g + (-e - g) * g = e * g + g * g + (-e - g) * g := by rw [h4] <;> ring_nf
          _ = 0 := by exact h10
          _ = 0 := by simp
      have h12 : e * g + g + (-e - g) * g = 0 := h11
      have h13 : g * e = e * g := by
        ring_nf at h12 ⊢ <;> simp_all [mul_comm, sub_mul, add_mul, mul_add, mul_sub, mul_assoc] <;> nlinarith
      exact h13
    _ = e * g := by rfl