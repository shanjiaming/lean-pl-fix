theorem h_sum1 (R : Type ?u.1622) (inst✝¹ : Ring R) (inst✝ : CharZero R) (e g f : R) (he : IsIdempotentElem e) (hg : IsIdempotentElem g) (hf : IsIdempotentElem f) (hsum : e + g + f = 0) (hf_eq : f = -e - g) (h_eg_comm : g * e = e * g) : e + e * g + g = 0 := by
  have h₁ : f = -e - g := hf_eq
  have h₂ : e + g + f = 0 := hsum
  have h₃ : f * f = f := hf
  have h₄ : g * g = g := hg
  have h₅ : e * e = e := he
  have h₆ : g * e = e * g := h_eg_comm
  rw [h₁] at h₃
  have h₇ : (-e - g) * (-e - g) = -e - g := by sorry
  have h₈ : e + e * g + g = 0 := by sorry
  exact h₈ <;> simp_all [sub_mul, mul_sub, add_mul, mul_add] <;> nlinarith
  hole